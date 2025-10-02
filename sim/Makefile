# SIMULATOR = Questa for Mentor's QuestaSim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = Questa

RTL        = ../rtl/*
INC        = +incdir+../sc_agent_top +incdir+../des_agent_top +incdir+../test +incdir+../packages +incdir+../tb
work       = work   # library name
SVTB1      = ../tb/top.sv
SVTB2      = ../test/router_pkg.sv
COVOP      = -coverage +cover=bcft
VSIMOPT    = -vopt -voptargs=+acc
VSIMCOV    = $(COVOP)
VSIMBATCH  = -c -do "log -r /* ; coverage save -onexit small_cov0; run -all; exit"
VSIMBATCH1 = -c -do "log -r /* ; coverage save -onexit med_cov0; run -all; exit"
VSIMBATCH2 = -c -do "log -r /* ; coverage save -onexit lar_cov0; run -all; exit"

help:
	@echo "================================================================================="
	@echo "! USAGE      --  make target                                                    !"
	@echo "! clean      =>  clean the earlier log and intermediate files.                  !"
	@echo "! sv_cmp     =>  Create library and compile the code.                           !"
	@echo "! run_test1  =>  Clean, compile & run the small packet test in batch mode.      !"
	@echo "! run_test2  =>  Clean, compile & run the medium packet test in batch mode.     !"
	@echo "! run_test3  =>  Clean, compile & run the big packet test in batch mode.        !"
	@echo "! view_wave1 =>  View waveform of small_pkt_test                                !"
	@echo "! view_wave2 =>  View waveform of medium_pkt_test                               !"
	@echo "! view_wave3 =>  View waveform of big_pkt_test                                  !"
	@echo "================================================================================="

clean       : clean_$(SIMULATOR)
sv_cmp      : sv_cmp_$(SIMULATOR)
run_test1   : run_test1_$(SIMULATOR)
run_test2   : run_test2_$(SIMULATOR)
run_test3   : run_test3_$(SIMULATOR)
view_wave1  : view_wave1_$(SIMULATOR)
view_wave2  : view_wave2_$(SIMULATOR)
view_wave3  : view_wave3_$(SIMULATOR)
regress_12  : regress_12_$(SIMULATOR)
regress_123 : regress_123_$(SIMULATOR)
cov         : cov_$(SIMULATOR)

# ====================================================
# QuestaSim specific commands
# ====================================================

sv_cmp_Questa:
	vlib $(work)
	vmap work $(work)
	vlog -work $(work) $(RTL) $(INC) $(SVTB2) $(SVTB1)

run_test1_Questa: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH) -wlf wave_file1.wlf -l test1.log -sv_seed 147734295 work.top +UVM_TESTNAME=small_pkt_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html small_cov0

run_test2_Questa: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH1) -wlf wave_file2.wlf -l test2.log -sv_seed 3669109994 work.top +UVM_TESTNAME=medium_pkt_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html med_cov0

run_test3_Questa: sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH2) -wlf wave_file3.wlf -l test3.log -sv_seed 1957851890 work.top +UVM_TESTNAME=big_pkt_test
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html lar_cov0

view_wave1_Questa:
	vsim -view wave_file1.wlf

view_wave2_Questa:
	vsim -view wave_file2.wlf

view_wave3_Questa:
	vsim -view wave_file3.wlf

report_12_Questa:
	vcover merge -out router_cov small_cov0 med_cov0
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov

regress_12_Questa: clean_Questa sv_cmp_Questa run_test1_Questa run_test2_Questa report_12_Questa

report_123_Questa:
	vcover merge -out router_cov small_cov0 med_cov0 lar_cov0
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov

regress_123_Questa: clean_Questa sv_cmp_Questa run_test1_Questa run_test2_Questa run_test3_Questa report_123_Questa

cov_Questa:
	firefox covhtmlreport/index.html &

clean_Questa:
	rm -rf transcript* *.log vsim.wlf fcover* covhtml* *cov* *.wlf modelsim.ini work
  
