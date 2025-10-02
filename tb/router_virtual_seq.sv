class router_vseq_base extends uvm_sequence #(uvm_sequence_item);
    `uvm_object_utils(router_vseq_base)

    router_sc_sequencer sc_seqrh[];
    router_des_sequencer des_seqrh[];


    router_virtual_sequencer vseqrh;
    router_env_config m_cfg;

    //sequence instancess write here
    small_pkt_seq small_seq;
    medium_pkt_seq medium_seq;
    big_pkt_seq big_seq;
	
	dest_seq1 des_seq;

    function new(string name = "router_vseq_base");
        super.new(name);
    endfunction

    task body();
        if(!uvm_config_db #(router_env_config)::get(null,get_full_name(), "router_env_config", m_cfg))
            `uvm_fatal("VIRTUAL_SEQUENCE", "Error while getting env_config in vseq");
        sc_seqrh = new[m_cfg.no_of_sc_agent];
        des_seqrh = new[m_cfg.no_of_des_agent];

        assert($cast(vseqrh, m_sequencer)) else begin
            `uvm_fatal("VIRTUAL_SEQUENCE", "Error while casting in vseq");
        end
        if(m_cfg.has_sc_agent) begin
            foreach (sc_seqrh[i]) begin
                sc_seqrh[i] = vseqrh.sc_seqrh[i];
            end
        end

        if(m_cfg.has_des_agent) begin
			foreach(des_seqrh[i])
                des_seqrh[i] = vseqrh.des_seqrh[i];
        end

    endtask

endclass

class small_pkt_vseq extends router_vseq_base;
    `uvm_object_utils(small_pkt_vseq)
	
	bit [1:0] addr;

    function new(string name = "small_pkt_vseq");
        super.new(name);
    endfunction

    task body();
        super.body();
		if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
			`uvm_fatal("VIRTUAL_SEQ", "Error while getting addr");
        small_seq = small_pkt_seq::type_id::create("small_seq");
		des_seq = dest_seq1::type_id::create("des_seq");
		fork
			begin
				if(m_cfg.has_sc_agent) begin
						small_seq.start(sc_seqrh[0]);
				end
			end
			begin
				if(m_cfg.has_des_agent) begin
					des_seq.start(des_seqrh[addr]);
				end
			end
		join
    endtask

endclass

class medium_pkt_vseq extends router_vseq_base;
    `uvm_object_utils(medium_pkt_vseq)
	
	bit [1:0] addr;

    function new(string name = "medium_pkt_vseq");
        super.new(name);
    endfunction

    task body();
        super.body();
		if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
			`uvm_fatal("VIRTUAL_SEQ", "Error while getting addr");
        medium_seq = medium_pkt_seq::type_id::create("medium_seq");
		des_seq = dest_seq1::type_id::create("des_seq");
		fork
			begin
				if(m_cfg.has_sc_agent) begin
						medium_seq.start(sc_seqrh[0]);
				end
			end
			begin
				if(m_cfg.has_des_agent) begin
					des_seq.start(des_seqrh[addr]);
				end
			end
		join

    endtask

endclass

class big_pkt_vseq extends router_vseq_base;
    `uvm_object_utils(big_pkt_vseq)
	
	bit [1:0] addr;

    function new(string name = "big_pkt_vseq");
        super.new(name);
    endfunction

    task body();
        super.body();
		if(!uvm_config_db #(bit[1:0])::get(null, get_full_name(), "bit[1:0]", addr))
			`uvm_fatal("VIRTUAL_SEQ", "Error while getting addr");
        big_seq = big_pkt_seq::type_id::create("big_seq");
        des_seq = dest_seq1::type_id::create("des_seq");
		fork
			begin
				if(m_cfg.has_sc_agent) begin
						big_seq.start(sc_seqrh[0]);
				end
			end
			begin
				if(m_cfg.has_des_agent) begin
					des_seq.start(des_seqrh[addr]);
				end
			end
		join
    endtask

endclass
