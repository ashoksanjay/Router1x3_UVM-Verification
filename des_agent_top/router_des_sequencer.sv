class router_des_sequencer extends uvm_sequencer #(read_xtn);
    `uvm_component_utils(router_des_sequencer)

    function new(string name = "router_des_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
endclass

