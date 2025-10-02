class router_des_monitor extends uvm_monitor;
    `uvm_component_utils(router_des_monitor)
	
	virtual router_if.DES_MON_MP vif;
	router_des_config m_cfg;
	read_xtn mon_data;
	
	uvm_analysis_port #(read_xtn) monitor_port;
	

    function new(string name = "router_des_monitor", uvm_component parent);
        super.new(name, parent);
		monitor_port = new("monitor_port", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
		if(!uvm_config_db #(router_des_config)::get(this, "", "router_des_config", m_cfg))
			`uvm_fatal("ROUTER_DES_MONITOR", "Error while getting config");
    endfunction
	
	function void connect_phase(uvm_phase phase);
		vif = m_cfg.vif;
	endfunction
	
	task run_phase(uvm_phase phase);
		forever begin
			collect_data();
			end

	endtask
	
	task collect_data();
		read_xtn mon_data;
		mon_data = read_xtn::type_id::create("mon_data");
 
		@(vif.des_mon_cb); 
		@(vif.des_mon_cb); 
		wait(vif.des_mon_cb.read_enb == 1)
		@(vif.des_mon_cb);
		
		mon_data.header = vif.des_mon_cb.data_out;
		mon_data.payload_data = new[mon_data.header[7:2]];
		
		@(vif.des_mon_cb);
		foreach(mon_data.payload_data[i]) begin
			mon_data.payload_data[i] = vif.des_mon_cb.data_out;
			@(vif.des_mon_cb);
		end
		mon_data.parity = vif.des_mon_cb.data_out;
		`uvm_info("ROUTER_DES_MONITOR", $sformatf("Printing packet from des monitor\n %s", mon_data.sprint()), UVM_LOW);
		@(vif.des_mon_cb);
		monitor_port.write(mon_data);
		m_cfg.mon_data_count++;
	endtask
	
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("No of data driven : %0d", m_cfg.mon_data_count), UVM_LOW);
	endfunction
endclass