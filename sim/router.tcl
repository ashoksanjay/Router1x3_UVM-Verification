remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog "../rtl/fifo.v ../rtl/fsm.v ../rtl/register.v ../rtl/synchronizer.v ../rtl/top_module.v"

elaborate router1x3

link 

check_design

current_design  router1x3

compile_ultra -no_autoungroup

write_file -f verilog -hier -output ../report/router_netlist.v
