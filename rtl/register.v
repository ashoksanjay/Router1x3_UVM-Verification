//`timescale 1ns / 1ps

module register(
	clk, resetn, pkt_valid, data_in, fifo_full, rst_int_reg, detect_add, ld_state, lfd_state, laf_state, full_state, parity_done, low_pkt_valid, error, dout
    );
	 input clk, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, ld_state, laf_state, full_state, lfd_state;
	 input [7:0] data_in;
	 output reg parity_done, low_pkt_valid, error;
	 output reg [7:0] dout;
	 
	 reg [7:0] header, int_reg, int_parity, ext_parity;
	 
	 always @(posedge clk) begin  // for dout
		if(!resetn) begin
			int_reg <= 0;
			header <= 0;
			dout <= 0;
		end
		else if(pkt_valid && detect_add && (data_in[1:0] != 2'b11)) begin
			header <= data_in;
		end
		else if(lfd_state) begin
			dout <= header;
		end
		else if(ld_state & !fifo_full) begin
			dout <= data_in;
		end
		else if(ld_state & fifo_full) begin
			int_reg <= data_in;
		end
		else if(laf_state) begin
			dout <= int_reg;
		end
	 end
	 
	 always @(posedge clk) begin  //for low_pkt_valid
		if(!resetn || rst_int_reg) begin
			low_pkt_valid <= 0;
		end
		else if(ld_state & !pkt_valid) begin
			low_pkt_valid <= 1;
		end
	 end
	 
	 always @(posedge clk) begin  //parity_done
		if(~resetn) begin
			parity_done <= 0;
		end
		else if(detect_add) begin
			parity_done <= 0;
		end
		else if((ld_state && !fifo_full && !pkt_valid) || (laf_state && low_pkt_valid && !parity_done)) begin
			parity_done <= 1;
		end
	 end
	 
	 always @(posedge clk) begin  //internal parity conditions
		if(~resetn) begin
			int_parity <= 0;
		end
		else if(detect_add) begin
			int_parity <= 0;
		end
		else if(lfd_state & pkt_valid) begin
			int_parity <= int_parity ^ header;
		end
		else if(ld_state & pkt_valid & !full_state) begin
			int_parity <= int_parity ^ data_in;
		end
		else begin
			int_parity <= int_parity;
		end	
	 end
	 
	 always @(posedge clk) begin  // external parity
		if(~resetn) begin
			ext_parity <= 0;
		end
		else if(detect_add) begin
			ext_parity <= 0;
		end
		else if((ld_state & !fifo_full & !pkt_valid) | (laf_state & !parity_done & low_pkt_valid)) begin
			ext_parity <= data_in;
		end
	 end
	 
	 always @(posedge clk) begin
		if(!resetn) begin
			error <= 0;
		end
		else if(parity_done) begin
			if(int_parity == ext_parity) begin
				error <= 0;
			end
			else if(int_parity != ext_parity) begin
				error <= 1;
			end
		end
		else 
			error <= 0;
	 end

endmodule
