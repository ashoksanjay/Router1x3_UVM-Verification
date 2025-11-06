class router_tb extends uvm_env;
    `uvm_component_utils(router_tb)

    router_sc_agent_top sc_agent_top;
    router_des_agent_top des_agent_top;
    router_env_config m_cfg;

    router_virtual_sequencer vseqrh;
	router_scoreboard sb_h;

    function new(string name = "router_tb", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db #(router_env_config)::get(this, "", "router_env_config", m_cfg))
            `uvm_fatal("ROUTER_ENV", "Error in getting env config");
			
		if(m_cfg.has_sc_agent) begin
            sc_agent_top = router_sc_agent_top::type_id::create("sc_agent_top", this);
        end
		
		if(m_cfg.has_des_agent) begin
            des_agent_top = router_des_agent_top::type_id::create("des_agent_top", this);
        end

        if(m_cfg.has_virtual_sequencer) begin
            vseqrh = router_virtual_sequencer::type_id::create("vseqrh", this);
        end
		
		if(m_cfg.has_scoreboard) begin
			sb_h = router_scoreboard::type_id::create("sb_h", this);
		end

    endfunction

    function void connect_phase(uvm_phase phase);
        if(m_cfg.has_virtual_sequencer) begin
            if(m_cfg.has_sc_agent) begin
                for(int i = 0; i<m_cfg.no_of_sc_agent; i++) begin
                    vseqrh.sc_seqrh[i] = sc_agent_top.agent[i].seqrh;
                end
            end

            if(m_cfg.has_des_agent) begin
                for(int i = 0; i<m_cfg.no_of_des_agent; i++) begin
                    vseqrh.des_seqrh[i] = des_agent_top.agent[i].seqrh;
                end
            end
        end
		
		if(m_cfg.has_scoreboard) begin
			if(m_cfg.has_sc_agent) begin
				sc_agent_top.agent[0].monh.monitor_port.connect(sb_h.fifo_wrh.analysis_export);
			end
			if(m_cfg.has_des_agent) begin
				for(int i = 0; i<m_cfg.no_of_des_agent; i++) begin
					des_agent_top.agent[i].monh.monitor_port.connect(sb_h.fifo_rdh[i].analysis_export);
				end
			end
		end 
    endfunction


endclass