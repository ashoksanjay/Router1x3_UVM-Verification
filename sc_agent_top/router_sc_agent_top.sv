class router_sc_agent_top extends uvm_env;
    `uvm_component_utils(router_sc_agent_top)

    router_sc_agent agent[];
    router_env_config m_cfg;
    //router_virtual_sequencer vseqrh;

    function new(string name = "router_sc_agent_top", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(router_env_config)::get(this, "", "router_env_config", m_cfg))
            `uvm_fatal("SC_AGENT_TOP", "Error while getting env_config in sc_top");
        agent = new[m_cfg.no_of_sc_agent];
        foreach(agent[i]) begin
            agent[i] = router_sc_agent::type_id::create($sformatf("agent[%0d]", i), this);
            uvm_config_db #(router_sc_config)::set(this, $sformatf("agent[%0d]*", i), "router_sc_config", m_cfg.m_sc_cfg[i]);
        end
    endfunction
/*
    function void connect_phase(uvm_phase phase);
        if(m_cfg.has_virtual_sequencer) begin
            foreach(agent[i]) begin
                vseqrh.sc_seqrh[i] = agent[i].seqrh;
            end
        end
    endfunction
*/
    
endclass