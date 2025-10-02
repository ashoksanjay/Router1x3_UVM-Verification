//`timescale 1ns / 1ps

 module synchronizer_router(clk, resetn, detect_add, data_in, write_enb_reg, empty0, empty1, empty2, full0, full1, full2, read_enb0, read_enb1, read_enb2,
								write_enb, valid_out0, valid_out1, valid_out2, soft_reset0, soft_reset1, soft_reset2, fifo_full);
	 
	input [1:0] data_in;
	input clk, resetn, detect_add, write_enb_reg, empty0, empty1, empty2, full0, full1, full2, read_enb0, read_enb1, read_enb2;
	output valid_out0, valid_out1, valid_out2;
	output reg soft_reset0, soft_reset1, soft_reset2, fifo_full;
	output reg [2:0] write_enb;
	 
	 reg [4:0] count0, count1, count2;
	 reg [1:0] data_in_temp;
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			data_in_temp <= 0;
		end else if(detect_add) begin
			data_in_temp <= data_in;
		end
	 end
	 
	 always @(*) begin
		case(data_in_temp)
			2'b00 : begin
				fifo_full = full0;
				if(write_enb_reg) begin
					write_enb = 3'b001;
				end else begin
					write_enb = 0;
				end
			end
			2'b01 : begin
				fifo_full <= full1;
				if(write_enb_reg) begin
					write_enb = 3'b010;
				end else begin
					write_enb = 0;
				end
			end
			2'b10 : begin
				fifo_full <= full2;
				if(write_enb_reg) begin
					write_enb = 3'b100;
				end else begin
					write_enb = 0;
				end
			end
			default : begin
				fifo_full = 0;
				write_enb = 0;
			end
		endcase
	 end
	 
	 assign valid_out0 = (~empty0);
	 assign valid_out1 = (~empty1);
	 assign valid_out2 = (~empty2);
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			soft_reset0 <= 0;
			count0 <= 0;
		end
		else if(valid_out0) begin
			if(~read_enb0) begin
				if(count0 >= 5'd29) begin
					soft_reset0 <= 1;
					count0 <= 0;
				end
				else begin
					soft_reset0 <= 0;
					count0 <= count0+1'b1;
				end
			end
			else begin
				count0 <= 0;
			end
		end
	 end
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			count1 <= 0;
			soft_reset1 <= 0;
		end
		else if(valid_out1) begin
			if(~read_enb1) begin
				if(count1 >= 29) begin
					soft_reset1 <= 1;
					count1 <= 0;
				end
				else begin
					soft_reset1 <= 0;
					count1 <= count1 + 1'b1;
				end
			end
			else begin
				count1 <= 0;
			end
		end
	 end
	 
	 always @(posedge clk) begin
		if(~resetn) begin
			count2 <= 0;
			soft_reset2 <= 0;
		end
		else if(valid_out2) begin
			if(~read_enb2) begin
				if(count2 >= 29) begin
					soft_reset2 <= 1;
					count2 <= 0;
				end
				else begin
					soft_reset2 <= 0;
					count2 <= count2 + 1'b1;
				end
			end
			else begin
				count2 <= 0;
			end
		end
	 end
	 
endmodule

