class router_env_config extends uvm_object;
    `uvm_object_utils(router_env_config)

    bit has_sc_agent = 1;
    bit has_des_agent = 1;
    bit has_virtual_sequencer = 1;
	bit has_scoreboard = 1;
    int no_of_sc_agent;
    int no_of_des_agent;
    int no_of_duts;

    router_sc_config m_sc_cfg[];
    router_des_config m_des_cfg[];
	
	uvm_event_pool event_pool = uvm_event_pool::get_global_pool();

    function new(string name = "router_env_config");
        super.new(name);
    endfunction
endclass