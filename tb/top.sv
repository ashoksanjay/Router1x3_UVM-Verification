module top;

    import uvm_pkg::*;
    import router_pkg::*;
    `include "uvm_macros.svh"
    
    bit clock;
	initial begin
		clock = 0;
     forever #5 clock = ~clock;
	end

    router_if sc_if0(clock);
    router_if des_if0(clock);
    router_if des_if1(clock);
    router_if des_if2(clock);

    router1x3 DUT(.clk(clock), .resetn(sc_if0.resetn), 
					.read_en0(des_if0.read_enb), .read_en1(des_if1.read_enb), .read_en2(des_if2.read_enb),
						.data_in(sc_if0.data_in), .pkt_valid(sc_if0.pkt_valid),
							.data_out0(des_if0.data_out), .data_out1(des_if1.data_out), .data_out2(des_if2.data_out),
								.valid_out0(des_if0.valid_out), .valid_out1(des_if1.valid_out), .valid_out2(des_if2.valid_out),
									.error(sc_if0.error), .busy(sc_if0.busy));

    initial begin
        uvm_config_db #(virtual router_if)::set(null, "*", "sc_if0", sc_if0);
        uvm_config_db #(virtual router_if)::set(null, "*", "des_if0", des_if0);
        uvm_config_db #(virtual router_if)::set(null, "*", "des_if1", des_if1);
        uvm_config_db #(virtual router_if)::set(null, "*", "des_if2", des_if2);

        run_test();
    end
	
	property pkt_valid_prpty;
		@(posedge clock)
		$rose(sc_if0.pkt_valid) |=> sc_if0.busy;
	endproperty
	
	PKT_VALID: assert property(pkt_valid_prpty);
	
	property stable_prpty;
		@(posedge clock)
		sc_if0.busy |=> $stable(sc_if0.data_in);
	endproperty
	
	STABLE: assert property(stable_prpty);
	
	property read10_prpty;
		@(posedge clock)
		$rose(des_if0.valid_out) |=> ##[0:29] des_if0.read_enb;
	endproperty
	
	READ1_0: assert property(read10_prpty);
	
	property read11_prpty;
		@(posedge clock)
		$rose(des_if1.valid_out) |=> ##[0:29] des_if1.read_enb;
	endproperty
	
	READ1_1: assert property(read11_prpty);
	
	property read12_prpty;
		@(posedge clock)
		$rose(des_if2.valid_out) |=> ##[0:29] des_if2.read_enb;
	endproperty
	
	READ1_2: assert property(read12_prpty);
	
	
	property read00_prpty;
		@(posedge clock)
		$fell(des_if0.valid_out) |=> $fell(des_if0.read_enb);
	endproperty
	
	READ0_0: assert property(read00_prpty);
	
	property read01_prpty;
		@(posedge clock)
		$fell(des_if1.valid_out) |=> $fell(des_if1.read_enb);
	endproperty
	
	READ0_1: assert property(read01_prpty);
	
	property read02_prpty;
		@(posedge clock)
		$fell(des_if2.valid_out) |=> $fell(des_if2.read_enb);
	endproperty
	
	READ0_2: assert property(read02_prpty);
	
	property valid1_prpty;
		bit [1:0] addr;
		@(posedge clock)
		($rose(sc_if0.pkt_valid), addr=sc_if0.data_in[1:0]) ##3(addr == 0) |-> des_if0.valid_out;
	endproperty
	
	VALID0: assert property(valid1_prpty);
	
	property valid2_prpty;
		bit [1:0] addr;
		@(posedge clock)
		($rose(sc_if0.pkt_valid), addr=sc_if0.data_in[1:0]) ##3(addr == 1) |-> des_if1.valid_out;
	endproperty
	
	VALID1: assert property(valid2_prpty);
	
	property valid3_prpty;
		bit [1:0] addr;
		@(posedge clock)
		($rose(sc_if0.pkt_valid), addr=sc_if0.data_in[1:0]) ##3(addr == 2) |-> des_if2.valid_out;
	endproperty
	
	VALID2: assert property(valid3_prpty);
	

endmodule