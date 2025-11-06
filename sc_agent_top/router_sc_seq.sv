class router_sc_seq extends uvm_sequence #(write_xtn);
    `uvm_object_utils(router_sc_seq)

    function new(string name = "router_sc_seq");
        super.new(name);
    endfunction

endclass

class small_pkt_seq extends router_sc_seq;
    `uvm_object_utils(small_pkt_seq)

    bit [1:0] addr;

    function new(string name = "small_pkt_seq");
        super.new(name);
    endfunction

    task body();
        if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
            `uvm_fatal(get_full_name(), "Error while getting addr");

        req = write_xtn::type_id::create("req");
        
        start_item(req);
        assert(req.randomize() with {header[7:2] inside {[1:15]}; header[1:0] == addr;});
        `uvm_info("ROUTER_SC_SEQUENCE", $sformatf("Printing from sequence\n %s", req.sprint()), UVM_HIGH);
        finish_item(req);
        
    endtask

endclass

class medium_pkt_seq extends router_sc_seq;
    `uvm_object_utils(medium_pkt_seq)

    bit [1:0] addr;

    function new(string name = "medium_pkt_seq");
        super.new(name);
    endfunction

    task body();
        if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
            `uvm_fatal(get_full_name(), "Error while getting addr");
        req = write_xtn::type_id::create("req");
        
        start_item(req);
        assert(req.randomize() with {header[7:2] inside {[16:29]}; header[1:0] == addr;});
        `uvm_info("ROUTER_SC_SEQUENCE", $sformatf("Printing from sequence\n %s", req.sprint()), UVM_HIGH);
        finish_item(req);
    endtask

endclass

class big_pkt_seq extends router_sc_seq;
    `uvm_object_utils(big_pkt_seq)
	
	bit[1:0] addr;

    function new(string name = "big_pkt_seq");
        super.new(name);
    endfunction

    task body();
        if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
            `uvm_fatal(get_full_name(), "Error while getting addr");
        req = write_xtn::type_id::create("req");
        
        start_item(req);
        assert(req.randomize() with {header[7:2] inside {[30:61]};header[1:0] == addr;});

        `uvm_info("ROUTER_SC_SEQUENCE", $sformatf("Printing from sequence\n %s", req.sprint()), UVM_HIGH);
        finish_item(req);
    endtask

endclass