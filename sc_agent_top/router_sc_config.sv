class router_sc_config extends uvm_object;
    `uvm_object_utils(router_sc_config)

    uvm_active_passive_enum is_active = UVM_ACTIVE;
    virtual router_if vif;
	
	uvm_event_pool event_pool;
	
	static int drv_data_count;
	static int mon_data_count;

    function new(string name = "router_sc_config");
        super.new(name);
    endfunction
    
endclass