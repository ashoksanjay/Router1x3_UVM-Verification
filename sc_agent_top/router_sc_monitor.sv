class router_sc_monitor extends uvm_monitor;
    `uvm_component_utils(router_sc_monitor)
	
	uvm_analysis_port #(write_xtn) monitor_port;
	virtual router_if.SC_MON_MP vif;
	router_sc_config m_cfg;

    function new(string name = "router_sc_monitor", uvm_component parent);
        super.new(name, parent);
		monitor_port = new("monitor_port", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
		if(!uvm_config_db #(router_sc_config)::get(this, "", "router_sc_config", m_cfg))
            `uvm_fatal("SC_MONITOR", "Failed to get config in sc_driver");
    endfunction
	
	function void connect_phase(uvm_phase phase);
		vif = m_cfg.vif;
	endfunction
	
	task run_phase(uvm_phase phase);
		forever
			collect_data();
	endtask
	
	task collect_data();
		write_xtn mon_data;
		begin
			mon_data = write_xtn::type_id::create("mon_data");
			@(vif.sc_mon_cb);
			
			wait(vif.sc_mon_cb.pkt_valid && !vif.sc_mon_cb.busy)
			
			mon_data.header = vif.sc_mon_cb.data_in;
			mon_data.payload_data = new[mon_data.header[7:2]];
			@(vif.sc_mon_cb);
			
			foreach(mon_data.payload_data[i]) begin
				wait(vif.sc_mon_cb.busy == 0)
				mon_data.payload_data[i] = vif.sc_mon_cb.data_in;
				@(vif.sc_mon_cb);
			end
			
			wait(!vif.sc_mon_cb.pkt_valid && !vif.sc_mon_cb.busy)
			
			mon_data.parity = vif.sc_mon_cb.data_in;
			repeat(2) @(vif.sc_mon_cb);
			
			mon_data.error = vif.sc_mon_cb.error;
			m_cfg.mon_data_count++;
			
			`uvm_info("ROUTER_SC_MONITOR", $sformatf("Printing for monitor\n %s", mon_data.sprint()), UVM_LOW);
			monitor_port.write(mon_data);
			
		end
	endtask
	
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("No of data driven : %0d", m_cfg.mon_data_count), UVM_LOW);
	endfunction
	
endclass