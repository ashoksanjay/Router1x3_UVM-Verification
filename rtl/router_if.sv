interface router_if(input bit clock);
	bit resetn;
	
	bit pkt_valid;  //source 
	logic [7:0] data_in; 
	bit error, busy; 
	
	bit read_enb; //dest 
	bit valid_out;
	logic [7:0] data_out;
	
	//for router: i/p: reset, pkt_valid, data_in, read_enb.... o/p error, busy, valid_out, data_out
	
	clocking sc_drv_cb @(posedge clock);
		default input #1 output #1;
		output resetn, pkt_valid, data_in;
		input error, busy;
	endclocking
	
	clocking sc_mon_cb @(posedge clock);
		default input #1 output #1;
		input resetn, pkt_valid, data_in;
		input error, busy;
	endclocking
	
	clocking des_drv_cb @(posedge clock);
		default input #1 output #1;
		output read_enb;
		input valid_out;
	endclocking
	
	clocking des_mon_cb @(posedge clock);
		default input #1 output #1;
		input read_enb;
		input data_out;
	endclocking	
	
	modport SC_DRV_MP(clocking sc_drv_cb);
	modport SC_MON_MP(clocking sc_mon_cb);
	modport DES_DRV_MP(clocking des_drv_cb);
	modport DES_MON_MP(clocking des_mon_cb);
	
endinterface