#!/usr/bin/perl

use strict;
use warnings;

my $work = "work";

my $RTL = "../rtl/fifo.v ../rtl/fsm.v ../rtl/register.v ../rtl/synchronizer.v ../rtl/top_module.v";
my $INC = "+incdir+../tb +incdir+../sc_agent_top +incdir+../des_agent_top +incdir+../test";
my $SVTB1 = "../rtl/router_if.sv ../test/router_pkg.sv";
my $SVTB = "../tb/top.sv";

my $COVOP = "-coverage +cover=bcft";
my $VSIMOPT = "-vopt -voptargs=+acc";
#my $VSIMCOV = "log -r /*; run -all; exit";
my $VSIMBATCH = '-c -do "log -r /*; coverage save -onexit small_cov; run -all; exit"';
my $VSIMBATCH1 = '-c -do "log -r /*; coverage save -onexit med_cov; run -all; exit"';
my $VSIMBATCH2 = '-c -do "log -r /*; coverage save -onexit big_cov; run -all; exit"';

my $home_lint = $ENV{"VC_STATIC_HOME"};

sub clean {
  system "rm -rf transcript* *.log vsim.wlf fcover* covhtml* *cov* *.wlf modelsim.ini work";
  system "clear";
}

sub sv_cmp {
  system "vlib $work";
  system "vmap work $work";
  system "vlog -work $work $RTL $INC $SVTB1 $SVTB";
}

sub dc {
  system "dc_shell -f router.tcl";
}

sub lint {
  system "$home_lint/bin/vc_static_shell -mode64 -f vc_lint.tcl";
}

sub run_test_small {
  system "vsim $VSIMOPT $COVOP $VSIMBATCH -wlf wave_file1.wlf -l test1.log -sv_seed 147734295 work.top +UVM_TESTNAME=small_pkt_test";
	system "vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html small_cov";
}

sub run_test_med {
  system "vsim $VSIMOPT $COVOP $VSIMBATCH1 -wlf wave_file2.wlf -l test2.log -sv_seed 3669109994 work.top +UVM_TESTNAME=medium_pkt_test";
	system "vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html med_cov";
}

sub run_test_big {
  system "vsim $VSIMOPT $COVOP $VSIMBATCH2 -wlf wave_file3.wlf -l test3.log -sv_seed 3669109994 work.top +UVM_TESTNAME=big_pkt_test";
	system "vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html big_cov";
}

sub view_wave_small {
  system "vsim -view wave_file1.wlf";
}

sub view_wave_med {
  system "vsim -view wave_file2.wlf";
}

sub view_wave_big {
  system "vsim -view wave_file3.wlf";
}

sub report_12{
  system "vcover merge -out router_cov small_cov med_cov";
  system "vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov";
}

sub regress_12{
  clean();
  sv_cmp();
  run_test_small();
  run_test_med();
  report_12();
}

sub report_123{
  system "vcover merge -out router_cov small_cov med_cov big_cov";
  system "vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov";
}

sub regress_123{
  clean();
  sv_cmp();
  run_test_small();
  run_test_med();
  run_test_big();
  report_123();
}

sub cov{
  system "firefox covhtmlreport/index.html &";
}



sub view_wave{
  system "clear";
  print "S: Small packet wave\n";
  print "M: Medium packet wave\n";
  print "B: Big packet wave\n";
  print "----------------\n";
  
  print "Enter your choice: ";
  my $sh = <STDIN>;
  chomp($sh);
  
    if ($sh eq 'S' || $sh eq 's'){
        view_wave_small();
    }
    elsif ($sh eq 'M' || $sh eq 'm'){
        view_wave_med();
    }
    elsif ($sh eq 'B' || $sh eq 'b'){
        view_wave_big();
    }
    else{
      #sleep 1;
      system "clear";
      return;
    }
}

system "clear";

while(1){
  print "-------------------------------\n";
    print "|1.  CLEAN                     |\n";
    print "|2.  COMPILE                   |\n";
    print "|3.  DESIGN COMPLIER           |\n";
    print "|4.  LINT REPORT               |\n";
    print "|5.  RUN_TEST(SMALL)           |\n";
    print "|6.  RUN_TEST(MEDIUM)          |\n";
    print "|7.  RUN_TEST(BIG)             |\n"; 
    print "|8.  REGRESS(SMALL, MED)       |\n";
    print "|9.  REGRESS(SMALL, MED, BIG)  |\n";
    print "|10. VIEW_WAVE                 |\n";
    print "|11. COV                       |\n";
    print "|0.  EXIT                      |\n";
    print "-------------------------------\n";
    print "Enter your choice: ";
    
    my $ch = <STDIN>;
    chomp($ch);
    
    if ($ch == 0) {
      last;
    }
    elsif ($ch == 1) {
        clean();
    }
    elsif ($ch == 2) {
        sv_cmp();
    }
    elsif ($ch == 3) {
        dc();
    }
    elsif ($ch == 4) {
        lint();
    }
    elsif ($ch == 5) {
        run_test_small();
    }
    elsif ($ch == 6) {
        run_test_med();
    }
    elsif ($ch == 7) {
        run_test_big();
    }
    elsif ($ch == 8) {
        regress_12();
    }
    elsif ($ch == 9) {
        regress_123();
    }
    elsif ($ch == 11) {
        cov();
    }
    elsif($ch == 10){
        view_wave();
        system "clear";
    }
    else {
        system "clear";
        print "Invalid choice. Try again.\n";
    }
  
}
















