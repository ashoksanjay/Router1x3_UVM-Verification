class router_des_config extends uvm_object;
    `uvm_object_utils(router_des_config)

    uvm_active_passive_enum is_active = UVM_ACTIVE;
    virtual router_if vif;
	
	static int drv_data_count;
	static int mon_data_count;
	
	uvm_event_pool event_pool;

    function new(string name = "router_des+_config");
        super.new(name);
    endfunction
endclass