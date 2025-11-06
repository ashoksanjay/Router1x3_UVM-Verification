class router_des_driver extends uvm_driver #(read_xtn);
    `uvm_component_utils(router_des_driver)
	
	virtual router_if.DES_DRV_MP vif;
	router_des_config m_cfg;

    function new(string name = "router_des_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
		if(!uvm_config_db #(router_des_config)::get(this, "", "router_des_config", m_cfg))
			`uvm_fatal("ROUTER_DES_DRIVER", "Error while getting config");
    endfunction
	
	function void connect_phase(uvm_phase phase);
		vif = m_cfg.vif;
	endfunction
	
	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			send_to_dut(req);
			seq_item_port.item_done();
		end
	endtask
	
	task send_to_dut(read_xtn xtn);
		`uvm_info("ROUTER_DES_DRIVER", $sformatf("Printing from des driver\n %s", xtn.sprint()), UVM_LOW);
		@(vif.des_drv_cb)
		wait(vif.des_drv_cb.valid_out == 1)
		
		repeat(xtn.no_of_cycle) @(vif.des_drv_cb);
		
		vif.des_drv_cb.read_enb <= 1;
		
		wait(vif.des_drv_cb.valid_out == 0)
		//@(vif.des_drv_cb)
		
		vif.des_drv_cb.read_enb <= 0;
		
		//repeat(2) 
		@(vif.des_drv_cb);
		m_cfg.drv_data_count++;
	endtask
	
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("No of data driven : %0d", m_cfg.drv_data_count), UVM_LOW);
	endfunction
	
endclass