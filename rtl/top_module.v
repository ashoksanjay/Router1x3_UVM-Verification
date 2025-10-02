//`timescale 1ns / 1ps

module router1x3(
    input clk,
    input resetn,
    input read_en0,
    input read_en1,
    input read_en2,
    input [7:0] data_in,
    input pkt_valid,
    output [7:0] data_out0,
    output [7:0] data_out1,
    output [7:0] data_out2,
    output valid_out0,
    output valid_out1,
    output valid_out2,
    output error,
    output busy
    );
	 
	 //fifo
	 //wire soft_reset_0, soft_reset_1, soft_reset_2, full_0, full_1, full_2, empty_0, empty_1, empty_2;
	 //wire lfd_state;
	 wire [2:0] write_enb;
	 wire [7:0] d_in;
	 
	 // 1 Syn
	 //wire write_reg_enb;
	 //wire detect_add;
	 //wire fifo_full;
	 
	 //fsm
	 //wire parity_done, low_pkt_valid, ld_state, laf_state, full_state, rst_int_reg;
	 
	 
	 // 3 FIF0
	 fifo fifo_0 (
		.clk(clk), 
		.resetn(resetn), 
		.soft_reset(soft_reset_0),
		.wr_enb(write_enb[0]), 
		.rd_enb(read_en0), 
		.lfd_state(lfd_state), 
		.data_in(d_in), 
		.data_out(data_out0), 
		.full(full_0), 
		.empty(empty_0)
	);
	
	fifo fifo_1 (
		.clk(clk), 
		.resetn(resetn), 
		.soft_reset(soft_reset_1), 
		.wr_enb(write_enb[1]), 
		.rd_enb(read_en1), 
		.lfd_state(lfd_state), 
		.data_in(d_in), 
		.data_out(data_out1), 
		.full(full_1), 
		.empty(empty_1)
	);
	
	fifo fifo_2 (
		.clk(clk), 
		.resetn(resetn), 
		.soft_reset(soft_reset_2), 
		.wr_enb(write_enb[2]), 
		.rd_enb(read_en2), 
		.lfd_state(lfd_state), 
		.data_in(d_in), 
		.data_out(data_out2), 
		.full(full_2), 
		.empty(empty_2)
	);
	 
	 
	 synchronizer_router sync(
		.clk(clk),
		.resetn(resetn),
		.detect_add(detect_add),
		.data_in(data_in[1:0]),
		.write_enb_reg(write_reg_enb),
		.empty0(empty_0),
		.empty1(empty_1),
		.empty2(empty_2),
		.full0(full_0),
		.full1(full_1),
		.full2(full_2),
		.read_enb0(read_en0),
		.read_enb1(read_en1),
		.read_enb2(read_en2),
		.write_enb(write_enb),
		.valid_out0(valid_out0),
		.valid_out1(valid_out1),
		.valid_out2(valid_out2),
		.soft_reset0(soft_reset_0),
		.soft_reset1(soft_reset_1),
		.soft_reset2(soft_reset_2),
		.fifo_full(fifo_full)
	 );
	 
	 fsm fsm1 (
		.clk(clk), 
		.resetn(resetn), 
		.pkt_valid(pkt_valid), 
		.data_in(data_in[1:0]), 
		.fifo_full(fifo_full), 
		.fifo_empty0(empty_0), 
		.fifo_empty1(empty_1), 
		.fifo_empty2(empty_2), 
		.parity_done(parity_done), 
		.soft_reset0(soft_reset_0), 
		.soft_reset1(soft_reset_1), 
		.soft_reset2(soft_reset_2), 
		.low_pkt_valid(low_pkt_valid), 
		.busy(busy), 
		.detect_add(detect_add), 
		.lfd_state(lfd_state), 
		.ld_state(ld_state), 
		.laf_state(laf_state), 
		.full_state(full_state), 
		.write_enb_reg(write_reg_enb), 
		.rst_int_reg(rst_int_reg)
	);
	
	
	register reg1 (
		.clk(clk), 
		.resetn(resetn), 
		.pkt_valid(pkt_valid), 
		.data_in(data_in), 
		.fifo_full(fifo_full), 
		.rst_int_reg(rst_int_reg), 
		.detect_add(detect_add), 
		.ld_state(ld_state), 
		.lfd_state(lfd_state), 
		.laf_state(laf_state), 
		.full_state(full_state), 
		.parity_done(parity_done), 
		.low_pkt_valid(low_pkt_valid), 
		.error(error), 
		.dout(d_in)
	);


endmodule
