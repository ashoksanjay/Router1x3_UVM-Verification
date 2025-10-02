class router_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(router_scoreboard)
	uvm_tlm_analysis_fifo #(write_xtn) fifo_wrh;
	uvm_tlm_analysis_fifo #(read_xtn) fifo_rdh[];
	
	write_xtn wr_data;
	read_xtn rd_data;
	
	write_xtn write_cov;
	read_xtn read_cov;
	
	router_env_config m_cfg;
	int data_verified_count;
	
	covergroup router_fcov1;
		option.per_instance = 1;
		
		CHANNEL: coverpoint write_cov.header[1:0]{
			bins des0 = {2'b00};
			bins des1 = {2'b01};
			bins des2 = {2'b10};
		}
		PAYLOAD_SIZE: coverpoint write_cov.header[7:2]{
			bins small_pkt = {[1:15]};
			bins med_pkt = {[16:30]};
			bins large_pkt = {[31:63]};
		}
		BAD_PKT: coverpoint write_cov.error{
			bins bad_pkt = {0};
		}
		CHANNEL_X_PAYLOAD_SIZE: cross CHANNEL, PAYLOAD_SIZE;
	endgroup
	
	covergroup router_fcov2;
		option.per_instance = 1;
		
		CHANNEL: coverpoint write_cov.header[1:0]{
			bins des0 = {2'b00};
			bins des1 = {2'b01};
			bins des2 = {2'b10};
		}
		PAYLOAD_SIZE: coverpoint write_cov.header[7:2]{
			bins small_pkt = {[1:15]};
			bins med_pkt = {[16:30]};
			bins large_pkt = {[31:63]};
		}
		BAD_PKT: coverpoint write_cov.error{
			bins bad_pkt = {0};
		}
		CHANNEL_X_PAYLOAD_SIZE: cross CHANNEL, PAYLOAD_SIZE;
	endgroup
	
	function new(string name = "router_scoreboard", uvm_component parent);
		super.new(name, parent);
		router_fcov1 = new();
		router_fcov2 = new();
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db #(router_env_config)::get(this, "", "router_env_config", m_cfg))
			`uvm_fatal(get_type_name(), "Error while getting config");
		wr_data = write_xtn::type_id::create("wr_data");
		rd_data = read_xtn::type_id::create("rd_data");
		fifo_wrh = new("fifo_wrh", this);
		fifo_rdh = new[m_cfg.no_of_des_agent];
		
		foreach(fifo_rdh[i]) begin
			fifo_rdh[i] = new($sformatf("fifo_rdh[%0d]", i), this);
		end

	endfunction
	
	task run_phase(uvm_phase phase);
		fork
			begin
				forever
					begin
						fifo_wrh.get(wr_data);
						`uvm_info("WRITE_SB", "write_data", UVM_LOW);
						wr_data.print();
						write_cov = wr_data;
						router_fcov1.sample();
					end
			end
			begin
				forever
					begin
						fork : A
							begin
								fifo_rdh[0].get(rd_data);
								`uvm_info("READ_SB", "Read_data", UVM_LOW);
								rd_data.print();
								check_data(rd_data);
								read_cov = rd_data;
								router_fcov2.sample();
							end
							begin
								fifo_rdh[1].get(rd_data);
								`uvm_info("READ_SB", "Read_data", UVM_LOW);
								rd_data.print();
								check_data(rd_data);
								read_cov = rd_data;
								router_fcov2.sample();
							end
							begin
								fifo_rdh[2].get(rd_data);
								`uvm_info("READ_SB", "Read_data", UVM_LOW);
								rd_data.print();
								check_data(rd_data);
								read_cov = rd_data;
								router_fcov2.sample();
							end
						join_any
						disable A;
					end
			end
		join
	endtask
	
	function void check_data(read_xtn rd);
		if(wr_data.header == rd.header) begin
			`uvm_info("SB", "Header compared successfully", UVM_LOW);
		end else begin
			`uvm_error("SB", "Header comparison failed");
		end
		
		if(wr_data.payload_data == rd.payload_data) begin
			`uvm_info("SB", "Payload matched successfully", UVM_LOW);
		end else begin
			`uvm_error("SB", "Payload comparison failed");
		end
		
		if(wr_data.parity == rd.parity) begin
			`uvm_info("SB", "Parity matched", UVM_LOW);
		end else begin
			`uvm_error("SB", "Parity mismatched");
		end
		data_verified_count++;
	endfunction
	
	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("Number of data verified : %0d", data_verified_count), UVM_LOW);
	endfunction
	
endclass
