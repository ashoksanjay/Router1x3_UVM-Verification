class router_des_seq extends uvm_sequence #(read_xtn);
	`uvm_object_utils(router_des_seq)
	
	function new(string name = "router_des_seq");
		super.new(name);
	endfunction
endclass

class dest_seq1 extends router_des_seq;
	`uvm_object_utils(dest_seq1)
	
	function new(string name = "dest_seq1");
		super.new(name);
	endfunction
	
	task body();
		req = read_xtn::type_id::create("req");
		start_item(req);
		assert(req.randomize() with {no_of_cycle inside {[1:29]};});
		finish_item(req);
	endtask
	
endclass

/*
class dest_seq1 extends router_des_seq;
	`uvm_object_utils(dest_seq1)
	
	function new(string name = "dest_seq1");
		super.new(name);
	endfunction
	
	task body();
		req = read_xtn::type_id::create("req");
		start_item(req);
		assert(req.randomize() with {no_of_cycle inside {[29:40]};});
		finish_item(req);
	endtask
	
endclass
*/
