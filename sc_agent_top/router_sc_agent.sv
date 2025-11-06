class router_sc_agent extends uvm_agent;
    `uvm_component_utils(router_sc_agent)

    router_sc_sequencer seqrh;
    router_sc_driver drvh;
    router_sc_monitor monh;
    router_sc_config m_cfg;

    function new(string name = "router_sc_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(router_sc_config)::get(this, "", "router_sc_config", m_cfg))
            `uvm_fatal("SC_AGENT", "Error while getting sc_config");
        monh = router_sc_monitor::type_id::create("monh", this);
        if(m_cfg.is_active == UVM_ACTIVE) begin
            seqrh = router_sc_sequencer::type_id::create("seqrh", this);
            drvh = router_sc_driver::type_id::create("drvh", this);
        end
    endfunction
    
    function void connect_phase(uvm_phase phase);
        if(m_cfg.is_active == UVM_ACTIVE)
            drvh.seq_item_port.connect(seqrh.seq_item_export);
    endfunction

endclass