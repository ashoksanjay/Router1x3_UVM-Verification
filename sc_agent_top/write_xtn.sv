class write_xtn extends uvm_sequence_item;
    `uvm_object_utils(write_xtn)
    rand bit [7:0] header;
    rand bit [7:0] payload_data[];
    bit [7:0] parity;
    bit error;

    constraint c1{header[1:0] != 3;}
    constraint c2{payload_data.size == header[7:2];}
    constraint c3{payload_data.size != 0;}

    function void post_randomize();
        parity = 0 ^ header;
        foreach(payload_data[i]) begin
            parity = parity ^ payload_data[i];
        end
    endfunction

    function new(string name = "write_xtn");
        super.new(name);
    endfunction

    function void do_print(uvm_printer printer);
        super.do_print(printer);
        printer.print_field("Header", this.header, 8, UVM_BIN);
        foreach(payload_data[i])
            printer.print_field($sformatf("Payload_data[%0d]", i), this.payload_data[i], 8, UVM_HEX);
        printer.print_field("Parity", this.parity, 8, UVM_HEX);
		printer.print_field("Error", this.error, 1, UVM_BIN);
    endfunction
    
endclass