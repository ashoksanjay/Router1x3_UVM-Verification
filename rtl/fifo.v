//`timescale 1ns / 1ps

module fifo(clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state, data_in, data_out, full, empty);

	 parameter depth = 16, width = 9, addr_width = 4;
    input clk, resetn, wr_enb, rd_enb, lfd_state, soft_reset;
	 input [7:0] data_in;
	 output reg [7:0] data_out;
	 output full, empty;
	 
	 reg lfd_state_t;
	 reg [8:0] mem [0:15];
	 reg [4:0] rd_ptr, wr_ptr;
	 reg [4:0] count;
	 integer i;
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			lfd_state_t <= 0;
		end
		else begin
			lfd_state_t <= lfd_state;
		end
	 end
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			data_out <= 0;
			rd_ptr <= 0;
		end
		else if(soft_reset) begin
			data_out <= {width-1{1'bz}};
		end
		else if(rd_enb && (~empty)) begin
			data_out <= mem[rd_ptr[3:0]][7:0];
			rd_ptr <= rd_ptr + 1;
		end
		else if(count == 0) begin
			data_out <= 8'bz;
		end
	 end
	 
	 always @(posedge clk) begin
		if(~resetn || soft_reset) begin
			for(i = 0 ; i < depth; i = i+1) begin
				mem[i] <= 0;
			end
			wr_ptr <= 0;
		end
		else if(wr_enb && (~full)) begin
			mem[wr_ptr[3:0]] <= {lfd_state_t, data_in};
			wr_ptr <= wr_ptr + 1;
		end
	 end

	always @(posedge clk) begin
		if(~resetn || soft_reset) begin
			count <= 0;
		end
		else begin
			case ({rd_enb && (~empty), wr_enb && (~full)})
				2'b10: count <= count - 1;   // read only
				2'b01: count <= count + 1;   // write only
				2'b11: count <= count;       // read & write -> no change
				default: count <= count;     // idle
			endcase
		end
        end

	 
	 assign full = (wr_ptr == {~rd_ptr[4], rd_ptr[3:0]})?1'b1 : 1'b0;
	 assign empty = (wr_ptr == rd_ptr)?1'b1 : 1'b0;

endmodule
