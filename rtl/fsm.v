//`timescale 1ns / 1ps

module fsm(clk, resetn, pkt_valid, data_in, fifo_full, fifo_empty0, fifo_empty1, fifo_empty2, parity_done, soft_reset0, soft_reset1, soft_reset2, low_pkt_valid, 
		busy, detect_add, lfd_state, ld_state, laf_state, full_state, write_enb_reg, rst_int_reg
    );
	 
	 input clk, resetn, pkt_valid, fifo_full, fifo_empty0, fifo_empty1, fifo_empty2, parity_done, soft_reset0, soft_reset1, soft_reset2, low_pkt_valid;
	 input [1:0] data_in;
	 output busy, detect_add, lfd_state, ld_state, laf_state, full_state, write_enb_reg, rst_int_reg;
	 
	 parameter DECODE_ADDRESS = 3'b000,
				  LOAD_FIRST_DATA = 3'b001,
				  WAIT_TILL_EMPTY = 3'b010,
				  LOAD_DATA = 3'b011,
				  FIFO_FULL_STATE = 3'b100,
				  LOAD_AFTER_FULL = 3'b101,
				  LOAD_PARITY = 3'b110,
				  CHECK_PARITY_ERROR = 3'b111;
				  
	reg [2:0] state, next_state;
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			state <= DECODE_ADDRESS;
		end else if((soft_reset0 && (data_in == 2'b00)) || (soft_reset1 && (data_in == 2'b01)) || (soft_reset2 && (data_in == 2'b10))) begin
			state <= DECODE_ADDRESS;
		end else begin
			state <= next_state;
		end
	end
	
	always @(*) begin
		case(state)
			3'b000 : begin
				if((pkt_valid & (data_in == 2'b00) & fifo_empty0)| 
					(pkt_valid & (data_in == 2'b01) & fifo_empty1)|
					(pkt_valid & (data_in == 2'b10) & fifo_empty2)) begin
					
					next_state = LOAD_FIRST_DATA;
				end
				else if((pkt_valid & (data_in == 0) & !fifo_empty0)|
				(pkt_valid & (data_in == 1) & !fifo_empty1)|
				(pkt_valid & (data_in == 2) & !fifo_empty2)) begin
					next_state = WAIT_TILL_EMPTY;
				end
				else begin
					next_state = DECODE_ADDRESS;
				end
		end
			3'b001 : begin   //LOAD_FIRST_DATA
				next_state = LOAD_DATA;
		end
			3'b010 : begin   //WAIT_TILL_EMPTY
				if((fifo_empty0 &&(data_in == 2'b00)) || (fifo_empty1 && (data_in == 2'b01)) || (fifo_empty2 && (data_in == 2'b10))) begin
					next_state = LOAD_FIRST_DATA;
				end
				else begin
					next_state = WAIT_TILL_EMPTY;
				end
		end
			3'b011 : begin    //LOAD_DATA
				if(fifo_full) begin
					next_state = FIFO_FULL_STATE;
				end
				else begin
					if(!fifo_full & !pkt_valid) begin
						next_state = LOAD_PARITY;
					end
					else begin
					next_state = LOAD_DATA;
					end
				end
				
		end
			3'b100 : begin     //FIFO_FULL_STATE
				
				if(!fifo_full) begin
					next_state = LOAD_AFTER_FULL;
				end
				else begin
					next_state = FIFO_FULL_STATE;
				end
		end
			3'b101 : begin   //LOAD_AFTER_FULL
				if(parity_done) begin
					next_state = DECODE_ADDRESS;
				end
				else if(!parity_done & !low_pkt_valid) begin
					next_state = LOAD_DATA;
				end
				else if(!parity_done & low_pkt_valid) begin
					next_state = LOAD_PARITY;
				end
		end
			3'b110 : begin    //LOAD_PARITY
				next_state = CHECK_PARITY_ERROR;
		end
			3'b111 : begin   //CHECK_PARITY_ERROR
				if(!fifo_full) begin
					next_state = DECODE_ADDRESS;
				end
				else begin
					next_state = FIFO_FULL_STATE;
				end
			end
			default : next_state = DECODE_ADDRESS;
		endcase
	end
	
	assign detect_add = (state == DECODE_ADDRESS);
	assign lfd_state = (state == LOAD_FIRST_DATA);
	assign ld_state = (state == LOAD_DATA);
	assign laf_state = (state == LOAD_AFTER_FULL);
	assign rst_int_reg = (state == CHECK_PARITY_ERROR);
	assign busy = ((state == FIFO_FULL_STATE || state == LOAD_AFTER_FULL || state == WAIT_TILL_EMPTY || state == LOAD_FIRST_DATA || state == LOAD_PARITY || state == CHECK_PARITY_ERROR) ? 1:0);
	assign full_state = (state == FIFO_FULL_STATE);
	assign write_enb_reg = ((state == LOAD_DATA) | (state == LOAD_PARITY) | (state == LOAD_AFTER_FULL));

endmodule
