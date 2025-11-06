class router_test_base extends uvm_test;
    `uvm_component_utils(router_test_base)

    router_tb envh;
    router_env_config m_cfg;

    router_sc_config m_sc_cfg[];
    router_des_config m_des_cfg[];

    bit has_sc_agent = 1;
    bit has_des_agent = 1;
    int no_of_des_agent = 3;
    int no_of_sc_agent = 1;
    
    //below30_vseq below_seqh;

    function new(string name = "router_test_base", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        m_cfg = router_env_config::type_id::create("m_cfg");
        if(has_sc_agent)
            m_cfg.m_sc_cfg = new[no_of_sc_agent];
        if(has_des_agent)
            m_cfg.m_des_cfg = new[no_of_des_agent];

        config_router();

        uvm_config_db #(router_env_config)::set(this, "*", "router_env_config", m_cfg);
        super.build_phase(phase);
        envh = router_tb::type_id::create("envh", this);
    endfunction

    function void config_router();
		if(has_des_agent) begin
            m_des_cfg = new[no_of_des_agent];
            foreach(m_des_cfg[i]) begin
                m_des_cfg[i] = router_des_config::type_id::create($sformatf("m_des_cfg[%0d]", i));

                if(!uvm_config_db #(virtual router_if)::get(this, "", $sformatf("des_if%0d", i), m_des_cfg[i].vif))
                    `uvm_fatal("TEST", "Error in getting destination interface");
				m_des_cfg[i].event_pool = m_cfg.event_pool;
                m_cfg.m_des_cfg[i] = m_des_cfg[i];
            end
        end
		
        if(has_sc_agent) begin
            m_sc_cfg = new[no_of_sc_agent];
            foreach(m_sc_cfg[i]) begin
                m_sc_cfg[i] = router_sc_config::type_id::create($sformatf("m_sc_cfg[%0d]", i));

                if(!uvm_config_db #(virtual router_if)::get(this, "", $sformatf("sc_if%0d", i), m_sc_cfg[i].vif))
                    `uvm_fatal("TEST", "Error in getting source interface");
				m_sc_cfg[i].event_pool = m_cfg.event_pool;
                m_cfg.m_sc_cfg[i] = m_sc_cfg[i];
            end
        end

        m_cfg.no_of_sc_agent = no_of_sc_agent;
        m_cfg.no_of_des_agent = no_of_des_agent;
        m_cfg.has_sc_agent = has_sc_agent;
        m_cfg.has_des_agent = has_des_agent;

    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction

endclass

class small_pkt_test extends router_test_base;
    `uvm_component_utils(small_pkt_test)

    small_pkt_vseq router_seq;
    bit[1:0] addr;

    function new(string name = "small_pkt_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
            repeat(10) 
			
			begin
				addr = {$random}%3;
				uvm_config_db #(bit[1:0])::set(null, "*", "bit[1:0]", addr);
				router_seq = small_pkt_vseq::type_id::create("router_seq");
				router_seq.start(envh.vseqrh);
			end

                #100;
        phase.drop_objection(this);
        
    endtask

endclass

class medium_pkt_test extends router_test_base;
    `uvm_component_utils(medium_pkt_test)

    bit[1:0] addr;
    medium_pkt_vseq router_seq;

    function new(string name="medium_pkt_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
            repeat(5) 
			begin
				addr = {$random}%3;
				uvm_config_db #(bit[1:0])::set(null, "*", "bit[1:0]", addr);
				router_seq = medium_pkt_vseq::type_id::create("router_seq");
				router_seq.start(envh.vseqrh);
			end
                #200;
        phase.drop_objection(this);
        
    endtask    

endclass

class big_pkt_test extends router_test_base;
    `uvm_component_utils(big_pkt_test)

    big_pkt_vseq router_seq;
	bit [1:0] addr;

    function new(string name="big_pkt_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
           repeat(5)
                begin
                    addr = {$random}%3;
                    uvm_config_db #(bit[1:0])::set(null, "*", "bit[1:0]", addr);
                    router_seq = big_pkt_vseq::type_id::create("router_seq");
                    router_seq.start(envh.vseqrh);
                end
                #100;
        phase.drop_objection(this);
        
    endtask

endclass

