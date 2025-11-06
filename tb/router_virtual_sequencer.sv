class router_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item);
    `uvm_component_utils(router_virtual_sequencer)

    router_sc_sequencer sc_seqrh[];
    router_des_sequencer des_seqrh[];

    router_env_config m_cfg;

    function new(string name = "router_virtual_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(router_env_config)::get(this, "", "router_env_config", m_cfg))
            `uvm_fatal("VIRTUAL_SEQUENCER", "Error while getting config");

        sc_seqrh = new[m_cfg.no_of_sc_agent];
        des_seqrh = new[m_cfg.no_of_des_agent];
        
    endfunction

endclass