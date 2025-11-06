class router_sc_driver extends uvm_driver #(write_xtn);
    `uvm_component_utils(router_sc_driver)

    virtual router_if.SC_DRV_MP vif;
    router_sc_config m_cfg;
	
    function new(string name = "router_sc_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(router_sc_config)::get(this, "", "router_sc_config", m_cfg))
            `uvm_fatal("SC_DRIVER", "Failed to get config in sc_driver");

    endfunction

    function void connect_phase(uvm_phase phase);
        vif = m_cfg.vif;
    endfunction

    task run_phase(uvm_phase phase);
		@(vif.sc_drv_cb);
			vif.sc_drv_cb.resetn <= 0;
		@(vif.sc_drv_cb);
			vif.sc_drv_cb.resetn <= 1;
        forever begin
            seq_item_port.get_next_item(req);
            send_to_dut(req);
            seq_item_port.item_done();
        end

    endtask

    task send_to_dut(write_xtn xtn);
		`uvm_info("ROUTER_SC_DRIVER", $sformatf("The packet in driver\n %s", xtn.sprint()), UVM_LOW);
        //first want to check busy is low
		@(vif.sc_drv_cb);
		wait(vif.sc_drv_cb.busy == 0)
		
		vif.sc_drv_cb.pkt_valid <= 1;
		//header
		vif.sc_drv_cb.data_in <= xtn.header;
		@(vif.sc_drv_cb);
		
		//payload_data
		foreach(xtn.payload_data[i]) begin
			//while(vif.sc_drv_cb.busy) @(vif.sc_drv_cb);
			wait(vif.sc_drv_cb.busy == 0)
			
			vif.sc_drv_cb.data_in <= xtn.payload_data[i];
			@(vif.sc_drv_cb);
		end
		
		//parity
		
		wait(vif.sc_drv_cb.busy == 0)
		vif.sc_drv_cb.pkt_valid <= 0;
		vif.sc_drv_cb.data_in <= xtn.parity;
		repeat(2) @(vif.sc_drv_cb);
		
		//error
		xtn.error = vif.sc_drv_cb.error;
		m_cfg.drv_data_count++;
		@(vif.sc_drv_cb);
		
		
    endtask
	
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("No of data driven : %0d", m_cfg.drv_data_count), UVM_LOW);
	endfunction
endclass