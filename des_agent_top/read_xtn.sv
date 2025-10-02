class read_xtn extends uvm_sequence_item;
    `uvm_object_utils(read_xtn)
	
	bit [7:0] header;
	bit [7:0] payload_data [];
	bit [7:0] parity;
	
	rand bit [5:0] no_of_cycle;

    function new(string name = "read_xtn");
        super.new(name);
    endfunction
	
	function void do_print(uvm_printer printer);
		super.do_print(printer);
		
		printer.print_field("Header", this.header, 8, UVM_BIN);
		foreach(payload_data[i])
            printer.print_field($sformatf("Payload_data[%0d]", i), this.payload_data[i], 8, UVM_HEX);
        printer.print_field("Parity", this.parity, 8, UVM_HEX);
		printer.print_field("no_of_cycle", this.no_of_cycle, 64, UVM_DEC);
	endfunction
endclass