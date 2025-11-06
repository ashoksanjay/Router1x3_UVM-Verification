#Liberty files are needed for logical and physical netlist designs
set search_path "./"
set link_library " "

set_app_var enable_lint true

configure_lint_tag -enable -tag "W241" -goal lint_rtl
configure_lint_tag -enable -tag "W240" -goal lint_rtl

configure_lint_setup -goal lint_rtl

analyze -verbose -format verilog "../rtl/register.v ../rtl/top_module.v ../rtl/fifo.v ../rtl/fsm.v ../rtl/synchronizer.v"

waive_lint -tag STARC05-2.5.1.2 -add clock_waive

elaborate router1x3

check_lint

report_lint -verbose -file ../report/report_lint_router.txt