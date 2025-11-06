class router_des_agent extends uvm_agent;
    `uvm_component_utils(router_des_agent)

    router_des_monitor monh;
    router_des_driver drvh;
    router_des_sequencer seqrh;
    router_des_config m_cfg;

    function new(string name = "router_des_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(router_des_config)::get(this, "", "router_des_config", m_cfg))
            `uvm_fatal("DES_AGENT", "Error while getting des_config");
        monh = router_des_monitor::type_id::create("monh", this);
        if(m_cfg.is_active == UVM_ACTIVE) begin
            seqrh = router_des_sequencer::type_id::create("seqrh", this);
            drvh = router_des_driver::type_id::create("drvh", this);
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        if(m_cfg.is_active == UVM_ACTIVE)
            drvh.seq_item_port.connect(seqrh.seq_item_export);
    endfunction
endclass