package router_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "write_xtn.sv"
    `include "read_xtn.sv"
    
    `include "router_sc_config.sv"
    `include "router_des_config.sv"
	`include "router_env_config.sv"

	`include "router_des_seq.sv"
    `include "router_des_driver.sv"
    `include "router_des_monitor.sv"
    `include "router_des_sequencer.sv"
	`include "router_des_agent.sv"
	`include "router_des_agent_top.sv"
	
	`include "router_sc_seq.sv"
    `include "router_sc_sequencer.sv"
    `include "router_sc_driver.sv"
    `include "router_sc_monitor.sv"
	`include "router_sc_agent.sv"
	`include "router_sc_agent_top.sv"

    `include "router_virtual_sequencer.sv"
    `include "router_virtual_seq.sv"
	`include "router_scoreboard.sv"

    `include "router_tb.sv"
    `include "router_test.sv"

endpackage