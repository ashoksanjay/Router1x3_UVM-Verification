/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP4
// Date      : Wed Nov  5 11:06:26 2025
/////////////////////////////////////////////////////////////


module fifo_2 ( clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state, data_in, 
        data_out, full, empty );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state;
  output full, empty;
  wire   \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] ,
         \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][7] , \mem[1][6] ,
         \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] ,
         \mem[1][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[3][7] ,
         \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] ,
         \mem[3][1] , \mem[3][0] , \mem[4][7] , \mem[4][6] , \mem[4][5] ,
         \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] ,
         \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] ,
         \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] ,
         \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] ,
         \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[8][7] ,
         \mem[8][6] , \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] ,
         \mem[8][1] , \mem[8][0] , \mem[9][7] , \mem[9][6] , \mem[9][5] ,
         \mem[9][4] , \mem[9][3] , \mem[9][2] , \mem[9][1] , \mem[9][0] ,
         \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] , \mem[12][3] ,
         \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , N71, N74, N77, N80, N83, N86, N89, N92, N179, N180,
         N181, N182, N183, N185, N186, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n404, n405, n406, n407, n408, n409;
  wire   [4:0] rd_ptr;
  wire   [4:0] count;
  wire   [4:0] wr_ptr;
  tri   [7:0] data_out;
  assign full = N185;
  assign empty = N186;

  FD1 \wr_ptr_reg[0]  ( .D(n269), .CP(clk), .Q(wr_ptr[0]), .QN(n214) );
  FD1 \rd_ptr_reg[1]  ( .D(n403), .CP(clk), .Q(rd_ptr[1]), .QN(n211) );
  FD1 \rd_ptr_reg[0]  ( .D(n402), .CP(clk), .Q(rd_ptr[0]), .QN(n232) );
  FD1 \rd_ptr_reg[2]  ( .D(n401), .CP(clk), .Q(rd_ptr[2]), .QN(n210) );
  FD1 \rd_ptr_reg[3]  ( .D(n400), .CP(clk), .Q(rd_ptr[3]), .QN(n212) );
  FD1 \rd_ptr_reg[4]  ( .D(n399), .CP(clk), .Q(rd_ptr[4]), .QN(n237) );
  FD1 \wr_ptr_reg[1]  ( .D(n398), .CP(clk), .Q(wr_ptr[1]), .QN(n235) );
  FD1 \wr_ptr_reg[2]  ( .D(n268), .CP(clk), .Q(wr_ptr[2]), .QN(n234) );
  FD1 \wr_ptr_reg[3]  ( .D(n267), .CP(clk), .Q(wr_ptr[3]), .QN(n238) );
  FD1 \wr_ptr_reg[4]  ( .D(n266), .CP(clk), .Q(wr_ptr[4]), .QN(n213) );
  FD1 \mem_reg[0][7]  ( .D(n284), .CP(clk), .Q(\mem[0][7] ) );
  FD1 \mem_reg[0][6]  ( .D(n300), .CP(clk), .Q(\mem[0][6] ) );
  FD1 \mem_reg[0][5]  ( .D(n316), .CP(clk), .Q(\mem[0][5] ) );
  FD1 \mem_reg[0][4]  ( .D(n332), .CP(clk), .Q(\mem[0][4] ) );
  FD1 \mem_reg[0][3]  ( .D(n348), .CP(clk), .Q(\mem[0][3] ) );
  FD1 \mem_reg[0][2]  ( .D(n364), .CP(clk), .Q(\mem[0][2] ) );
  FD1 \mem_reg[0][1]  ( .D(n380), .CP(clk), .Q(\mem[0][1] ) );
  FD1 \mem_reg[0][0]  ( .D(n396), .CP(clk), .Q(\mem[0][0] ) );
  FD1 \mem_reg[1][7]  ( .D(n283), .CP(clk), .Q(\mem[1][7] ) );
  FD1 \mem_reg[1][6]  ( .D(n299), .CP(clk), .Q(\mem[1][6] ) );
  FD1 \mem_reg[1][5]  ( .D(n315), .CP(clk), .Q(\mem[1][5] ) );
  FD1 \mem_reg[1][4]  ( .D(n331), .CP(clk), .Q(\mem[1][4] ) );
  FD1 \mem_reg[1][3]  ( .D(n347), .CP(clk), .Q(\mem[1][3] ) );
  FD1 \mem_reg[1][2]  ( .D(n363), .CP(clk), .Q(\mem[1][2] ) );
  FD1 \mem_reg[1][1]  ( .D(n379), .CP(clk), .Q(\mem[1][1] ) );
  FD1 \mem_reg[1][0]  ( .D(n395), .CP(clk), .Q(\mem[1][0] ) );
  FD1 \mem_reg[2][7]  ( .D(n282), .CP(clk), .Q(\mem[2][7] ) );
  FD1 \mem_reg[2][6]  ( .D(n298), .CP(clk), .Q(\mem[2][6] ) );
  FD1 \mem_reg[2][5]  ( .D(n314), .CP(clk), .Q(\mem[2][5] ) );
  FD1 \mem_reg[2][4]  ( .D(n330), .CP(clk), .Q(\mem[2][4] ) );
  FD1 \mem_reg[2][3]  ( .D(n346), .CP(clk), .Q(\mem[2][3] ) );
  FD1 \mem_reg[2][2]  ( .D(n362), .CP(clk), .Q(\mem[2][2] ) );
  FD1 \mem_reg[2][1]  ( .D(n378), .CP(clk), .Q(\mem[2][1] ) );
  FD1 \mem_reg[2][0]  ( .D(n394), .CP(clk), .Q(\mem[2][0] ) );
  FD1 \mem_reg[3][7]  ( .D(n281), .CP(clk), .Q(\mem[3][7] ) );
  FD1 \mem_reg[3][6]  ( .D(n297), .CP(clk), .Q(\mem[3][6] ) );
  FD1 \mem_reg[3][5]  ( .D(n313), .CP(clk), .Q(\mem[3][5] ) );
  FD1 \mem_reg[3][4]  ( .D(n329), .CP(clk), .Q(\mem[3][4] ) );
  FD1 \mem_reg[3][3]  ( .D(n345), .CP(clk), .Q(\mem[3][3] ) );
  FD1 \mem_reg[3][2]  ( .D(n361), .CP(clk), .Q(\mem[3][2] ) );
  FD1 \mem_reg[3][1]  ( .D(n377), .CP(clk), .Q(\mem[3][1] ) );
  FD1 \mem_reg[3][0]  ( .D(n393), .CP(clk), .Q(\mem[3][0] ) );
  FD1 \mem_reg[4][7]  ( .D(n280), .CP(clk), .Q(\mem[4][7] ) );
  FD1 \mem_reg[4][6]  ( .D(n296), .CP(clk), .Q(\mem[4][6] ) );
  FD1 \mem_reg[4][5]  ( .D(n312), .CP(clk), .Q(\mem[4][5] ) );
  FD1 \mem_reg[4][4]  ( .D(n328), .CP(clk), .Q(\mem[4][4] ) );
  FD1 \mem_reg[4][3]  ( .D(n344), .CP(clk), .Q(\mem[4][3] ) );
  FD1 \mem_reg[4][2]  ( .D(n360), .CP(clk), .Q(\mem[4][2] ) );
  FD1 \mem_reg[4][1]  ( .D(n376), .CP(clk), .Q(\mem[4][1] ) );
  FD1 \mem_reg[4][0]  ( .D(n392), .CP(clk), .Q(\mem[4][0] ) );
  FD1 \mem_reg[5][7]  ( .D(n279), .CP(clk), .Q(\mem[5][7] ) );
  FD1 \mem_reg[5][6]  ( .D(n295), .CP(clk), .Q(\mem[5][6] ) );
  FD1 \mem_reg[5][5]  ( .D(n311), .CP(clk), .Q(\mem[5][5] ) );
  FD1 \mem_reg[5][4]  ( .D(n327), .CP(clk), .Q(\mem[5][4] ) );
  FD1 \mem_reg[5][3]  ( .D(n343), .CP(clk), .Q(\mem[5][3] ) );
  FD1 \mem_reg[5][2]  ( .D(n359), .CP(clk), .Q(\mem[5][2] ) );
  FD1 \mem_reg[5][1]  ( .D(n375), .CP(clk), .Q(\mem[5][1] ) );
  FD1 \mem_reg[5][0]  ( .D(n391), .CP(clk), .Q(\mem[5][0] ) );
  FD1 \mem_reg[6][7]  ( .D(n278), .CP(clk), .Q(\mem[6][7] ) );
  FD1 \mem_reg[6][6]  ( .D(n294), .CP(clk), .Q(\mem[6][6] ) );
  FD1 \mem_reg[6][5]  ( .D(n310), .CP(clk), .Q(\mem[6][5] ) );
  FD1 \mem_reg[6][4]  ( .D(n326), .CP(clk), .Q(\mem[6][4] ) );
  FD1 \mem_reg[6][3]  ( .D(n342), .CP(clk), .Q(\mem[6][3] ) );
  FD1 \mem_reg[6][2]  ( .D(n358), .CP(clk), .Q(\mem[6][2] ) );
  FD1 \mem_reg[6][1]  ( .D(n374), .CP(clk), .Q(\mem[6][1] ) );
  FD1 \mem_reg[6][0]  ( .D(n390), .CP(clk), .Q(\mem[6][0] ) );
  FD1 \mem_reg[7][7]  ( .D(n277), .CP(clk), .Q(\mem[7][7] ) );
  FD1 \mem_reg[7][6]  ( .D(n293), .CP(clk), .Q(\mem[7][6] ) );
  FD1 \mem_reg[7][5]  ( .D(n309), .CP(clk), .Q(\mem[7][5] ) );
  FD1 \mem_reg[7][4]  ( .D(n325), .CP(clk), .Q(\mem[7][4] ) );
  FD1 \mem_reg[7][3]  ( .D(n341), .CP(clk), .Q(\mem[7][3] ) );
  FD1 \mem_reg[7][2]  ( .D(n357), .CP(clk), .Q(\mem[7][2] ) );
  FD1 \mem_reg[7][1]  ( .D(n373), .CP(clk), .Q(\mem[7][1] ) );
  FD1 \mem_reg[7][0]  ( .D(n389), .CP(clk), .Q(\mem[7][0] ) );
  FD1 \mem_reg[8][7]  ( .D(n276), .CP(clk), .Q(\mem[8][7] ) );
  FD1 \mem_reg[8][6]  ( .D(n292), .CP(clk), .Q(\mem[8][6] ) );
  FD1 \mem_reg[8][5]  ( .D(n308), .CP(clk), .Q(\mem[8][5] ) );
  FD1 \mem_reg[8][4]  ( .D(n324), .CP(clk), .Q(\mem[8][4] ) );
  FD1 \mem_reg[8][3]  ( .D(n340), .CP(clk), .Q(\mem[8][3] ) );
  FD1 \mem_reg[8][2]  ( .D(n356), .CP(clk), .Q(\mem[8][2] ) );
  FD1 \mem_reg[8][1]  ( .D(n372), .CP(clk), .Q(\mem[8][1] ) );
  FD1 \mem_reg[8][0]  ( .D(n388), .CP(clk), .Q(\mem[8][0] ) );
  FD1 \mem_reg[9][7]  ( .D(n275), .CP(clk), .Q(\mem[9][7] ) );
  FD1 \mem_reg[9][6]  ( .D(n291), .CP(clk), .Q(\mem[9][6] ) );
  FD1 \mem_reg[9][5]  ( .D(n307), .CP(clk), .Q(\mem[9][5] ) );
  FD1 \mem_reg[9][4]  ( .D(n323), .CP(clk), .Q(\mem[9][4] ) );
  FD1 \mem_reg[9][3]  ( .D(n339), .CP(clk), .Q(\mem[9][3] ) );
  FD1 \mem_reg[9][2]  ( .D(n355), .CP(clk), .Q(\mem[9][2] ) );
  FD1 \mem_reg[9][1]  ( .D(n371), .CP(clk), .Q(\mem[9][1] ) );
  FD1 \mem_reg[9][0]  ( .D(n387), .CP(clk), .Q(\mem[9][0] ) );
  FD1 \mem_reg[10][7]  ( .D(n274), .CP(clk), .QN(n242) );
  FD1 \mem_reg[10][6]  ( .D(n290), .CP(clk), .QN(n244) );
  FD1 \mem_reg[10][5]  ( .D(n306), .CP(clk), .QN(n246) );
  FD1 \mem_reg[10][4]  ( .D(n322), .CP(clk), .QN(n248) );
  FD1 \mem_reg[10][3]  ( .D(n338), .CP(clk), .QN(n250) );
  FD1 \mem_reg[10][2]  ( .D(n354), .CP(clk), .QN(n252) );
  FD1 \mem_reg[10][1]  ( .D(n370), .CP(clk), .QN(n254) );
  FD1 \mem_reg[10][0]  ( .D(n386), .CP(clk), .QN(n240) );
  FD1 \mem_reg[11][7]  ( .D(n273), .CP(clk), .QN(n241) );
  FD1 \mem_reg[11][6]  ( .D(n289), .CP(clk), .QN(n243) );
  FD1 \mem_reg[11][5]  ( .D(n305), .CP(clk), .QN(n245) );
  FD1 \mem_reg[11][4]  ( .D(n321), .CP(clk), .QN(n223) );
  FD1 \mem_reg[11][3]  ( .D(n337), .CP(clk), .QN(n225) );
  FD1 \mem_reg[11][2]  ( .D(n353), .CP(clk), .QN(n227) );
  FD1 \mem_reg[11][1]  ( .D(n369), .CP(clk), .QN(n229) );
  FD1 \mem_reg[11][0]  ( .D(n385), .CP(clk), .QN(n215) );
  FD1 \mem_reg[12][7]  ( .D(n272), .CP(clk), .Q(\mem[12][7] ) );
  FD1 \mem_reg[12][6]  ( .D(n288), .CP(clk), .Q(\mem[12][6] ) );
  FD1 \mem_reg[12][5]  ( .D(n304), .CP(clk), .Q(\mem[12][5] ) );
  FD1 \mem_reg[12][4]  ( .D(n320), .CP(clk), .Q(\mem[12][4] ) );
  FD1 \mem_reg[12][3]  ( .D(n336), .CP(clk), .Q(\mem[12][3] ) );
  FD1 \mem_reg[12][2]  ( .D(n352), .CP(clk), .Q(\mem[12][2] ) );
  FD1 \mem_reg[12][1]  ( .D(n368), .CP(clk), .Q(\mem[12][1] ) );
  FD1 \mem_reg[12][0]  ( .D(n384), .CP(clk), .Q(\mem[12][0] ) );
  FD1 \mem_reg[13][7]  ( .D(n271), .CP(clk), .Q(\mem[13][7] ) );
  FD1 \mem_reg[13][6]  ( .D(n287), .CP(clk), .Q(\mem[13][6] ) );
  FD1 \mem_reg[13][5]  ( .D(n303), .CP(clk), .Q(\mem[13][5] ) );
  FD1 \mem_reg[13][4]  ( .D(n319), .CP(clk), .Q(\mem[13][4] ) );
  FD1 \mem_reg[13][3]  ( .D(n335), .CP(clk), .Q(\mem[13][3] ) );
  FD1 \mem_reg[13][2]  ( .D(n351), .CP(clk), .Q(\mem[13][2] ) );
  FD1 \mem_reg[13][1]  ( .D(n367), .CP(clk), .Q(\mem[13][1] ) );
  FD1 \mem_reg[13][0]  ( .D(n383), .CP(clk), .Q(\mem[13][0] ) );
  FD1 \mem_reg[14][7]  ( .D(n270), .CP(clk), .QN(n218) );
  FD1 \mem_reg[14][6]  ( .D(n286), .CP(clk), .QN(n220) );
  FD1 \mem_reg[14][5]  ( .D(n302), .CP(clk), .QN(n222) );
  FD1 \mem_reg[14][4]  ( .D(n318), .CP(clk), .QN(n224) );
  FD1 \mem_reg[14][3]  ( .D(n334), .CP(clk), .QN(n226) );
  FD1 \mem_reg[14][2]  ( .D(n350), .CP(clk), .QN(n228) );
  FD1 \mem_reg[14][1]  ( .D(n366), .CP(clk), .QN(n230) );
  FD1 \mem_reg[14][0]  ( .D(n382), .CP(clk), .QN(n216) );
  FD1 \mem_reg[15][7]  ( .D(n285), .CP(clk), .QN(n217) );
  FD1 \mem_reg[15][6]  ( .D(n301), .CP(clk), .QN(n219) );
  FD1 \mem_reg[15][5]  ( .D(n317), .CP(clk), .QN(n221) );
  FD1 \mem_reg[15][4]  ( .D(n333), .CP(clk), .QN(n247) );
  FD1 \mem_reg[15][3]  ( .D(n349), .CP(clk), .QN(n249) );
  FD1 \mem_reg[15][2]  ( .D(n365), .CP(clk), .QN(n251) );
  FD1 \mem_reg[15][1]  ( .D(n381), .CP(clk), .QN(n253) );
  FD1 \mem_reg[15][0]  ( .D(n397), .CP(clk), .QN(n239) );
  FD1 \count_reg[4]  ( .D(N183), .CP(clk), .Q(count[4]) );
  FD1 \count_reg[3]  ( .D(N182), .CP(clk), .Q(count[3]), .QN(n233) );
  FD1 \count_reg[2]  ( .D(N181), .CP(clk), .Q(count[2]), .QN(n236) );
  FD1 \count_reg[1]  ( .D(N180), .CP(clk), .Q(count[1]) );
  FD1 \count_reg[0]  ( .D(N179), .CP(clk), .Q(count[0]) );
  FD1 \data_out_reg[0]  ( .D(n265), .CP(clk), .Q(N92), .QN(n255) );
  FD1 \data_out_tri_enable_reg[0]  ( .D(n264), .CP(clk), .QN(n231) );
  FD1 \data_out_reg[7]  ( .D(n263), .CP(clk), .Q(N71), .QN(n256) );
  FD1 \data_out_reg[6]  ( .D(n262), .CP(clk), .Q(N74), .QN(n404) );
  FD1 \data_out_reg[5]  ( .D(n261), .CP(clk), .Q(N77), .QN(n405) );
  FD1 \data_out_reg[4]  ( .D(n260), .CP(clk), .Q(N80), .QN(n406) );
  FD1 \data_out_reg[3]  ( .D(n259), .CP(clk), .Q(N83), .QN(n407) );
  FD1 \data_out_reg[2]  ( .D(n258), .CP(clk), .Q(N86), .QN(n408) );
  FD1 \data_out_reg[1]  ( .D(n257), .CP(clk), .Q(N89), .QN(n409) );
  BTS4 \data_out_tri[0]  ( .A(N92), .E(n231), .Z(data_out[0]) );
  BTS4 \data_out_tri[1]  ( .A(N89), .E(n231), .Z(data_out[1]) );
  BTS4 \data_out_tri[2]  ( .A(N86), .E(n231), .Z(data_out[2]) );
  BTS4 \data_out_tri[3]  ( .A(N83), .E(n231), .Z(data_out[3]) );
  BTS4 \data_out_tri[4]  ( .A(N80), .E(n231), .Z(data_out[4]) );
  BTS4 \data_out_tri[5]  ( .A(N77), .E(n231), .Z(data_out[5]) );
  BTS4 \data_out_tri[6]  ( .A(N74), .E(n231), .Z(data_out[6]) );
  BTS4 \data_out_tri[7]  ( .A(N71), .E(n231), .Z(data_out[7]) );
  AO4 U3 ( .A(n213), .B(n237), .C(rd_ptr[4]), .D(wr_ptr[4]), .Z(n7) );
  IVP U4 ( .A(n7), .Z(n5) );
  AO2 U5 ( .A(wr_ptr[3]), .B(n212), .C(rd_ptr[3]), .D(n238), .Z(n4) );
  AO2 U6 ( .A(wr_ptr[2]), .B(n210), .C(rd_ptr[2]), .D(n234), .Z(n3) );
  AO2 U7 ( .A(wr_ptr[0]), .B(n232), .C(rd_ptr[0]), .D(n214), .Z(n2) );
  AO2 U8 ( .A(wr_ptr[1]), .B(n211), .C(rd_ptr[1]), .D(n235), .Z(n1) );
  ND4 U9 ( .A(n4), .B(n3), .C(n2), .D(n1), .Z(n6) );
  NR2 U10 ( .A(n5), .B(n6), .Z(N186) );
  NR2 U11 ( .A(n7), .B(n6), .Z(N185) );
  IVP U12 ( .A(wr_enb), .Z(n8) );
  NR2 U13 ( .A(N185), .B(n8), .Z(n98) );
  IVP U14 ( .A(n98), .Z(n93) );
  NR2 U15 ( .A(n234), .B(n214), .Z(n50) );
  ND2 U16 ( .A(wr_ptr[1]), .B(n50), .Z(n95) );
  NR2 U17 ( .A(n93), .B(n95), .Z(n9) );
  ND2 U18 ( .A(wr_ptr[3]), .B(n9), .Z(n100) );
  IVP U19 ( .A(resetn), .Z(n36) );
  NR2 U20 ( .A(n36), .B(soft_reset), .Z(n51) );
  AO3 U21 ( .A(wr_ptr[3]), .B(n9), .C(n100), .D(n51), .Z(n10) );
  IVP U22 ( .A(n10), .Z(n267) );
  IVP U23 ( .A(rd_enb), .Z(n11) );
  NR2 U24 ( .A(n11), .B(N186), .Z(n117) );
  ND2 U25 ( .A(n93), .B(n117), .Z(n16) );
  NR2 U26 ( .A(n93), .B(n117), .Z(n24) );
  IVP U27 ( .A(n24), .Z(n27) );
  ND2 U28 ( .A(n16), .B(n27), .Z(n21) );
  IVP U29 ( .A(n51), .Z(n115) );
  NR2 U30 ( .A(count[0]), .B(n21), .Z(n12) );
  AO1P U31 ( .A(count[0]), .B(n21), .C(n115), .D(n12), .Z(N179) );
  IVP U32 ( .A(n16), .Z(n30) );
  EO1 U33 ( .A(count[0]), .B(n27), .C(n30), .D(count[0]), .Z(n14) );
  NR2 U34 ( .A(count[1]), .B(n14), .Z(n13) );
  AO1P U35 ( .A(count[1]), .B(n14), .C(n115), .D(n13), .Z(N180) );
  ND2 U36 ( .A(n30), .B(count[1]), .Z(n15) );
  AO3 U37 ( .A(count[1]), .B(n27), .C(n15), .D(n14), .Z(n18) );
  OR3 U38 ( .A(count[0]), .B(count[2]), .C(count[1]), .Z(n116) );
  NR2 U39 ( .A(n116), .B(n16), .Z(n33) );
  AN4P U40 ( .A(n236), .B(count[0]), .C(count[1]), .D(n24), .Z(n17) );
  AO1P U41 ( .A(count[2]), .B(n18), .C(n33), .D(n17), .Z(n19) );
  NR2 U42 ( .A(n19), .B(n115), .Z(N181) );
  ND2 U43 ( .A(count[0]), .B(count[1]), .Z(n20) );
  NR2 U44 ( .A(n236), .B(n20), .Z(n23) );
  ND2 U45 ( .A(n30), .B(n116), .Z(n22) );
  AO3 U46 ( .A(n23), .B(n27), .C(n22), .D(n21), .Z(n29) );
  ND2 U47 ( .A(n24), .B(n23), .Z(n31) );
  ND2 U48 ( .A(n233), .B(n31), .Z(n25) );
  AO4 U49 ( .A(n233), .B(n29), .C(n33), .D(n25), .Z(n26) );
  NR2 U50 ( .A(n26), .B(n115), .Z(N182) );
  NR2 U51 ( .A(n27), .B(count[3]), .Z(n28) );
  AO1P U52 ( .A(count[3]), .B(n30), .C(n29), .D(n28), .Z(n35) );
  NR2 U53 ( .A(n31), .B(n233), .Z(n32) );
  AO1P U54 ( .A(n33), .B(n233), .C(count[4]), .D(n32), .Z(n34) );
  AO1P U55 ( .A(count[4]), .B(n35), .C(n34), .D(n115), .Z(N183) );
  ND2 U56 ( .A(n51), .B(n117), .Z(n209) );
  IVP U57 ( .A(n209), .Z(n44) );
  ND2 U58 ( .A(n44), .B(n211), .Z(n38) );
  NR2 U59 ( .A(n44), .B(n36), .Z(n39) );
  NR2 U60 ( .A(rd_ptr[0]), .B(n209), .Z(n37) );
  NR2 U61 ( .A(n39), .B(n37), .Z(n42) );
  AO4 U62 ( .A(n232), .B(n38), .C(n42), .D(n211), .Z(n403) );
  EO1 U63 ( .A(n209), .B(n232), .C(n232), .D(n39), .Z(n402) );
  NR2 U64 ( .A(n232), .B(n211), .Z(n40) );
  AO2 U65 ( .A(rd_ptr[2]), .B(n211), .C(n40), .D(n210), .Z(n41) );
  AO4 U66 ( .A(n42), .B(n210), .C(n41), .D(n209), .Z(n401) );
  NR2 U67 ( .A(n210), .B(n211), .Z(n101) );
  ND2 U68 ( .A(rd_ptr[0]), .B(n101), .Z(n43) );
  AO2 U69 ( .A(n44), .B(n43), .C(resetn), .D(n209), .Z(n47) );
  ND2 U70 ( .A(n212), .B(n44), .Z(n45) );
  AO4 U71 ( .A(n47), .B(n212), .C(n45), .D(n43), .Z(n400) );
  ND4 U72 ( .A(rd_ptr[3]), .B(rd_ptr[0]), .C(n44), .D(n101), .Z(n48) );
  AN2P U73 ( .A(rd_ptr[4]), .B(n45), .Z(n46) );
  AO2 U74 ( .A(n48), .B(n237), .C(n47), .D(n46), .Z(n399) );
  NR2 U75 ( .A(n214), .B(n93), .Z(n92) );
  NR2 U76 ( .A(wr_ptr[1]), .B(n92), .Z(n49) );
  AO1P U77 ( .A(wr_ptr[1]), .B(n92), .C(n115), .D(n49), .Z(n398) );
  ND2 U78 ( .A(n51), .B(n98), .Z(n52) );
  NR2 U79 ( .A(n238), .B(n52), .Z(n56) );
  AO6 U80 ( .A(wr_ptr[1]), .B(n56), .C(n115), .Z(n62) );
  NR2 U81 ( .A(n50), .B(n115), .Z(n60) );
  NR2 U82 ( .A(n62), .B(n60), .Z(n72) );
  IVP U83 ( .A(n52), .Z(n70) );
  ND2 U84 ( .A(n70), .B(data_in[0]), .Z(n63) );
  IVP U85 ( .A(n72), .Z(n71) );
  AO2 U86 ( .A(n72), .B(n63), .C(n239), .D(n71), .Z(n397) );
  ND2 U87 ( .A(n234), .B(n214), .Z(n94) );
  AN2P U88 ( .A(n94), .B(n51), .Z(n57) );
  NR2 U89 ( .A(wr_ptr[3]), .B(n52), .Z(n53) );
  AO6 U90 ( .A(n53), .B(n235), .C(n115), .Z(n54) );
  NR2 U91 ( .A(n57), .B(n54), .Z(n73) );
  EO1 U92 ( .A(n73), .B(n63), .C(\mem[0][0] ), .D(n73), .Z(n396) );
  AO6 U93 ( .A(wr_ptr[0]), .B(n234), .C(n115), .Z(n58) );
  NR2 U94 ( .A(n54), .B(n58), .Z(n74) );
  EO1 U95 ( .A(n74), .B(n63), .C(\mem[1][0] ), .D(n74), .Z(n395) );
  AO6 U96 ( .A(wr_ptr[1]), .B(n53), .C(n115), .Z(n55) );
  NR2 U97 ( .A(n57), .B(n55), .Z(n75) );
  EO1 U98 ( .A(n75), .B(n63), .C(\mem[2][0] ), .D(n75), .Z(n394) );
  NR2 U99 ( .A(n58), .B(n55), .Z(n76) );
  EO1 U100 ( .A(n76), .B(n63), .C(\mem[3][0] ), .D(n76), .Z(n393) );
  AO6 U101 ( .A(wr_ptr[2]), .B(n214), .C(n115), .Z(n61) );
  NR2 U102 ( .A(n54), .B(n61), .Z(n77) );
  EO1 U103 ( .A(n77), .B(n63), .C(\mem[4][0] ), .D(n77), .Z(n392) );
  NR2 U104 ( .A(n60), .B(n54), .Z(n78) );
  EO1 U105 ( .A(n78), .B(n63), .C(\mem[5][0] ), .D(n78), .Z(n391) );
  NR2 U106 ( .A(n55), .B(n61), .Z(n79) );
  EO1 U107 ( .A(n79), .B(n63), .C(\mem[6][0] ), .D(n79), .Z(n390) );
  NR2 U108 ( .A(n60), .B(n55), .Z(n80) );
  EO1 U109 ( .A(n80), .B(n63), .C(\mem[7][0] ), .D(n80), .Z(n389) );
  AO6 U110 ( .A(n56), .B(n235), .C(n115), .Z(n59) );
  NR2 U111 ( .A(n57), .B(n59), .Z(n81) );
  EO1 U112 ( .A(n81), .B(n63), .C(\mem[8][0] ), .D(n81), .Z(n388) );
  NR2 U113 ( .A(n58), .B(n59), .Z(n82) );
  EO1 U114 ( .A(n82), .B(n63), .C(\mem[9][0] ), .D(n82), .Z(n387) );
  NR2 U115 ( .A(n62), .B(n57), .Z(n84) );
  IVP U116 ( .A(n84), .Z(n83) );
  AO2 U117 ( .A(n84), .B(n63), .C(n240), .D(n83), .Z(n386) );
  NR2 U118 ( .A(n62), .B(n58), .Z(n86) );
  IVP U119 ( .A(n86), .Z(n85) );
  AO2 U120 ( .A(n86), .B(n63), .C(n215), .D(n85), .Z(n385) );
  NR2 U121 ( .A(n61), .B(n59), .Z(n87) );
  EO1 U122 ( .A(n87), .B(n63), .C(\mem[12][0] ), .D(n87), .Z(n384) );
  NR2 U123 ( .A(n60), .B(n59), .Z(n88) );
  EO1 U124 ( .A(n88), .B(n63), .C(\mem[13][0] ), .D(n88), .Z(n383) );
  NR2 U125 ( .A(n62), .B(n61), .Z(n91) );
  IVP U126 ( .A(n91), .Z(n89) );
  AO2 U127 ( .A(n91), .B(n63), .C(n216), .D(n89), .Z(n382) );
  ND2 U128 ( .A(n70), .B(data_in[1]), .Z(n64) );
  AO2 U129 ( .A(n72), .B(n64), .C(n253), .D(n71), .Z(n381) );
  EO1 U130 ( .A(n73), .B(n64), .C(\mem[0][1] ), .D(n73), .Z(n380) );
  EO1 U131 ( .A(n74), .B(n64), .C(\mem[1][1] ), .D(n74), .Z(n379) );
  EO1 U132 ( .A(n75), .B(n64), .C(\mem[2][1] ), .D(n75), .Z(n378) );
  EO1 U133 ( .A(n76), .B(n64), .C(\mem[3][1] ), .D(n76), .Z(n377) );
  EO1 U134 ( .A(n77), .B(n64), .C(\mem[4][1] ), .D(n77), .Z(n376) );
  EO1 U135 ( .A(n78), .B(n64), .C(\mem[5][1] ), .D(n78), .Z(n375) );
  EO1 U136 ( .A(n79), .B(n64), .C(\mem[6][1] ), .D(n79), .Z(n374) );
  EO1 U137 ( .A(n80), .B(n64), .C(\mem[7][1] ), .D(n80), .Z(n373) );
  EO1 U138 ( .A(n81), .B(n64), .C(\mem[8][1] ), .D(n81), .Z(n372) );
  EO1 U139 ( .A(n82), .B(n64), .C(\mem[9][1] ), .D(n82), .Z(n371) );
  AO2 U140 ( .A(n84), .B(n64), .C(n254), .D(n83), .Z(n370) );
  AO2 U141 ( .A(n86), .B(n64), .C(n229), .D(n85), .Z(n369) );
  EO1 U142 ( .A(n87), .B(n64), .C(\mem[12][1] ), .D(n87), .Z(n368) );
  EO1 U143 ( .A(n88), .B(n64), .C(\mem[13][1] ), .D(n88), .Z(n367) );
  AO2 U144 ( .A(n91), .B(n64), .C(n230), .D(n89), .Z(n366) );
  ND2 U145 ( .A(n70), .B(data_in[2]), .Z(n65) );
  AO2 U146 ( .A(n72), .B(n65), .C(n251), .D(n71), .Z(n365) );
  EO1 U147 ( .A(n73), .B(n65), .C(\mem[0][2] ), .D(n73), .Z(n364) );
  EO1 U148 ( .A(n74), .B(n65), .C(\mem[1][2] ), .D(n74), .Z(n363) );
  EO1 U149 ( .A(n75), .B(n65), .C(\mem[2][2] ), .D(n75), .Z(n362) );
  EO1 U150 ( .A(n76), .B(n65), .C(\mem[3][2] ), .D(n76), .Z(n361) );
  EO1 U151 ( .A(n77), .B(n65), .C(\mem[4][2] ), .D(n77), .Z(n360) );
  EO1 U152 ( .A(n78), .B(n65), .C(\mem[5][2] ), .D(n78), .Z(n359) );
  EO1 U153 ( .A(n79), .B(n65), .C(\mem[6][2] ), .D(n79), .Z(n358) );
  EO1 U154 ( .A(n80), .B(n65), .C(\mem[7][2] ), .D(n80), .Z(n357) );
  EO1 U155 ( .A(n81), .B(n65), .C(\mem[8][2] ), .D(n81), .Z(n356) );
  EO1 U156 ( .A(n82), .B(n65), .C(\mem[9][2] ), .D(n82), .Z(n355) );
  AO2 U157 ( .A(n84), .B(n65), .C(n252), .D(n83), .Z(n354) );
  AO2 U158 ( .A(n86), .B(n65), .C(n227), .D(n85), .Z(n353) );
  EO1 U159 ( .A(n87), .B(n65), .C(\mem[12][2] ), .D(n87), .Z(n352) );
  EO1 U160 ( .A(n88), .B(n65), .C(\mem[13][2] ), .D(n88), .Z(n351) );
  AO2 U161 ( .A(n91), .B(n65), .C(n228), .D(n89), .Z(n350) );
  ND2 U162 ( .A(n70), .B(data_in[3]), .Z(n66) );
  AO2 U163 ( .A(n72), .B(n66), .C(n249), .D(n71), .Z(n349) );
  EO1 U164 ( .A(n73), .B(n66), .C(\mem[0][3] ), .D(n73), .Z(n348) );
  EO1 U165 ( .A(n74), .B(n66), .C(\mem[1][3] ), .D(n74), .Z(n347) );
  EO1 U166 ( .A(n75), .B(n66), .C(\mem[2][3] ), .D(n75), .Z(n346) );
  EO1 U167 ( .A(n76), .B(n66), .C(\mem[3][3] ), .D(n76), .Z(n345) );
  EO1 U168 ( .A(n77), .B(n66), .C(\mem[4][3] ), .D(n77), .Z(n344) );
  EO1 U169 ( .A(n78), .B(n66), .C(\mem[5][3] ), .D(n78), .Z(n343) );
  EO1 U170 ( .A(n79), .B(n66), .C(\mem[6][3] ), .D(n79), .Z(n342) );
  EO1 U171 ( .A(n80), .B(n66), .C(\mem[7][3] ), .D(n80), .Z(n341) );
  EO1 U172 ( .A(n81), .B(n66), .C(\mem[8][3] ), .D(n81), .Z(n340) );
  EO1 U173 ( .A(n82), .B(n66), .C(\mem[9][3] ), .D(n82), .Z(n339) );
  AO2 U174 ( .A(n84), .B(n66), .C(n250), .D(n83), .Z(n338) );
  AO2 U175 ( .A(n86), .B(n66), .C(n225), .D(n85), .Z(n337) );
  EO1 U176 ( .A(n87), .B(n66), .C(\mem[12][3] ), .D(n87), .Z(n336) );
  EO1 U177 ( .A(n88), .B(n66), .C(\mem[13][3] ), .D(n88), .Z(n335) );
  AO2 U178 ( .A(n91), .B(n66), .C(n226), .D(n89), .Z(n334) );
  ND2 U179 ( .A(n70), .B(data_in[4]), .Z(n67) );
  AO2 U180 ( .A(n72), .B(n67), .C(n247), .D(n71), .Z(n333) );
  EO1 U181 ( .A(n73), .B(n67), .C(\mem[0][4] ), .D(n73), .Z(n332) );
  EO1 U182 ( .A(n74), .B(n67), .C(\mem[1][4] ), .D(n74), .Z(n331) );
  EO1 U183 ( .A(n75), .B(n67), .C(\mem[2][4] ), .D(n75), .Z(n330) );
  EO1 U184 ( .A(n76), .B(n67), .C(\mem[3][4] ), .D(n76), .Z(n329) );
  EO1 U185 ( .A(n77), .B(n67), .C(\mem[4][4] ), .D(n77), .Z(n328) );
  EO1 U186 ( .A(n78), .B(n67), .C(\mem[5][4] ), .D(n78), .Z(n327) );
  EO1 U187 ( .A(n79), .B(n67), .C(\mem[6][4] ), .D(n79), .Z(n326) );
  EO1 U188 ( .A(n80), .B(n67), .C(\mem[7][4] ), .D(n80), .Z(n325) );
  EO1 U189 ( .A(n81), .B(n67), .C(\mem[8][4] ), .D(n81), .Z(n324) );
  EO1 U190 ( .A(n82), .B(n67), .C(\mem[9][4] ), .D(n82), .Z(n323) );
  AO2 U191 ( .A(n84), .B(n67), .C(n248), .D(n83), .Z(n322) );
  AO2 U192 ( .A(n86), .B(n67), .C(n223), .D(n85), .Z(n321) );
  EO1 U193 ( .A(n87), .B(n67), .C(\mem[12][4] ), .D(n87), .Z(n320) );
  EO1 U194 ( .A(n88), .B(n67), .C(\mem[13][4] ), .D(n88), .Z(n319) );
  AO2 U195 ( .A(n91), .B(n67), .C(n224), .D(n89), .Z(n318) );
  ND2 U196 ( .A(n70), .B(data_in[5]), .Z(n68) );
  AO2 U197 ( .A(n72), .B(n68), .C(n221), .D(n71), .Z(n317) );
  EO1 U198 ( .A(n73), .B(n68), .C(\mem[0][5] ), .D(n73), .Z(n316) );
  EO1 U199 ( .A(n74), .B(n68), .C(\mem[1][5] ), .D(n74), .Z(n315) );
  EO1 U200 ( .A(n75), .B(n68), .C(\mem[2][5] ), .D(n75), .Z(n314) );
  EO1 U201 ( .A(n76), .B(n68), .C(\mem[3][5] ), .D(n76), .Z(n313) );
  EO1 U202 ( .A(n77), .B(n68), .C(\mem[4][5] ), .D(n77), .Z(n312) );
  EO1 U203 ( .A(n78), .B(n68), .C(\mem[5][5] ), .D(n78), .Z(n311) );
  EO1 U204 ( .A(n79), .B(n68), .C(\mem[6][5] ), .D(n79), .Z(n310) );
  EO1 U205 ( .A(n80), .B(n68), .C(\mem[7][5] ), .D(n80), .Z(n309) );
  EO1 U206 ( .A(n81), .B(n68), .C(\mem[8][5] ), .D(n81), .Z(n308) );
  EO1 U207 ( .A(n82), .B(n68), .C(\mem[9][5] ), .D(n82), .Z(n307) );
  AO2 U208 ( .A(n84), .B(n68), .C(n246), .D(n83), .Z(n306) );
  AO2 U209 ( .A(n86), .B(n68), .C(n245), .D(n85), .Z(n305) );
  EO1 U210 ( .A(n87), .B(n68), .C(\mem[12][5] ), .D(n87), .Z(n304) );
  EO1 U211 ( .A(n88), .B(n68), .C(\mem[13][5] ), .D(n88), .Z(n303) );
  AO2 U212 ( .A(n91), .B(n68), .C(n222), .D(n89), .Z(n302) );
  ND2 U213 ( .A(n70), .B(data_in[6]), .Z(n69) );
  AO2 U214 ( .A(n72), .B(n69), .C(n219), .D(n71), .Z(n301) );
  EO1 U215 ( .A(n73), .B(n69), .C(\mem[0][6] ), .D(n73), .Z(n300) );
  EO1 U216 ( .A(n74), .B(n69), .C(\mem[1][6] ), .D(n74), .Z(n299) );
  EO1 U217 ( .A(n75), .B(n69), .C(\mem[2][6] ), .D(n75), .Z(n298) );
  EO1 U218 ( .A(n76), .B(n69), .C(\mem[3][6] ), .D(n76), .Z(n297) );
  EO1 U219 ( .A(n77), .B(n69), .C(\mem[4][6] ), .D(n77), .Z(n296) );
  EO1 U220 ( .A(n78), .B(n69), .C(\mem[5][6] ), .D(n78), .Z(n295) );
  EO1 U221 ( .A(n79), .B(n69), .C(\mem[6][6] ), .D(n79), .Z(n294) );
  EO1 U222 ( .A(n80), .B(n69), .C(\mem[7][6] ), .D(n80), .Z(n293) );
  EO1 U223 ( .A(n81), .B(n69), .C(\mem[8][6] ), .D(n81), .Z(n292) );
  EO1 U224 ( .A(n82), .B(n69), .C(\mem[9][6] ), .D(n82), .Z(n291) );
  AO2 U225 ( .A(n84), .B(n69), .C(n244), .D(n83), .Z(n290) );
  AO2 U226 ( .A(n86), .B(n69), .C(n243), .D(n85), .Z(n289) );
  EO1 U227 ( .A(n87), .B(n69), .C(\mem[12][6] ), .D(n87), .Z(n288) );
  EO1 U228 ( .A(n88), .B(n69), .C(\mem[13][6] ), .D(n88), .Z(n287) );
  AO2 U229 ( .A(n91), .B(n69), .C(n220), .D(n89), .Z(n286) );
  ND2 U230 ( .A(n70), .B(data_in[7]), .Z(n90) );
  AO2 U231 ( .A(n72), .B(n90), .C(n217), .D(n71), .Z(n285) );
  EO1 U232 ( .A(n73), .B(n90), .C(\mem[0][7] ), .D(n73), .Z(n284) );
  EO1 U233 ( .A(n74), .B(n90), .C(\mem[1][7] ), .D(n74), .Z(n283) );
  EO1 U234 ( .A(n75), .B(n90), .C(\mem[2][7] ), .D(n75), .Z(n282) );
  EO1 U235 ( .A(n76), .B(n90), .C(\mem[3][7] ), .D(n76), .Z(n281) );
  EO1 U236 ( .A(n77), .B(n90), .C(\mem[4][7] ), .D(n77), .Z(n280) );
  EO1 U237 ( .A(n78), .B(n90), .C(\mem[5][7] ), .D(n78), .Z(n279) );
  EO1 U238 ( .A(n79), .B(n90), .C(\mem[6][7] ), .D(n79), .Z(n278) );
  EO1 U239 ( .A(n80), .B(n90), .C(\mem[7][7] ), .D(n80), .Z(n277) );
  EO1 U240 ( .A(n81), .B(n90), .C(\mem[8][7] ), .D(n81), .Z(n276) );
  EO1 U241 ( .A(n82), .B(n90), .C(\mem[9][7] ), .D(n82), .Z(n275) );
  AO2 U242 ( .A(n84), .B(n90), .C(n242), .D(n83), .Z(n274) );
  AO2 U243 ( .A(n86), .B(n90), .C(n241), .D(n85), .Z(n273) );
  EO1 U244 ( .A(n87), .B(n90), .C(\mem[12][7] ), .D(n87), .Z(n272) );
  EO1 U245 ( .A(n88), .B(n90), .C(\mem[13][7] ), .D(n88), .Z(n271) );
  AO2 U246 ( .A(n91), .B(n90), .C(n218), .D(n89), .Z(n270) );
  AO1P U247 ( .A(n214), .B(n93), .C(n92), .D(n115), .Z(n269) );
  AO3 U248 ( .A(wr_ptr[2]), .B(wr_ptr[1]), .C(n95), .D(n94), .Z(n97) );
  NR2 U249 ( .A(wr_ptr[2]), .B(n98), .Z(n96) );
  AO1P U250 ( .A(n98), .B(n97), .C(n115), .D(n96), .Z(n268) );
  NR2 U251 ( .A(n213), .B(n100), .Z(n99) );
  AO1P U252 ( .A(n213), .B(n100), .C(n115), .D(n99), .Z(n266) );
  ND2 U253 ( .A(rd_ptr[3]), .B(n101), .Z(n192) );
  ND2 U254 ( .A(n210), .B(rd_ptr[3]), .Z(n102) );
  OR2P U255 ( .A(n211), .B(n102), .Z(n193) );
  AO4 U256 ( .A(n239), .B(n192), .C(n215), .D(n193), .Z(n114) );
  ND2 U257 ( .A(n212), .B(n210), .Z(n103) );
  NR2 U258 ( .A(n211), .B(n103), .Z(n195) );
  ND2 U259 ( .A(rd_ptr[2]), .B(n211), .Z(n104) );
  NR2 U260 ( .A(rd_ptr[3]), .B(n104), .Z(n194) );
  AO2 U261 ( .A(\mem[3][0] ), .B(n195), .C(\mem[5][0] ), .D(n194), .Z(n107) );
  AN2P U262 ( .A(n212), .B(n101), .Z(n197) );
  NR2 U263 ( .A(rd_ptr[1]), .B(n102), .Z(n196) );
  AO2 U264 ( .A(\mem[7][0] ), .B(n197), .C(\mem[9][0] ), .D(n196), .Z(n106) );
  NR2 U265 ( .A(rd_ptr[1]), .B(n103), .Z(n199) );
  NR2 U266 ( .A(n212), .B(n104), .Z(n198) );
  AO2 U267 ( .A(\mem[1][0] ), .B(n199), .C(\mem[13][0] ), .D(n198), .Z(n105)
         );
  ND4 U268 ( .A(rd_ptr[0]), .B(n107), .C(n106), .D(n105), .Z(n113) );
  AO4 U269 ( .A(n240), .B(n193), .C(n216), .D(n192), .Z(n112) );
  AO2 U270 ( .A(\mem[2][0] ), .B(n195), .C(\mem[4][0] ), .D(n194), .Z(n110) );
  AO2 U271 ( .A(\mem[6][0] ), .B(n197), .C(\mem[8][0] ), .D(n196), .Z(n109) );
  AO2 U272 ( .A(\mem[0][0] ), .B(n199), .C(\mem[12][0] ), .D(n198), .Z(n108)
         );
  ND4 U273 ( .A(n110), .B(n109), .C(n108), .D(n232), .Z(n111) );
  AO4 U274 ( .A(n114), .B(n113), .C(n112), .D(n111), .Z(n120) );
  NR2 U275 ( .A(n117), .B(n115), .Z(n119) );
  NR4 U276 ( .A(n117), .B(count[4]), .C(n116), .D(n115), .Z(n118) );
  ND2 U277 ( .A(n118), .B(n233), .Z(n122) );
  ND2 U278 ( .A(n119), .B(n122), .Z(n207) );
  AO4 U279 ( .A(n209), .B(n120), .C(n207), .D(n255), .Z(n265) );
  ND2 U280 ( .A(soft_reset), .B(resetn), .Z(n121) );
  AO3 U281 ( .A(n207), .B(n231), .C(n122), .D(n121), .Z(n264) );
  AO4 U282 ( .A(n217), .B(n192), .C(n241), .D(n193), .Z(n132) );
  AO2 U283 ( .A(\mem[3][7] ), .B(n195), .C(\mem[5][7] ), .D(n194), .Z(n125) );
  AO2 U284 ( .A(\mem[7][7] ), .B(n197), .C(\mem[9][7] ), .D(n196), .Z(n124) );
  AO2 U285 ( .A(\mem[1][7] ), .B(n199), .C(\mem[13][7] ), .D(n198), .Z(n123)
         );
  ND4 U286 ( .A(rd_ptr[0]), .B(n125), .C(n124), .D(n123), .Z(n131) );
  AO4 U287 ( .A(n242), .B(n193), .C(n218), .D(n192), .Z(n130) );
  AO2 U288 ( .A(\mem[2][7] ), .B(n195), .C(\mem[4][7] ), .D(n194), .Z(n128) );
  AO2 U289 ( .A(\mem[6][7] ), .B(n197), .C(\mem[8][7] ), .D(n196), .Z(n127) );
  AO2 U290 ( .A(\mem[0][7] ), .B(n199), .C(\mem[12][7] ), .D(n198), .Z(n126)
         );
  ND4 U291 ( .A(n128), .B(n127), .C(n126), .D(n232), .Z(n129) );
  AO4 U292 ( .A(n132), .B(n131), .C(n130), .D(n129), .Z(n133) );
  AO4 U293 ( .A(n209), .B(n133), .C(n207), .D(n256), .Z(n263) );
  AO4 U294 ( .A(n219), .B(n192), .C(n243), .D(n193), .Z(n143) );
  AO2 U295 ( .A(\mem[3][6] ), .B(n195), .C(\mem[5][6] ), .D(n194), .Z(n136) );
  AO2 U296 ( .A(\mem[7][6] ), .B(n197), .C(\mem[9][6] ), .D(n196), .Z(n135) );
  AO2 U297 ( .A(\mem[1][6] ), .B(n199), .C(\mem[13][6] ), .D(n198), .Z(n134)
         );
  ND4 U298 ( .A(rd_ptr[0]), .B(n136), .C(n135), .D(n134), .Z(n142) );
  AO4 U299 ( .A(n244), .B(n193), .C(n220), .D(n192), .Z(n141) );
  AO2 U300 ( .A(\mem[2][6] ), .B(n195), .C(\mem[4][6] ), .D(n194), .Z(n139) );
  AO2 U301 ( .A(\mem[6][6] ), .B(n197), .C(\mem[8][6] ), .D(n196), .Z(n138) );
  AO2 U302 ( .A(\mem[0][6] ), .B(n199), .C(\mem[12][6] ), .D(n198), .Z(n137)
         );
  ND4 U303 ( .A(n139), .B(n138), .C(n137), .D(n232), .Z(n140) );
  AO4 U304 ( .A(n143), .B(n142), .C(n141), .D(n140), .Z(n144) );
  AO4 U305 ( .A(n209), .B(n144), .C(n207), .D(n404), .Z(n262) );
  AO4 U306 ( .A(n221), .B(n192), .C(n245), .D(n193), .Z(n154) );
  AO2 U307 ( .A(\mem[3][5] ), .B(n195), .C(\mem[5][5] ), .D(n194), .Z(n147) );
  AO2 U308 ( .A(\mem[7][5] ), .B(n197), .C(\mem[9][5] ), .D(n196), .Z(n146) );
  AO2 U309 ( .A(\mem[1][5] ), .B(n199), .C(\mem[13][5] ), .D(n198), .Z(n145)
         );
  ND4 U310 ( .A(rd_ptr[0]), .B(n147), .C(n146), .D(n145), .Z(n153) );
  AO4 U311 ( .A(n246), .B(n193), .C(n222), .D(n192), .Z(n152) );
  AO2 U312 ( .A(\mem[2][5] ), .B(n195), .C(\mem[4][5] ), .D(n194), .Z(n150) );
  AO2 U313 ( .A(\mem[6][5] ), .B(n197), .C(\mem[8][5] ), .D(n196), .Z(n149) );
  AO2 U314 ( .A(\mem[0][5] ), .B(n199), .C(\mem[12][5] ), .D(n198), .Z(n148)
         );
  ND4 U315 ( .A(n150), .B(n149), .C(n148), .D(n232), .Z(n151) );
  AO4 U316 ( .A(n154), .B(n153), .C(n152), .D(n151), .Z(n155) );
  AO4 U317 ( .A(n209), .B(n155), .C(n207), .D(n405), .Z(n261) );
  AO4 U318 ( .A(n247), .B(n192), .C(n223), .D(n193), .Z(n165) );
  AO2 U319 ( .A(\mem[3][4] ), .B(n195), .C(\mem[5][4] ), .D(n194), .Z(n158) );
  AO2 U320 ( .A(\mem[7][4] ), .B(n197), .C(\mem[9][4] ), .D(n196), .Z(n157) );
  AO2 U321 ( .A(\mem[1][4] ), .B(n199), .C(\mem[13][4] ), .D(n198), .Z(n156)
         );
  ND4 U322 ( .A(rd_ptr[0]), .B(n158), .C(n157), .D(n156), .Z(n164) );
  AO4 U323 ( .A(n248), .B(n193), .C(n224), .D(n192), .Z(n163) );
  AO2 U324 ( .A(\mem[2][4] ), .B(n195), .C(\mem[4][4] ), .D(n194), .Z(n161) );
  AO2 U325 ( .A(\mem[6][4] ), .B(n197), .C(\mem[8][4] ), .D(n196), .Z(n160) );
  AO2 U326 ( .A(\mem[0][4] ), .B(n199), .C(\mem[12][4] ), .D(n198), .Z(n159)
         );
  ND4 U327 ( .A(n161), .B(n160), .C(n159), .D(n232), .Z(n162) );
  AO4 U328 ( .A(n165), .B(n164), .C(n163), .D(n162), .Z(n166) );
  AO4 U329 ( .A(n209), .B(n166), .C(n207), .D(n406), .Z(n260) );
  AO4 U330 ( .A(n249), .B(n192), .C(n225), .D(n193), .Z(n176) );
  AO2 U331 ( .A(\mem[3][3] ), .B(n195), .C(\mem[5][3] ), .D(n194), .Z(n169) );
  AO2 U332 ( .A(\mem[7][3] ), .B(n197), .C(\mem[9][3] ), .D(n196), .Z(n168) );
  AO2 U333 ( .A(\mem[1][3] ), .B(n199), .C(\mem[13][3] ), .D(n198), .Z(n167)
         );
  ND4 U334 ( .A(rd_ptr[0]), .B(n169), .C(n168), .D(n167), .Z(n175) );
  AO4 U335 ( .A(n250), .B(n193), .C(n226), .D(n192), .Z(n174) );
  AO2 U336 ( .A(\mem[2][3] ), .B(n195), .C(\mem[4][3] ), .D(n194), .Z(n172) );
  AO2 U337 ( .A(\mem[6][3] ), .B(n197), .C(\mem[8][3] ), .D(n196), .Z(n171) );
  AO2 U338 ( .A(\mem[0][3] ), .B(n199), .C(\mem[12][3] ), .D(n198), .Z(n170)
         );
  ND4 U339 ( .A(n172), .B(n171), .C(n170), .D(n232), .Z(n173) );
  AO4 U340 ( .A(n176), .B(n175), .C(n174), .D(n173), .Z(n177) );
  AO4 U341 ( .A(n209), .B(n177), .C(n207), .D(n407), .Z(n259) );
  AO4 U342 ( .A(n251), .B(n192), .C(n227), .D(n193), .Z(n187) );
  AO2 U343 ( .A(\mem[3][2] ), .B(n195), .C(\mem[5][2] ), .D(n194), .Z(n180) );
  AO2 U344 ( .A(\mem[7][2] ), .B(n197), .C(\mem[9][2] ), .D(n196), .Z(n179) );
  AO2 U345 ( .A(\mem[1][2] ), .B(n199), .C(\mem[13][2] ), .D(n198), .Z(n178)
         );
  ND4 U346 ( .A(rd_ptr[0]), .B(n180), .C(n179), .D(n178), .Z(n186) );
  AO4 U347 ( .A(n252), .B(n193), .C(n228), .D(n192), .Z(n185) );
  AO2 U348 ( .A(\mem[2][2] ), .B(n195), .C(\mem[4][2] ), .D(n194), .Z(n183) );
  AO2 U349 ( .A(\mem[6][2] ), .B(n197), .C(\mem[8][2] ), .D(n196), .Z(n182) );
  AO2 U350 ( .A(\mem[0][2] ), .B(n199), .C(\mem[12][2] ), .D(n198), .Z(n181)
         );
  ND4 U351 ( .A(n183), .B(n182), .C(n181), .D(n232), .Z(n184) );
  AO4 U352 ( .A(n187), .B(n186), .C(n185), .D(n184), .Z(n188) );
  AO4 U353 ( .A(n209), .B(n188), .C(n207), .D(n408), .Z(n258) );
  AO4 U354 ( .A(n253), .B(n192), .C(n229), .D(n193), .Z(n206) );
  AO2 U355 ( .A(\mem[3][1] ), .B(n195), .C(\mem[5][1] ), .D(n194), .Z(n191) );
  AO2 U356 ( .A(\mem[7][1] ), .B(n197), .C(\mem[9][1] ), .D(n196), .Z(n190) );
  AO2 U357 ( .A(\mem[1][1] ), .B(n199), .C(\mem[13][1] ), .D(n198), .Z(n189)
         );
  ND4 U358 ( .A(rd_ptr[0]), .B(n191), .C(n190), .D(n189), .Z(n205) );
  AO4 U359 ( .A(n254), .B(n193), .C(n230), .D(n192), .Z(n204) );
  AO2 U360 ( .A(\mem[2][1] ), .B(n195), .C(\mem[4][1] ), .D(n194), .Z(n202) );
  AO2 U361 ( .A(\mem[6][1] ), .B(n197), .C(\mem[8][1] ), .D(n196), .Z(n201) );
  AO2 U362 ( .A(\mem[0][1] ), .B(n199), .C(\mem[12][1] ), .D(n198), .Z(n200)
         );
  ND4 U363 ( .A(n202), .B(n201), .C(n200), .D(n232), .Z(n203) );
  AO4 U364 ( .A(n206), .B(n205), .C(n204), .D(n203), .Z(n208) );
  AO4 U365 ( .A(n209), .B(n208), .C(n207), .D(n409), .Z(n257) );
endmodule


module synchronizer_router ( clk, resetn, detect_add, data_in, write_enb_reg, 
        empty0, empty1, empty2, full0, full1, full2, read_enb0, read_enb1, 
        read_enb2, write_enb, valid_out0, valid_out1, valid_out2, soft_reset0, 
        soft_reset1, soft_reset2, fifo_full );
  input [1:0] data_in;
  output [2:0] write_enb;
  input clk, resetn, detect_add, write_enb_reg, empty0, empty1, empty2, full0,
         full1, full2, read_enb0, read_enb1, read_enb2;
  output valid_out0, valid_out1, valid_out2, soft_reset0, soft_reset1,
         soft_reset2, fifo_full;
  wire   n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;
  wire   [1:0] data_in_temp;
  wire   [4:0] count0;
  wire   [4:0] count1;
  wire   [4:0] count2;

  FD1 \data_in_temp_reg[1]  ( .D(n77), .CP(clk), .Q(data_in_temp[1]), .QN(n91)
         );
  FD1 \data_in_temp_reg[0]  ( .D(n76), .CP(clk), .Q(data_in_temp[0]), .QN(n95)
         );
  FD1 soft_reset0_reg ( .D(n70), .CP(clk), .Q(soft_reset0) );
  FD1 \count0_reg[4]  ( .D(n71), .CP(clk), .Q(count0[4]), .QN(n96) );
  FD1 \count0_reg[3]  ( .D(n72), .CP(clk), .QN(n86) );
  FD1 \count0_reg[2]  ( .D(n73), .CP(clk), .Q(count0[2]), .QN(n92) );
  FD1 \count0_reg[1]  ( .D(n74), .CP(clk), .QN(n84) );
  FD1 \count0_reg[0]  ( .D(n75), .CP(clk), .Q(count0[0]), .QN(n1) );
  FD1 \count1_reg[4]  ( .D(n65), .CP(clk), .Q(count1[4]), .QN(n97) );
  FD1 \count1_reg[3]  ( .D(n66), .CP(clk), .QN(n87) );
  FD1 \count1_reg[2]  ( .D(n67), .CP(clk), .Q(count1[2]), .QN(n93) );
  FD1 \count1_reg[1]  ( .D(n68), .CP(clk), .QN(n85) );
  FD1 \count1_reg[0]  ( .D(n69), .CP(clk), .Q(count1[0]), .QN(n89) );
  FD1 soft_reset1_reg ( .D(n64), .CP(clk), .Q(soft_reset1) );
  FD1 \count2_reg[4]  ( .D(n59), .CP(clk), .Q(count2[4]), .QN(n98) );
  FD1 \count2_reg[3]  ( .D(n60), .CP(clk), .QN(n90) );
  FD1 \count2_reg[2]  ( .D(n61), .CP(clk), .Q(count2[2]), .QN(n94) );
  FD1 \count2_reg[1]  ( .D(n62), .CP(clk), .QN(n88) );
  FD1 \count2_reg[0]  ( .D(n63), .CP(clk), .Q(count2[0]), .QN(n83) );
  FD1 soft_reset2_reg ( .D(n58), .CP(clk), .Q(soft_reset2) );
  ND2 U3 ( .A(write_enb_reg), .B(n91), .Z(n2) );
  NR2 U4 ( .A(data_in_temp[0]), .B(n2), .Z(write_enb[0]) );
  NR2 U5 ( .A(n95), .B(n2), .Z(write_enb[1]) );
  IVP U6 ( .A(empty0), .Z(valid_out0) );
  ND2 U7 ( .A(data_in_temp[0]), .B(full1), .Z(n4) );
  AO2 U8 ( .A(data_in_temp[1]), .B(full2), .C(full0), .D(n91), .Z(n3) );
  AO4 U9 ( .A(data_in_temp[1]), .B(n4), .C(n3), .D(data_in_temp[0]), .Z(
        fifo_full) );
  AN3 U10 ( .A(data_in_temp[1]), .B(write_enb_reg), .C(n95), .Z(write_enb[2])
         );
  IVP U11 ( .A(empty1), .Z(valid_out1) );
  IVP U12 ( .A(empty2), .Z(valid_out2) );
  IVP U13 ( .A(detect_add), .Z(n6) );
  IVP U14 ( .A(resetn), .Z(n45) );
  NR2 U15 ( .A(data_in[1]), .B(n6), .Z(n5) );
  AO1P U16 ( .A(n91), .B(n6), .C(n45), .D(n5), .Z(n77) );
  AO2 U17 ( .A(detect_add), .B(data_in[0]), .C(data_in_temp[0]), .D(n6), .Z(n7) );
  NR2 U18 ( .A(n45), .B(n7), .Z(n76) );
  AO1P U19 ( .A(n84), .B(n1), .C(n92), .D(n86), .Z(n8) );
  AO1P U20 ( .A(n8), .B(count0[4]), .C(empty0), .D(read_enb0), .Z(n25) );
  ND2 U21 ( .A(resetn), .B(n25), .Z(n15) );
  NR2 U22 ( .A(n45), .B(valid_out0), .Z(n19) );
  EO1 U23 ( .A(n15), .B(n1), .C(n1), .D(n19), .Z(n75) );
  NR2 U24 ( .A(count0[0]), .B(n15), .Z(n9) );
  NR2 U25 ( .A(n19), .B(n9), .Z(n12) );
  IVP U26 ( .A(n15), .Z(n20) );
  ND2 U27 ( .A(n84), .B(n20), .Z(n10) );
  AO4 U28 ( .A(n12), .B(n84), .C(n1), .D(n10), .Z(n74) );
  NR2 U29 ( .A(n84), .B(n1), .Z(n14) );
  ND2 U30 ( .A(n20), .B(n14), .Z(n13) );
  AN2P U31 ( .A(count0[2]), .B(n10), .Z(n11) );
  AO2 U32 ( .A(n13), .B(n92), .C(n12), .D(n11), .Z(n73) );
  ND2 U33 ( .A(count0[2]), .B(n14), .Z(n16) );
  OR2P U34 ( .A(n15), .B(n16), .Z(n21) );
  ND2 U35 ( .A(n20), .B(n16), .Z(n18) );
  NR2 U36 ( .A(n86), .B(n19), .Z(n17) );
  AO2 U37 ( .A(n21), .B(n86), .C(n18), .D(n17), .Z(n72) );
  NR2 U38 ( .A(n20), .B(n19), .Z(n22) );
  AO4 U39 ( .A(n22), .B(n96), .C(n86), .D(n21), .Z(n71) );
  NR2 U40 ( .A(empty0), .B(read_enb0), .Z(n23) );
  AO7 U41 ( .A(n23), .B(soft_reset0), .C(resetn), .Z(n24) );
  NR2 U42 ( .A(n25), .B(n24), .Z(n70) );
  AO1P U43 ( .A(n85), .B(n89), .C(n93), .D(n87), .Z(n26) );
  AO1P U44 ( .A(n26), .B(count1[4]), .C(empty1), .D(read_enb1), .Z(n43) );
  ND2 U45 ( .A(resetn), .B(n43), .Z(n33) );
  NR2 U46 ( .A(n45), .B(valid_out1), .Z(n37) );
  EO1 U47 ( .A(n33), .B(n89), .C(n89), .D(n37), .Z(n69) );
  NR2 U48 ( .A(count1[0]), .B(n33), .Z(n27) );
  NR2 U49 ( .A(n37), .B(n27), .Z(n30) );
  IVP U50 ( .A(n33), .Z(n38) );
  ND2 U51 ( .A(n85), .B(n38), .Z(n28) );
  AO4 U52 ( .A(n30), .B(n85), .C(n89), .D(n28), .Z(n68) );
  NR2 U53 ( .A(n85), .B(n89), .Z(n32) );
  ND2 U54 ( .A(n38), .B(n32), .Z(n31) );
  AN2P U55 ( .A(count1[2]), .B(n28), .Z(n29) );
  AO2 U56 ( .A(n31), .B(n93), .C(n30), .D(n29), .Z(n67) );
  ND2 U57 ( .A(count1[2]), .B(n32), .Z(n34) );
  OR2P U58 ( .A(n33), .B(n34), .Z(n39) );
  ND2 U59 ( .A(n38), .B(n34), .Z(n36) );
  NR2 U60 ( .A(n87), .B(n37), .Z(n35) );
  AO2 U61 ( .A(n39), .B(n87), .C(n36), .D(n35), .Z(n66) );
  NR2 U62 ( .A(n38), .B(n37), .Z(n40) );
  AO4 U63 ( .A(n40), .B(n97), .C(n87), .D(n39), .Z(n65) );
  NR2 U64 ( .A(empty1), .B(read_enb1), .Z(n41) );
  AO7 U65 ( .A(n41), .B(soft_reset1), .C(resetn), .Z(n42) );
  NR2 U66 ( .A(n43), .B(n42), .Z(n64) );
  AO1P U67 ( .A(n88), .B(n83), .C(n94), .D(n90), .Z(n44) );
  AO1P U68 ( .A(n44), .B(count2[4]), .C(empty2), .D(read_enb2), .Z(n82) );
  ND2 U69 ( .A(resetn), .B(n82), .Z(n52) );
  NR2 U70 ( .A(n45), .B(valid_out2), .Z(n56) );
  EO1 U71 ( .A(n52), .B(n83), .C(n83), .D(n56), .Z(n63) );
  NR2 U72 ( .A(count2[0]), .B(n52), .Z(n46) );
  NR2 U73 ( .A(n56), .B(n46), .Z(n49) );
  IVP U74 ( .A(n52), .Z(n57) );
  ND2 U75 ( .A(n88), .B(n57), .Z(n47) );
  AO4 U76 ( .A(n49), .B(n88), .C(n83), .D(n47), .Z(n62) );
  NR2 U77 ( .A(n88), .B(n83), .Z(n51) );
  ND2 U78 ( .A(n57), .B(n51), .Z(n50) );
  AN2P U79 ( .A(count2[2]), .B(n47), .Z(n48) );
  AO2 U80 ( .A(n50), .B(n94), .C(n49), .D(n48), .Z(n61) );
  ND2 U81 ( .A(count2[2]), .B(n51), .Z(n53) );
  OR2P U82 ( .A(n52), .B(n53), .Z(n78) );
  ND2 U83 ( .A(n57), .B(n53), .Z(n55) );
  NR2 U84 ( .A(n90), .B(n56), .Z(n54) );
  AO2 U85 ( .A(n78), .B(n90), .C(n55), .D(n54), .Z(n60) );
  NR2 U86 ( .A(n57), .B(n56), .Z(n79) );
  AO4 U87 ( .A(n79), .B(n98), .C(n90), .D(n78), .Z(n59) );
  NR2 U88 ( .A(empty2), .B(read_enb2), .Z(n80) );
  AO7 U89 ( .A(n80), .B(soft_reset2), .C(resetn), .Z(n81) );
  NR2 U90 ( .A(n82), .B(n81), .Z(n58) );
endmodule


module fsm ( clk, resetn, pkt_valid, data_in, fifo_full, fifo_empty0, 
        fifo_empty1, fifo_empty2, parity_done, soft_reset0, soft_reset1, 
        soft_reset2, low_pkt_valid, busy, detect_add, lfd_state, ld_state, 
        laf_state, full_state, write_enb_reg, rst_int_reg );
  input [1:0] data_in;
  input clk, resetn, pkt_valid, fifo_full, fifo_empty0, fifo_empty1,
         fifo_empty2, parity_done, soft_reset0, soft_reset1, soft_reset2,
         low_pkt_valid;
  output busy, detect_add, lfd_state, ld_state, laf_state, full_state,
         write_enb_reg, rst_int_reg;
  wire   N20, N21, N22, N75, N95, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43;
  wire   [2:0] state;
  assign busy = N75;
  assign rst_int_reg = N95;

  FD1 \state_reg[0]  ( .D(N20), .CP(clk), .Q(state[0]), .QN(n43) );
  FD1 \state_reg[2]  ( .D(N22), .CP(clk), .Q(state[2]), .QN(n41) );
  FD1 \state_reg[1]  ( .D(N21), .CP(clk), .Q(state[1]), .QN(n42) );
  ND2 U3 ( .A(n41), .B(n42), .Z(n22) );
  NR2 U4 ( .A(n43), .B(n22), .Z(lfd_state) );
  NR2 U5 ( .A(state[0]), .B(n22), .Z(detect_add) );
  ND2 U6 ( .A(state[1]), .B(state[0]), .Z(n32) );
  NR2 U7 ( .A(state[2]), .B(n32), .Z(ld_state) );
  ND2 U8 ( .A(state[0]), .B(n42), .Z(n11) );
  NR2 U9 ( .A(n41), .B(n11), .Z(laf_state) );
  NR2 U10 ( .A(n42), .B(state[0]), .Z(n30) );
  IVP U11 ( .A(n30), .Z(n8) );
  NR2 U12 ( .A(n41), .B(n8), .Z(n5) );
  OR3 U13 ( .A(ld_state), .B(laf_state), .C(n5), .Z(write_enb_reg) );
  NR2 U14 ( .A(n41), .B(n32), .Z(N95) );
  ND3 U15 ( .A(n41), .B(n11), .C(n8), .Z(N75) );
  IVP U16 ( .A(data_in[0]), .Z(n2) );
  AN2P U17 ( .A(n2), .B(data_in[1]), .Z(n20) );
  NR2 U18 ( .A(data_in[1]), .B(n2), .Z(n16) );
  AO2 U19 ( .A(n20), .B(soft_reset2), .C(n16), .D(soft_reset1), .Z(n4) );
  NR2 U20 ( .A(data_in[1]), .B(data_in[0]), .Z(n18) );
  ND2 U21 ( .A(soft_reset0), .B(n18), .Z(n3) );
  ND3 U22 ( .A(n4), .B(resetn), .C(n3), .Z(n38) );
  NR2 U23 ( .A(n41), .B(state[0]), .Z(n36) );
  IVP U24 ( .A(n36), .Z(n40) );
  NR2 U25 ( .A(lfd_state), .B(n5), .Z(n26) );
  IVP U26 ( .A(ld_state), .Z(n34) );
  IVP U27 ( .A(fifo_empty2), .Z(n19) );
  NR2 U28 ( .A(fifo_empty0), .B(data_in[1]), .Z(n6) );
  AO1P U29 ( .A(data_in[1]), .B(n19), .C(data_in[0]), .D(n6), .Z(n7) );
  AO6 U30 ( .A(n16), .B(fifo_empty1), .C(n7), .Z(n29) );
  AO4 U31 ( .A(fifo_full), .B(n34), .C(n29), .D(n22), .Z(n9) );
  EO1 U32 ( .A(pkt_valid), .B(n9), .C(n8), .D(n29), .Z(n10) );
  AO3 U33 ( .A(fifo_full), .B(n40), .C(n26), .D(n10), .Z(n13) );
  NR3 U34 ( .A(parity_done), .B(n11), .C(n41), .Z(n37) );
  IVP U35 ( .A(n37), .Z(n25) );
  NR2 U36 ( .A(low_pkt_valid), .B(n25), .Z(n12) );
  NR2 U37 ( .A(n13), .B(n12), .Z(n14) );
  NR2 U38 ( .A(n38), .B(n14), .Z(N20) );
  IVP U39 ( .A(fifo_empty0), .Z(n17) );
  IVP U40 ( .A(fifo_empty1), .Z(n15) );
  AO2 U41 ( .A(n18), .B(n17), .C(n16), .D(n15), .Z(n24) );
  ND2 U42 ( .A(n20), .B(n19), .Z(n23) );
  IVP U43 ( .A(pkt_valid), .Z(n21) );
  AO1P U44 ( .A(n24), .B(n23), .C(n22), .D(n21), .Z(n28) );
  AO3 U45 ( .A(fifo_full), .B(n34), .C(n26), .D(n25), .Z(n27) );
  AO1P U46 ( .A(n30), .B(n29), .C(n28), .D(n27), .Z(n31) );
  NR2 U47 ( .A(n31), .B(n38), .Z(N21) );
  IVP U48 ( .A(fifo_full), .Z(n33) );
  AO4 U49 ( .A(pkt_valid), .B(n34), .C(n33), .D(n32), .Z(n35) );
  AO1P U50 ( .A(low_pkt_valid), .B(n37), .C(n36), .D(n35), .Z(n39) );
  NR2 U51 ( .A(n39), .B(n38), .Z(N22) );
  NR2 U52 ( .A(state[1]), .B(n40), .Z(full_state) );
endmodule


module register ( clk, resetn, pkt_valid, data_in, fifo_full, rst_int_reg, 
        detect_add, ld_state, lfd_state, laf_state, full_state, parity_done, 
        low_pkt_valid, error, dout );
  input [7:0] data_in;
  output [7:0] dout;
  input clk, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, ld_state,
         lfd_state, laf_state, full_state;
  output parity_done, low_pkt_valid, error;
  wire   n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117;
  wire   [7:0] int_reg;
  wire   [7:0] header;
  wire   [7:0] int_parity;
  wire   [7:0] ext_parity;

  FD1 \header_reg[7]  ( .D(n161), .CP(clk), .Q(header[7]) );
  FD1 \header_reg[6]  ( .D(n160), .CP(clk), .Q(header[6]) );
  FD1 \header_reg[5]  ( .D(n159), .CP(clk), .Q(header[5]) );
  FD1 \header_reg[4]  ( .D(n158), .CP(clk), .Q(header[4]) );
  FD1 \header_reg[3]  ( .D(n157), .CP(clk), .Q(header[3]) );
  FD1 \header_reg[2]  ( .D(n156), .CP(clk), .Q(header[2]) );
  FD1 \header_reg[1]  ( .D(n155), .CP(clk), .Q(header[1]) );
  FD1 \header_reg[0]  ( .D(n154), .CP(clk), .Q(header[0]) );
  FD1 \int_reg_reg[7]  ( .D(n153), .CP(clk), .Q(int_reg[7]), .QN(n110) );
  FD1 \dout_reg[7]  ( .D(n138), .CP(clk), .Q(dout[7]) );
  FD1 \int_reg_reg[6]  ( .D(n152), .CP(clk), .Q(int_reg[6]), .QN(n111) );
  FD1 \dout_reg[6]  ( .D(n139), .CP(clk), .Q(dout[6]) );
  FD1 \int_reg_reg[5]  ( .D(n151), .CP(clk), .Q(int_reg[5]), .QN(n112) );
  FD1 \dout_reg[5]  ( .D(n140), .CP(clk), .Q(dout[5]) );
  FD1 \int_reg_reg[4]  ( .D(n150), .CP(clk), .Q(int_reg[4]), .QN(n113) );
  FD1 \dout_reg[4]  ( .D(n141), .CP(clk), .Q(dout[4]) );
  FD1 \int_reg_reg[3]  ( .D(n149), .CP(clk), .Q(int_reg[3]), .QN(n114) );
  FD1 \dout_reg[3]  ( .D(n142), .CP(clk), .Q(dout[3]) );
  FD1 \int_reg_reg[2]  ( .D(n148), .CP(clk), .Q(int_reg[2]), .QN(n115) );
  FD1 \dout_reg[2]  ( .D(n143), .CP(clk), .Q(dout[2]) );
  FD1 \int_reg_reg[1]  ( .D(n147), .CP(clk), .Q(int_reg[1]), .QN(n116) );
  FD1 \dout_reg[1]  ( .D(n144), .CP(clk), .Q(dout[1]) );
  FD1 \int_reg_reg[0]  ( .D(n146), .CP(clk), .Q(int_reg[0]), .QN(n117) );
  FD1 \dout_reg[0]  ( .D(n145), .CP(clk), .Q(dout[0]) );
  FD1 low_pkt_valid_reg ( .D(n137), .CP(clk), .Q(low_pkt_valid), .QN(n100) );
  FD1 parity_done_reg ( .D(n136), .CP(clk), .Q(parity_done), .QN(n109) );
  FD1 \int_parity_reg[7]  ( .D(n128), .CP(clk), .Q(int_parity[7]), .QN(n95) );
  FD1 \int_parity_reg[6]  ( .D(n129), .CP(clk), .Q(int_parity[6]), .QN(n94) );
  FD1 \int_parity_reg[5]  ( .D(n130), .CP(clk), .Q(int_parity[5]), .QN(n93) );
  FD1 \int_parity_reg[4]  ( .D(n131), .CP(clk), .Q(int_parity[4]), .QN(n92) );
  FD1 \int_parity_reg[3]  ( .D(n132), .CP(clk), .Q(int_parity[3]), .QN(n99) );
  FD1 \int_parity_reg[2]  ( .D(n133), .CP(clk), .Q(int_parity[2]), .QN(n98) );
  FD1 \int_parity_reg[1]  ( .D(n134), .CP(clk), .Q(int_parity[1]), .QN(n97) );
  FD1 \int_parity_reg[0]  ( .D(n135), .CP(clk), .Q(int_parity[0]), .QN(n96) );
  FD1 \ext_parity_reg[7]  ( .D(n127), .CP(clk), .Q(ext_parity[7]), .QN(n104)
         );
  FD1 \ext_parity_reg[6]  ( .D(n126), .CP(clk), .Q(ext_parity[6]), .QN(n103)
         );
  FD1 \ext_parity_reg[5]  ( .D(n125), .CP(clk), .Q(ext_parity[5]), .QN(n102)
         );
  FD1 \ext_parity_reg[4]  ( .D(n124), .CP(clk), .Q(ext_parity[4]), .QN(n101)
         );
  FD1 \ext_parity_reg[3]  ( .D(n123), .CP(clk), .Q(ext_parity[3]), .QN(n108)
         );
  FD1 \ext_parity_reg[2]  ( .D(n122), .CP(clk), .Q(ext_parity[2]), .QN(n107)
         );
  FD1 \ext_parity_reg[1]  ( .D(n121), .CP(clk), .Q(ext_parity[1]), .QN(n106)
         );
  FD1 \ext_parity_reg[0]  ( .D(n120), .CP(clk), .Q(ext_parity[0]), .QN(n105)
         );
  FD1 error_reg ( .D(n119), .CP(clk), .Q(error) );
  IVP U3 ( .A(pkt_valid), .Z(n38) );
  AO6 U4 ( .A(data_in[0]), .B(data_in[1]), .C(n38), .Z(n1) );
  ND3 U5 ( .A(resetn), .B(detect_add), .C(n1), .Z(n2) );
  IVP U6 ( .A(data_in[7]), .Z(n71) );
  IVP U7 ( .A(resetn), .Z(n89) );
  AO6 U8 ( .A(detect_add), .B(n1), .C(n89), .Z(n3) );
  EON1 U9 ( .A(n2), .B(n71), .C(n3), .D(header[7]), .Z(n161) );
  IVP U10 ( .A(data_in[6]), .Z(n72) );
  EON1 U11 ( .A(n2), .B(n72), .C(n3), .D(header[6]), .Z(n160) );
  IVP U12 ( .A(data_in[5]), .Z(n73) );
  EON1 U13 ( .A(n2), .B(n73), .C(n3), .D(header[5]), .Z(n159) );
  IVP U14 ( .A(data_in[4]), .Z(n74) );
  EON1 U15 ( .A(n2), .B(n74), .C(n3), .D(header[4]), .Z(n158) );
  IVP U16 ( .A(data_in[3]), .Z(n75) );
  EON1 U17 ( .A(n2), .B(n75), .C(n3), .D(header[3]), .Z(n157) );
  IVP U18 ( .A(data_in[2]), .Z(n76) );
  EON1 U19 ( .A(n2), .B(n76), .C(n3), .D(header[2]), .Z(n156) );
  IVP U20 ( .A(data_in[1]), .Z(n77) );
  EON1 U21 ( .A(n77), .B(n2), .C(n3), .D(header[1]), .Z(n155) );
  IVP U22 ( .A(data_in[0]), .Z(n80) );
  EON1 U23 ( .A(n80), .B(n2), .C(n3), .D(header[0]), .Z(n154) );
  IVP U24 ( .A(n3), .Z(n8) );
  NR2 U25 ( .A(lfd_state), .B(n8), .Z(n6) );
  ND3 U26 ( .A(ld_state), .B(n6), .C(fifo_full), .Z(n5) );
  ND2 U27 ( .A(resetn), .B(n5), .Z(n4) );
  AO4 U28 ( .A(n110), .B(n4), .C(n71), .D(n5), .Z(n153) );
  AO4 U29 ( .A(n111), .B(n4), .C(n72), .D(n5), .Z(n152) );
  AO4 U30 ( .A(n112), .B(n4), .C(n73), .D(n5), .Z(n151) );
  AO4 U31 ( .A(n113), .B(n4), .C(n74), .D(n5), .Z(n150) );
  AO4 U32 ( .A(n114), .B(n4), .C(n75), .D(n5), .Z(n149) );
  AO4 U33 ( .A(n115), .B(n4), .C(n76), .D(n5), .Z(n148) );
  AO4 U34 ( .A(n77), .B(n5), .C(n116), .D(n4), .Z(n147) );
  AO4 U35 ( .A(n80), .B(n5), .C(n117), .D(n4), .Z(n146) );
  IVP U36 ( .A(ld_state), .Z(n35) );
  NR2 U37 ( .A(n35), .B(fifo_full), .Z(n30) );
  AN2P U38 ( .A(n6), .B(n30), .Z(n24) );
  ND2 U39 ( .A(laf_state), .B(n6), .Z(n7) );
  NR2 U40 ( .A(ld_state), .B(n7), .Z(n25) );
  IVP U41 ( .A(lfd_state), .Z(n34) );
  NR2 U42 ( .A(n8), .B(n34), .Z(n26) );
  NR4 U43 ( .A(n25), .B(n26), .C(n24), .D(n89), .Z(n23) );
  AO2 U44 ( .A(data_in[0]), .B(n24), .C(n23), .D(dout[0]), .Z(n10) );
  AO2 U45 ( .A(header[0]), .B(n26), .C(n25), .D(int_reg[0]), .Z(n9) );
  ND2 U46 ( .A(n10), .B(n9), .Z(n145) );
  AO2 U47 ( .A(data_in[1]), .B(n24), .C(n23), .D(dout[1]), .Z(n12) );
  AO2 U48 ( .A(n26), .B(header[1]), .C(n25), .D(int_reg[1]), .Z(n11) );
  ND2 U49 ( .A(n12), .B(n11), .Z(n144) );
  AO2 U50 ( .A(n24), .B(data_in[2]), .C(n23), .D(dout[2]), .Z(n14) );
  AO2 U51 ( .A(n26), .B(header[2]), .C(n25), .D(int_reg[2]), .Z(n13) );
  ND2 U52 ( .A(n14), .B(n13), .Z(n143) );
  AO2 U53 ( .A(n24), .B(data_in[3]), .C(n23), .D(dout[3]), .Z(n16) );
  AO2 U54 ( .A(n26), .B(header[3]), .C(n25), .D(int_reg[3]), .Z(n15) );
  ND2 U55 ( .A(n16), .B(n15), .Z(n142) );
  AO2 U56 ( .A(n24), .B(data_in[4]), .C(n23), .D(dout[4]), .Z(n18) );
  AO2 U57 ( .A(n26), .B(header[4]), .C(n25), .D(int_reg[4]), .Z(n17) );
  ND2 U58 ( .A(n18), .B(n17), .Z(n141) );
  AO2 U59 ( .A(n24), .B(data_in[5]), .C(n23), .D(dout[5]), .Z(n20) );
  AO2 U60 ( .A(n26), .B(header[5]), .C(n25), .D(int_reg[5]), .Z(n19) );
  ND2 U61 ( .A(n20), .B(n19), .Z(n140) );
  AO2 U62 ( .A(n24), .B(data_in[6]), .C(n23), .D(dout[6]), .Z(n22) );
  AO2 U63 ( .A(n26), .B(header[6]), .C(n25), .D(int_reg[6]), .Z(n21) );
  ND2 U64 ( .A(n22), .B(n21), .Z(n139) );
  AO2 U65 ( .A(n24), .B(data_in[7]), .C(n23), .D(dout[7]), .Z(n28) );
  AO2 U66 ( .A(n26), .B(header[7]), .C(n25), .D(int_reg[7]), .Z(n27) );
  ND2 U67 ( .A(n28), .B(n27), .Z(n138) );
  ND2 U68 ( .A(ld_state), .B(n38), .Z(n29) );
  AO1P U69 ( .A(n100), .B(n29), .C(rst_int_reg), .D(n89), .Z(n137) );
  NR2 U70 ( .A(detect_add), .B(n89), .Z(n70) );
  IVP U71 ( .A(n70), .Z(n40) );
  ND2 U72 ( .A(laf_state), .B(low_pkt_valid), .Z(n31) );
  EON1 U73 ( .A(parity_done), .B(n31), .C(n38), .D(n30), .Z(n69) );
  NR2 U74 ( .A(parity_done), .B(n69), .Z(n32) );
  NR2 U75 ( .A(n40), .B(n32), .Z(n136) );
  ND2 U76 ( .A(n70), .B(pkt_valid), .Z(n33) );
  NR4 U77 ( .A(lfd_state), .B(full_state), .C(n35), .D(n33), .Z(n65) );
  NR2 U78 ( .A(n34), .B(n33), .Z(n66) );
  IVP U79 ( .A(n66), .Z(n62) );
  NR2 U80 ( .A(header[0]), .B(n62), .Z(n41) );
  NR2 U81 ( .A(full_state), .B(n35), .Z(n36) );
  NR2 U82 ( .A(n36), .B(lfd_state), .Z(n37) );
  NR2 U83 ( .A(n38), .B(n37), .Z(n39) );
  NR2 U84 ( .A(n40), .B(n39), .Z(n63) );
  AO1P U85 ( .A(n65), .B(n80), .C(n41), .D(n63), .Z(n43) );
  AO2 U86 ( .A(header[0]), .B(n66), .C(data_in[0]), .D(n65), .Z(n42) );
  AO2 U87 ( .A(int_parity[0]), .B(n43), .C(n42), .D(n96), .Z(n135) );
  NR2 U88 ( .A(header[1]), .B(n62), .Z(n44) );
  AO1P U89 ( .A(n65), .B(n77), .C(n44), .D(n63), .Z(n46) );
  AO2 U90 ( .A(data_in[1]), .B(n65), .C(header[1]), .D(n66), .Z(n45) );
  AO2 U91 ( .A(int_parity[1]), .B(n46), .C(n45), .D(n97), .Z(n134) );
  NR2 U92 ( .A(header[2]), .B(n62), .Z(n47) );
  AO1P U93 ( .A(n65), .B(n76), .C(n47), .D(n63), .Z(n49) );
  AO2 U94 ( .A(header[2]), .B(n66), .C(data_in[2]), .D(n65), .Z(n48) );
  AO2 U95 ( .A(int_parity[2]), .B(n49), .C(n48), .D(n98), .Z(n133) );
  NR2 U96 ( .A(header[3]), .B(n62), .Z(n50) );
  AO1P U97 ( .A(n65), .B(n75), .C(n50), .D(n63), .Z(n52) );
  AO2 U98 ( .A(header[3]), .B(n66), .C(data_in[3]), .D(n65), .Z(n51) );
  AO2 U99 ( .A(int_parity[3]), .B(n52), .C(n51), .D(n99), .Z(n132) );
  NR2 U100 ( .A(header[4]), .B(n62), .Z(n53) );
  AO1P U101 ( .A(n65), .B(n74), .C(n53), .D(n63), .Z(n55) );
  AO2 U102 ( .A(header[4]), .B(n66), .C(data_in[4]), .D(n65), .Z(n54) );
  AO2 U103 ( .A(int_parity[4]), .B(n55), .C(n54), .D(n92), .Z(n131) );
  NR2 U104 ( .A(header[5]), .B(n62), .Z(n56) );
  AO1P U105 ( .A(n65), .B(n73), .C(n56), .D(n63), .Z(n58) );
  AO2 U106 ( .A(header[5]), .B(n66), .C(data_in[5]), .D(n65), .Z(n57) );
  AO2 U107 ( .A(int_parity[5]), .B(n58), .C(n57), .D(n93), .Z(n130) );
  NR2 U108 ( .A(header[6]), .B(n62), .Z(n59) );
  AO1P U109 ( .A(n65), .B(n72), .C(n59), .D(n63), .Z(n61) );
  AO2 U110 ( .A(header[6]), .B(n66), .C(data_in[6]), .D(n65), .Z(n60) );
  AO2 U111 ( .A(int_parity[6]), .B(n61), .C(n60), .D(n94), .Z(n129) );
  NR2 U112 ( .A(header[7]), .B(n62), .Z(n64) );
  AO1P U113 ( .A(n65), .B(n71), .C(n64), .D(n63), .Z(n68) );
  AO2 U114 ( .A(header[7]), .B(n66), .C(data_in[7]), .D(n65), .Z(n67) );
  AO2 U115 ( .A(int_parity[7]), .B(n68), .C(n67), .D(n95), .Z(n128) );
  ND2 U116 ( .A(n70), .B(n69), .Z(n79) );
  ND2 U117 ( .A(n70), .B(n79), .Z(n78) );
  AO4 U118 ( .A(n71), .B(n79), .C(n104), .D(n78), .Z(n127) );
  AO4 U119 ( .A(n72), .B(n79), .C(n78), .D(n103), .Z(n126) );
  AO4 U120 ( .A(n73), .B(n79), .C(n78), .D(n102), .Z(n125) );
  AO4 U121 ( .A(n74), .B(n79), .C(n78), .D(n101), .Z(n124) );
  AO4 U122 ( .A(n75), .B(n79), .C(n78), .D(n108), .Z(n123) );
  AO4 U123 ( .A(n76), .B(n79), .C(n78), .D(n107), .Z(n122) );
  AO4 U124 ( .A(n77), .B(n79), .C(n78), .D(n106), .Z(n121) );
  AO4 U125 ( .A(n80), .B(n79), .C(n78), .D(n105), .Z(n120) );
  AO2 U126 ( .A(int_parity[4]), .B(ext_parity[4]), .C(n101), .D(n92), .Z(n84)
         );
  AO2 U127 ( .A(int_parity[5]), .B(ext_parity[5]), .C(n102), .D(n93), .Z(n83)
         );
  AO2 U128 ( .A(int_parity[6]), .B(ext_parity[6]), .C(n103), .D(n94), .Z(n82)
         );
  AO2 U129 ( .A(int_parity[7]), .B(ext_parity[7]), .C(n104), .D(n95), .Z(n81)
         );
  NR4 U130 ( .A(n84), .B(n83), .C(n82), .D(n81), .Z(n91) );
  AO2 U131 ( .A(int_parity[0]), .B(ext_parity[0]), .C(n105), .D(n96), .Z(n88)
         );
  AO2 U132 ( .A(int_parity[1]), .B(ext_parity[1]), .C(n106), .D(n97), .Z(n87)
         );
  AO2 U133 ( .A(int_parity[2]), .B(ext_parity[2]), .C(n107), .D(n98), .Z(n86)
         );
  AO2 U134 ( .A(int_parity[3]), .B(ext_parity[3]), .C(n108), .D(n99), .Z(n85)
         );
  NR4 U135 ( .A(n88), .B(n87), .C(n86), .D(n85), .Z(n90) );
  AO1P U136 ( .A(n91), .B(n90), .C(n109), .D(n89), .Z(n119) );
endmodule


module fifo_0 ( clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state, data_in, 
        data_out, full, empty );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state;
  output full, empty;
  wire   \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] ,
         \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][7] , \mem[1][6] ,
         \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] ,
         \mem[1][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[3][7] ,
         \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] ,
         \mem[3][1] , \mem[3][0] , \mem[4][7] , \mem[4][6] , \mem[4][5] ,
         \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] ,
         \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] ,
         \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] ,
         \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] ,
         \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[8][7] ,
         \mem[8][6] , \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] ,
         \mem[8][1] , \mem[8][0] , \mem[9][7] , \mem[9][6] , \mem[9][5] ,
         \mem[9][4] , \mem[9][3] , \mem[9][2] , \mem[9][1] , \mem[9][0] ,
         \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] , \mem[12][3] ,
         \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , N71, N74, N77, N80, N83, N86, N89, N92, N179, N180,
         N181, N182, N183, N185, N186, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556;
  wire   [4:0] rd_ptr;
  wire   [4:0] count;
  wire   [4:0] wr_ptr;
  tri   [7:0] data_out;
  assign full = N185;
  assign empty = N186;

  FD1 \wr_ptr_reg[0]  ( .D(n544), .CP(clk), .Q(wr_ptr[0]), .QN(n212) );
  FD1 \rd_ptr_reg[1]  ( .D(n410), .CP(clk), .Q(rd_ptr[1]), .QN(n211) );
  FD1 \rd_ptr_reg[0]  ( .D(n411), .CP(clk), .Q(rd_ptr[0]), .QN(n232) );
  FD1 \rd_ptr_reg[2]  ( .D(n412), .CP(clk), .Q(rd_ptr[2]), .QN(n210) );
  FD1 \rd_ptr_reg[3]  ( .D(n413), .CP(clk), .Q(rd_ptr[3]), .QN(n213) );
  FD1 \rd_ptr_reg[4]  ( .D(n414), .CP(clk), .Q(rd_ptr[4]), .QN(n237) );
  FD1 \wr_ptr_reg[1]  ( .D(n415), .CP(clk), .Q(wr_ptr[1]), .QN(n235) );
  FD1 \wr_ptr_reg[2]  ( .D(n545), .CP(clk), .Q(wr_ptr[2]), .QN(n234) );
  FD1 \wr_ptr_reg[3]  ( .D(n546), .CP(clk), .Q(wr_ptr[3]), .QN(n238) );
  FD1 \wr_ptr_reg[4]  ( .D(n547), .CP(clk), .Q(wr_ptr[4]), .QN(n214) );
  FD1 \mem_reg[0][7]  ( .D(n529), .CP(clk), .Q(\mem[0][7] ) );
  FD1 \mem_reg[0][6]  ( .D(n513), .CP(clk), .Q(\mem[0][6] ) );
  FD1 \mem_reg[0][5]  ( .D(n497), .CP(clk), .Q(\mem[0][5] ) );
  FD1 \mem_reg[0][4]  ( .D(n481), .CP(clk), .Q(\mem[0][4] ) );
  FD1 \mem_reg[0][3]  ( .D(n465), .CP(clk), .Q(\mem[0][3] ) );
  FD1 \mem_reg[0][2]  ( .D(n449), .CP(clk), .Q(\mem[0][2] ) );
  FD1 \mem_reg[0][1]  ( .D(n433), .CP(clk), .Q(\mem[0][1] ) );
  FD1 \mem_reg[0][0]  ( .D(n417), .CP(clk), .Q(\mem[0][0] ) );
  FD1 \mem_reg[1][7]  ( .D(n530), .CP(clk), .Q(\mem[1][7] ) );
  FD1 \mem_reg[1][6]  ( .D(n514), .CP(clk), .Q(\mem[1][6] ) );
  FD1 \mem_reg[1][5]  ( .D(n498), .CP(clk), .Q(\mem[1][5] ) );
  FD1 \mem_reg[1][4]  ( .D(n482), .CP(clk), .Q(\mem[1][4] ) );
  FD1 \mem_reg[1][3]  ( .D(n466), .CP(clk), .Q(\mem[1][3] ) );
  FD1 \mem_reg[1][2]  ( .D(n450), .CP(clk), .Q(\mem[1][2] ) );
  FD1 \mem_reg[1][1]  ( .D(n434), .CP(clk), .Q(\mem[1][1] ) );
  FD1 \mem_reg[1][0]  ( .D(n418), .CP(clk), .Q(\mem[1][0] ) );
  FD1 \mem_reg[2][7]  ( .D(n531), .CP(clk), .Q(\mem[2][7] ) );
  FD1 \mem_reg[2][6]  ( .D(n515), .CP(clk), .Q(\mem[2][6] ) );
  FD1 \mem_reg[2][5]  ( .D(n499), .CP(clk), .Q(\mem[2][5] ) );
  FD1 \mem_reg[2][4]  ( .D(n483), .CP(clk), .Q(\mem[2][4] ) );
  FD1 \mem_reg[2][3]  ( .D(n467), .CP(clk), .Q(\mem[2][3] ) );
  FD1 \mem_reg[2][2]  ( .D(n451), .CP(clk), .Q(\mem[2][2] ) );
  FD1 \mem_reg[2][1]  ( .D(n435), .CP(clk), .Q(\mem[2][1] ) );
  FD1 \mem_reg[2][0]  ( .D(n419), .CP(clk), .Q(\mem[2][0] ) );
  FD1 \mem_reg[3][7]  ( .D(n532), .CP(clk), .Q(\mem[3][7] ) );
  FD1 \mem_reg[3][6]  ( .D(n516), .CP(clk), .Q(\mem[3][6] ) );
  FD1 \mem_reg[3][5]  ( .D(n500), .CP(clk), .Q(\mem[3][5] ) );
  FD1 \mem_reg[3][4]  ( .D(n484), .CP(clk), .Q(\mem[3][4] ) );
  FD1 \mem_reg[3][3]  ( .D(n468), .CP(clk), .Q(\mem[3][3] ) );
  FD1 \mem_reg[3][2]  ( .D(n452), .CP(clk), .Q(\mem[3][2] ) );
  FD1 \mem_reg[3][1]  ( .D(n436), .CP(clk), .Q(\mem[3][1] ) );
  FD1 \mem_reg[3][0]  ( .D(n420), .CP(clk), .Q(\mem[3][0] ) );
  FD1 \mem_reg[4][7]  ( .D(n533), .CP(clk), .Q(\mem[4][7] ) );
  FD1 \mem_reg[4][6]  ( .D(n517), .CP(clk), .Q(\mem[4][6] ) );
  FD1 \mem_reg[4][5]  ( .D(n501), .CP(clk), .Q(\mem[4][5] ) );
  FD1 \mem_reg[4][4]  ( .D(n485), .CP(clk), .Q(\mem[4][4] ) );
  FD1 \mem_reg[4][3]  ( .D(n469), .CP(clk), .Q(\mem[4][3] ) );
  FD1 \mem_reg[4][2]  ( .D(n453), .CP(clk), .Q(\mem[4][2] ) );
  FD1 \mem_reg[4][1]  ( .D(n437), .CP(clk), .Q(\mem[4][1] ) );
  FD1 \mem_reg[4][0]  ( .D(n421), .CP(clk), .Q(\mem[4][0] ) );
  FD1 \mem_reg[5][7]  ( .D(n534), .CP(clk), .Q(\mem[5][7] ) );
  FD1 \mem_reg[5][6]  ( .D(n518), .CP(clk), .Q(\mem[5][6] ) );
  FD1 \mem_reg[5][5]  ( .D(n502), .CP(clk), .Q(\mem[5][5] ) );
  FD1 \mem_reg[5][4]  ( .D(n486), .CP(clk), .Q(\mem[5][4] ) );
  FD1 \mem_reg[5][3]  ( .D(n470), .CP(clk), .Q(\mem[5][3] ) );
  FD1 \mem_reg[5][2]  ( .D(n454), .CP(clk), .Q(\mem[5][2] ) );
  FD1 \mem_reg[5][1]  ( .D(n438), .CP(clk), .Q(\mem[5][1] ) );
  FD1 \mem_reg[5][0]  ( .D(n422), .CP(clk), .Q(\mem[5][0] ) );
  FD1 \mem_reg[6][7]  ( .D(n535), .CP(clk), .Q(\mem[6][7] ) );
  FD1 \mem_reg[6][6]  ( .D(n519), .CP(clk), .Q(\mem[6][6] ) );
  FD1 \mem_reg[6][5]  ( .D(n503), .CP(clk), .Q(\mem[6][5] ) );
  FD1 \mem_reg[6][4]  ( .D(n487), .CP(clk), .Q(\mem[6][4] ) );
  FD1 \mem_reg[6][3]  ( .D(n471), .CP(clk), .Q(\mem[6][3] ) );
  FD1 \mem_reg[6][2]  ( .D(n455), .CP(clk), .Q(\mem[6][2] ) );
  FD1 \mem_reg[6][1]  ( .D(n439), .CP(clk), .Q(\mem[6][1] ) );
  FD1 \mem_reg[6][0]  ( .D(n423), .CP(clk), .Q(\mem[6][0] ) );
  FD1 \mem_reg[7][7]  ( .D(n536), .CP(clk), .Q(\mem[7][7] ) );
  FD1 \mem_reg[7][6]  ( .D(n520), .CP(clk), .Q(\mem[7][6] ) );
  FD1 \mem_reg[7][5]  ( .D(n504), .CP(clk), .Q(\mem[7][5] ) );
  FD1 \mem_reg[7][4]  ( .D(n488), .CP(clk), .Q(\mem[7][4] ) );
  FD1 \mem_reg[7][3]  ( .D(n472), .CP(clk), .Q(\mem[7][3] ) );
  FD1 \mem_reg[7][2]  ( .D(n456), .CP(clk), .Q(\mem[7][2] ) );
  FD1 \mem_reg[7][1]  ( .D(n440), .CP(clk), .Q(\mem[7][1] ) );
  FD1 \mem_reg[7][0]  ( .D(n424), .CP(clk), .Q(\mem[7][0] ) );
  FD1 \mem_reg[8][7]  ( .D(n537), .CP(clk), .Q(\mem[8][7] ) );
  FD1 \mem_reg[8][6]  ( .D(n521), .CP(clk), .Q(\mem[8][6] ) );
  FD1 \mem_reg[8][5]  ( .D(n505), .CP(clk), .Q(\mem[8][5] ) );
  FD1 \mem_reg[8][4]  ( .D(n489), .CP(clk), .Q(\mem[8][4] ) );
  FD1 \mem_reg[8][3]  ( .D(n473), .CP(clk), .Q(\mem[8][3] ) );
  FD1 \mem_reg[8][2]  ( .D(n457), .CP(clk), .Q(\mem[8][2] ) );
  FD1 \mem_reg[8][1]  ( .D(n441), .CP(clk), .Q(\mem[8][1] ) );
  FD1 \mem_reg[8][0]  ( .D(n425), .CP(clk), .Q(\mem[8][0] ) );
  FD1 \mem_reg[9][7]  ( .D(n538), .CP(clk), .Q(\mem[9][7] ) );
  FD1 \mem_reg[9][6]  ( .D(n522), .CP(clk), .Q(\mem[9][6] ) );
  FD1 \mem_reg[9][5]  ( .D(n506), .CP(clk), .Q(\mem[9][5] ) );
  FD1 \mem_reg[9][4]  ( .D(n490), .CP(clk), .Q(\mem[9][4] ) );
  FD1 \mem_reg[9][3]  ( .D(n474), .CP(clk), .Q(\mem[9][3] ) );
  FD1 \mem_reg[9][2]  ( .D(n458), .CP(clk), .Q(\mem[9][2] ) );
  FD1 \mem_reg[9][1]  ( .D(n442), .CP(clk), .Q(\mem[9][1] ) );
  FD1 \mem_reg[9][0]  ( .D(n426), .CP(clk), .Q(\mem[9][0] ) );
  FD1 \mem_reg[10][7]  ( .D(n539), .CP(clk), .QN(n242) );
  FD1 \mem_reg[10][6]  ( .D(n523), .CP(clk), .QN(n244) );
  FD1 \mem_reg[10][5]  ( .D(n507), .CP(clk), .QN(n246) );
  FD1 \mem_reg[10][4]  ( .D(n491), .CP(clk), .QN(n248) );
  FD1 \mem_reg[10][3]  ( .D(n475), .CP(clk), .QN(n250) );
  FD1 \mem_reg[10][2]  ( .D(n459), .CP(clk), .QN(n252) );
  FD1 \mem_reg[10][1]  ( .D(n443), .CP(clk), .QN(n254) );
  FD1 \mem_reg[10][0]  ( .D(n427), .CP(clk), .QN(n240) );
  FD1 \mem_reg[11][7]  ( .D(n540), .CP(clk), .QN(n241) );
  FD1 \mem_reg[11][6]  ( .D(n524), .CP(clk), .QN(n243) );
  FD1 \mem_reg[11][5]  ( .D(n508), .CP(clk), .QN(n221) );
  FD1 \mem_reg[11][4]  ( .D(n492), .CP(clk), .QN(n223) );
  FD1 \mem_reg[11][3]  ( .D(n476), .CP(clk), .QN(n225) );
  FD1 \mem_reg[11][2]  ( .D(n460), .CP(clk), .QN(n227) );
  FD1 \mem_reg[11][1]  ( .D(n444), .CP(clk), .QN(n229) );
  FD1 \mem_reg[11][0]  ( .D(n428), .CP(clk), .QN(n215) );
  FD1 \mem_reg[12][7]  ( .D(n541), .CP(clk), .Q(\mem[12][7] ) );
  FD1 \mem_reg[12][6]  ( .D(n525), .CP(clk), .Q(\mem[12][6] ) );
  FD1 \mem_reg[12][5]  ( .D(n509), .CP(clk), .Q(\mem[12][5] ) );
  FD1 \mem_reg[12][4]  ( .D(n493), .CP(clk), .Q(\mem[12][4] ) );
  FD1 \mem_reg[12][3]  ( .D(n477), .CP(clk), .Q(\mem[12][3] ) );
  FD1 \mem_reg[12][2]  ( .D(n461), .CP(clk), .Q(\mem[12][2] ) );
  FD1 \mem_reg[12][1]  ( .D(n445), .CP(clk), .Q(\mem[12][1] ) );
  FD1 \mem_reg[12][0]  ( .D(n429), .CP(clk), .Q(\mem[12][0] ) );
  FD1 \mem_reg[13][7]  ( .D(n542), .CP(clk), .Q(\mem[13][7] ) );
  FD1 \mem_reg[13][6]  ( .D(n526), .CP(clk), .Q(\mem[13][6] ) );
  FD1 \mem_reg[13][5]  ( .D(n510), .CP(clk), .Q(\mem[13][5] ) );
  FD1 \mem_reg[13][4]  ( .D(n494), .CP(clk), .Q(\mem[13][4] ) );
  FD1 \mem_reg[13][3]  ( .D(n478), .CP(clk), .Q(\mem[13][3] ) );
  FD1 \mem_reg[13][2]  ( .D(n462), .CP(clk), .Q(\mem[13][2] ) );
  FD1 \mem_reg[13][1]  ( .D(n446), .CP(clk), .Q(\mem[13][1] ) );
  FD1 \mem_reg[13][0]  ( .D(n430), .CP(clk), .Q(\mem[13][0] ) );
  FD1 \mem_reg[14][7]  ( .D(n543), .CP(clk), .QN(n218) );
  FD1 \mem_reg[14][6]  ( .D(n527), .CP(clk), .QN(n220) );
  FD1 \mem_reg[14][5]  ( .D(n511), .CP(clk), .QN(n222) );
  FD1 \mem_reg[14][4]  ( .D(n495), .CP(clk), .QN(n224) );
  FD1 \mem_reg[14][3]  ( .D(n479), .CP(clk), .QN(n226) );
  FD1 \mem_reg[14][2]  ( .D(n463), .CP(clk), .QN(n228) );
  FD1 \mem_reg[14][1]  ( .D(n447), .CP(clk), .QN(n230) );
  FD1 \mem_reg[14][0]  ( .D(n431), .CP(clk), .QN(n216) );
  FD1 \mem_reg[15][7]  ( .D(n528), .CP(clk), .QN(n217) );
  FD1 \mem_reg[15][6]  ( .D(n512), .CP(clk), .QN(n219) );
  FD1 \mem_reg[15][5]  ( .D(n496), .CP(clk), .QN(n245) );
  FD1 \mem_reg[15][4]  ( .D(n480), .CP(clk), .QN(n247) );
  FD1 \mem_reg[15][3]  ( .D(n464), .CP(clk), .QN(n249) );
  FD1 \mem_reg[15][2]  ( .D(n448), .CP(clk), .QN(n251) );
  FD1 \mem_reg[15][1]  ( .D(n432), .CP(clk), .QN(n253) );
  FD1 \mem_reg[15][0]  ( .D(n416), .CP(clk), .QN(n239) );
  FD1 \count_reg[4]  ( .D(N183), .CP(clk), .Q(count[4]) );
  FD1 \count_reg[3]  ( .D(N182), .CP(clk), .Q(count[3]), .QN(n233) );
  FD1 \count_reg[2]  ( .D(N181), .CP(clk), .Q(count[2]), .QN(n236) );
  FD1 \count_reg[1]  ( .D(N180), .CP(clk), .Q(count[1]) );
  FD1 \count_reg[0]  ( .D(N179), .CP(clk), .Q(count[0]) );
  FD1 \data_out_reg[0]  ( .D(n548), .CP(clk), .Q(N92), .QN(n255) );
  FD1 \data_out_tri_enable_reg[0]  ( .D(n549), .CP(clk), .QN(n231) );
  FD1 \data_out_reg[7]  ( .D(n550), .CP(clk), .Q(N71), .QN(n256) );
  FD1 \data_out_reg[6]  ( .D(n551), .CP(clk), .Q(N74), .QN(n404) );
  FD1 \data_out_reg[5]  ( .D(n552), .CP(clk), .Q(N77), .QN(n405) );
  FD1 \data_out_reg[4]  ( .D(n553), .CP(clk), .Q(N80), .QN(n406) );
  FD1 \data_out_reg[3]  ( .D(n554), .CP(clk), .Q(N83), .QN(n407) );
  FD1 \data_out_reg[2]  ( .D(n555), .CP(clk), .Q(N86), .QN(n408) );
  FD1 \data_out_reg[1]  ( .D(n556), .CP(clk), .Q(N89), .QN(n409) );
  BTS4 \data_out_tri[0]  ( .A(N92), .E(n231), .Z(data_out[0]) );
  BTS4 \data_out_tri[1]  ( .A(N89), .E(n231), .Z(data_out[1]) );
  BTS4 \data_out_tri[2]  ( .A(N86), .E(n231), .Z(data_out[2]) );
  BTS4 \data_out_tri[3]  ( .A(N83), .E(n231), .Z(data_out[3]) );
  BTS4 \data_out_tri[4]  ( .A(N80), .E(n231), .Z(data_out[4]) );
  BTS4 \data_out_tri[5]  ( .A(N77), .E(n231), .Z(data_out[5]) );
  BTS4 \data_out_tri[6]  ( .A(N74), .E(n231), .Z(data_out[6]) );
  BTS4 \data_out_tri[7]  ( .A(N71), .E(n231), .Z(data_out[7]) );
  AO4 U3 ( .A(n214), .B(n237), .C(rd_ptr[4]), .D(wr_ptr[4]), .Z(n5) );
  AO2 U4 ( .A(wr_ptr[3]), .B(n213), .C(rd_ptr[3]), .D(n238), .Z(n4) );
  AO2 U5 ( .A(wr_ptr[2]), .B(n210), .C(rd_ptr[2]), .D(n234), .Z(n3) );
  AO2 U6 ( .A(wr_ptr[0]), .B(n232), .C(rd_ptr[0]), .D(n212), .Z(n2) );
  AO2 U7 ( .A(wr_ptr[1]), .B(n211), .C(rd_ptr[1]), .D(n235), .Z(n1) );
  ND4 U8 ( .A(n4), .B(n3), .C(n2), .D(n1), .Z(n6) );
  NR2 U9 ( .A(n5), .B(n6), .Z(N185) );
  IVP U10 ( .A(n5), .Z(n7) );
  NR2 U11 ( .A(n7), .B(n6), .Z(N186) );
  IVP U12 ( .A(wr_enb), .Z(n8) );
  NR2 U13 ( .A(N185), .B(n8), .Z(n98) );
  IVP U14 ( .A(n98), .Z(n93) );
  NR2 U15 ( .A(n234), .B(n212), .Z(n50) );
  ND2 U16 ( .A(wr_ptr[1]), .B(n50), .Z(n95) );
  NR2 U17 ( .A(n93), .B(n95), .Z(n9) );
  ND2 U18 ( .A(wr_ptr[3]), .B(n9), .Z(n100) );
  IVP U19 ( .A(resetn), .Z(n36) );
  NR2 U20 ( .A(n36), .B(soft_reset), .Z(n51) );
  AO3 U21 ( .A(wr_ptr[3]), .B(n9), .C(n100), .D(n51), .Z(n10) );
  IVP U22 ( .A(n10), .Z(n546) );
  IVP U23 ( .A(rd_enb), .Z(n11) );
  NR2 U24 ( .A(n11), .B(N186), .Z(n117) );
  ND2 U25 ( .A(n93), .B(n117), .Z(n16) );
  NR2 U26 ( .A(n93), .B(n117), .Z(n24) );
  IVP U27 ( .A(n24), .Z(n27) );
  ND2 U28 ( .A(n16), .B(n27), .Z(n21) );
  IVP U29 ( .A(n51), .Z(n115) );
  NR2 U30 ( .A(count[0]), .B(n21), .Z(n12) );
  AO1P U31 ( .A(count[0]), .B(n21), .C(n115), .D(n12), .Z(N179) );
  IVP U32 ( .A(n16), .Z(n30) );
  EO1 U33 ( .A(count[0]), .B(n27), .C(n30), .D(count[0]), .Z(n14) );
  NR2 U34 ( .A(count[1]), .B(n14), .Z(n13) );
  AO1P U35 ( .A(count[1]), .B(n14), .C(n115), .D(n13), .Z(N180) );
  ND2 U36 ( .A(n30), .B(count[1]), .Z(n15) );
  AO3 U37 ( .A(count[1]), .B(n27), .C(n15), .D(n14), .Z(n18) );
  OR3 U38 ( .A(count[0]), .B(count[2]), .C(count[1]), .Z(n116) );
  NR2 U39 ( .A(n116), .B(n16), .Z(n33) );
  AN4P U40 ( .A(n236), .B(count[0]), .C(count[1]), .D(n24), .Z(n17) );
  AO1P U41 ( .A(count[2]), .B(n18), .C(n33), .D(n17), .Z(n19) );
  NR2 U42 ( .A(n19), .B(n115), .Z(N181) );
  ND2 U43 ( .A(count[0]), .B(count[1]), .Z(n20) );
  NR2 U44 ( .A(n236), .B(n20), .Z(n23) );
  ND2 U45 ( .A(n30), .B(n116), .Z(n22) );
  AO3 U46 ( .A(n23), .B(n27), .C(n22), .D(n21), .Z(n29) );
  ND2 U47 ( .A(n24), .B(n23), .Z(n31) );
  ND2 U48 ( .A(n233), .B(n31), .Z(n25) );
  AO4 U49 ( .A(n233), .B(n29), .C(n33), .D(n25), .Z(n26) );
  NR2 U50 ( .A(n26), .B(n115), .Z(N182) );
  NR2 U51 ( .A(n27), .B(count[3]), .Z(n28) );
  AO1P U52 ( .A(count[3]), .B(n30), .C(n29), .D(n28), .Z(n35) );
  NR2 U53 ( .A(n31), .B(n233), .Z(n32) );
  AO1P U54 ( .A(n33), .B(n233), .C(count[4]), .D(n32), .Z(n34) );
  AO1P U55 ( .A(count[4]), .B(n35), .C(n34), .D(n115), .Z(N183) );
  ND2 U56 ( .A(n51), .B(n117), .Z(n209) );
  IVP U57 ( .A(n209), .Z(n44) );
  ND2 U58 ( .A(n44), .B(n211), .Z(n38) );
  NR2 U59 ( .A(n44), .B(n36), .Z(n39) );
  NR2 U60 ( .A(rd_ptr[0]), .B(n209), .Z(n37) );
  NR2 U61 ( .A(n39), .B(n37), .Z(n42) );
  AO4 U62 ( .A(n232), .B(n38), .C(n42), .D(n211), .Z(n410) );
  EO1 U63 ( .A(n209), .B(n232), .C(n232), .D(n39), .Z(n411) );
  NR2 U64 ( .A(n232), .B(n211), .Z(n40) );
  AO2 U65 ( .A(rd_ptr[2]), .B(n211), .C(n40), .D(n210), .Z(n41) );
  AO4 U66 ( .A(n42), .B(n210), .C(n41), .D(n209), .Z(n412) );
  NR2 U67 ( .A(n210), .B(n211), .Z(n101) );
  ND2 U68 ( .A(rd_ptr[0]), .B(n101), .Z(n43) );
  AO2 U69 ( .A(n44), .B(n43), .C(resetn), .D(n209), .Z(n47) );
  ND2 U70 ( .A(n213), .B(n44), .Z(n45) );
  AO4 U71 ( .A(n47), .B(n213), .C(n45), .D(n43), .Z(n413) );
  ND4 U72 ( .A(rd_ptr[3]), .B(rd_ptr[0]), .C(n44), .D(n101), .Z(n48) );
  AN2P U73 ( .A(rd_ptr[4]), .B(n45), .Z(n46) );
  AO2 U74 ( .A(n48), .B(n237), .C(n47), .D(n46), .Z(n414) );
  NR2 U75 ( .A(n212), .B(n93), .Z(n92) );
  NR2 U76 ( .A(wr_ptr[1]), .B(n92), .Z(n49) );
  AO1P U77 ( .A(wr_ptr[1]), .B(n92), .C(n115), .D(n49), .Z(n415) );
  ND2 U78 ( .A(n51), .B(n98), .Z(n52) );
  NR2 U79 ( .A(n238), .B(n52), .Z(n56) );
  AO6 U80 ( .A(wr_ptr[1]), .B(n56), .C(n115), .Z(n62) );
  NR2 U81 ( .A(n50), .B(n115), .Z(n60) );
  NR2 U82 ( .A(n62), .B(n60), .Z(n72) );
  IVP U83 ( .A(n52), .Z(n70) );
  ND2 U84 ( .A(n70), .B(data_in[0]), .Z(n63) );
  IVP U85 ( .A(n72), .Z(n71) );
  AO2 U86 ( .A(n72), .B(n63), .C(n239), .D(n71), .Z(n416) );
  ND2 U87 ( .A(n234), .B(n212), .Z(n94) );
  AN2P U88 ( .A(n94), .B(n51), .Z(n57) );
  NR2 U89 ( .A(wr_ptr[3]), .B(n52), .Z(n53) );
  AO6 U90 ( .A(n53), .B(n235), .C(n115), .Z(n54) );
  NR2 U91 ( .A(n57), .B(n54), .Z(n73) );
  EO1 U92 ( .A(n73), .B(n63), .C(\mem[0][0] ), .D(n73), .Z(n417) );
  AO6 U93 ( .A(wr_ptr[0]), .B(n234), .C(n115), .Z(n58) );
  NR2 U94 ( .A(n54), .B(n58), .Z(n74) );
  EO1 U95 ( .A(n74), .B(n63), .C(\mem[1][0] ), .D(n74), .Z(n418) );
  AO6 U96 ( .A(wr_ptr[1]), .B(n53), .C(n115), .Z(n55) );
  NR2 U97 ( .A(n57), .B(n55), .Z(n75) );
  EO1 U98 ( .A(n75), .B(n63), .C(\mem[2][0] ), .D(n75), .Z(n419) );
  NR2 U99 ( .A(n58), .B(n55), .Z(n76) );
  EO1 U100 ( .A(n76), .B(n63), .C(\mem[3][0] ), .D(n76), .Z(n420) );
  AO6 U101 ( .A(wr_ptr[2]), .B(n212), .C(n115), .Z(n61) );
  NR2 U102 ( .A(n54), .B(n61), .Z(n77) );
  EO1 U103 ( .A(n77), .B(n63), .C(\mem[4][0] ), .D(n77), .Z(n421) );
  NR2 U104 ( .A(n60), .B(n54), .Z(n78) );
  EO1 U105 ( .A(n78), .B(n63), .C(\mem[5][0] ), .D(n78), .Z(n422) );
  NR2 U106 ( .A(n55), .B(n61), .Z(n79) );
  EO1 U107 ( .A(n79), .B(n63), .C(\mem[6][0] ), .D(n79), .Z(n423) );
  NR2 U108 ( .A(n60), .B(n55), .Z(n80) );
  EO1 U109 ( .A(n80), .B(n63), .C(\mem[7][0] ), .D(n80), .Z(n424) );
  AO6 U110 ( .A(n56), .B(n235), .C(n115), .Z(n59) );
  NR2 U111 ( .A(n57), .B(n59), .Z(n81) );
  EO1 U112 ( .A(n81), .B(n63), .C(\mem[8][0] ), .D(n81), .Z(n425) );
  NR2 U113 ( .A(n58), .B(n59), .Z(n82) );
  EO1 U114 ( .A(n82), .B(n63), .C(\mem[9][0] ), .D(n82), .Z(n426) );
  NR2 U115 ( .A(n62), .B(n57), .Z(n84) );
  IVP U116 ( .A(n84), .Z(n83) );
  AO2 U117 ( .A(n84), .B(n63), .C(n240), .D(n83), .Z(n427) );
  NR2 U118 ( .A(n62), .B(n58), .Z(n86) );
  IVP U119 ( .A(n86), .Z(n85) );
  AO2 U120 ( .A(n86), .B(n63), .C(n215), .D(n85), .Z(n428) );
  NR2 U121 ( .A(n61), .B(n59), .Z(n87) );
  EO1 U122 ( .A(n87), .B(n63), .C(\mem[12][0] ), .D(n87), .Z(n429) );
  NR2 U123 ( .A(n60), .B(n59), .Z(n88) );
  EO1 U124 ( .A(n88), .B(n63), .C(\mem[13][0] ), .D(n88), .Z(n430) );
  NR2 U125 ( .A(n62), .B(n61), .Z(n91) );
  IVP U126 ( .A(n91), .Z(n89) );
  AO2 U127 ( .A(n91), .B(n63), .C(n216), .D(n89), .Z(n431) );
  ND2 U128 ( .A(n70), .B(data_in[1]), .Z(n64) );
  AO2 U129 ( .A(n72), .B(n64), .C(n253), .D(n71), .Z(n432) );
  EO1 U130 ( .A(n73), .B(n64), .C(\mem[0][1] ), .D(n73), .Z(n433) );
  EO1 U131 ( .A(n74), .B(n64), .C(\mem[1][1] ), .D(n74), .Z(n434) );
  EO1 U132 ( .A(n75), .B(n64), .C(\mem[2][1] ), .D(n75), .Z(n435) );
  EO1 U133 ( .A(n76), .B(n64), .C(\mem[3][1] ), .D(n76), .Z(n436) );
  EO1 U134 ( .A(n77), .B(n64), .C(\mem[4][1] ), .D(n77), .Z(n437) );
  EO1 U135 ( .A(n78), .B(n64), .C(\mem[5][1] ), .D(n78), .Z(n438) );
  EO1 U136 ( .A(n79), .B(n64), .C(\mem[6][1] ), .D(n79), .Z(n439) );
  EO1 U137 ( .A(n80), .B(n64), .C(\mem[7][1] ), .D(n80), .Z(n440) );
  EO1 U138 ( .A(n81), .B(n64), .C(\mem[8][1] ), .D(n81), .Z(n441) );
  EO1 U139 ( .A(n82), .B(n64), .C(\mem[9][1] ), .D(n82), .Z(n442) );
  AO2 U140 ( .A(n84), .B(n64), .C(n254), .D(n83), .Z(n443) );
  AO2 U141 ( .A(n86), .B(n64), .C(n229), .D(n85), .Z(n444) );
  EO1 U142 ( .A(n87), .B(n64), .C(\mem[12][1] ), .D(n87), .Z(n445) );
  EO1 U143 ( .A(n88), .B(n64), .C(\mem[13][1] ), .D(n88), .Z(n446) );
  AO2 U144 ( .A(n91), .B(n64), .C(n230), .D(n89), .Z(n447) );
  ND2 U145 ( .A(n70), .B(data_in[2]), .Z(n65) );
  AO2 U146 ( .A(n72), .B(n65), .C(n251), .D(n71), .Z(n448) );
  EO1 U147 ( .A(n73), .B(n65), .C(\mem[0][2] ), .D(n73), .Z(n449) );
  EO1 U148 ( .A(n74), .B(n65), .C(\mem[1][2] ), .D(n74), .Z(n450) );
  EO1 U149 ( .A(n75), .B(n65), .C(\mem[2][2] ), .D(n75), .Z(n451) );
  EO1 U150 ( .A(n76), .B(n65), .C(\mem[3][2] ), .D(n76), .Z(n452) );
  EO1 U151 ( .A(n77), .B(n65), .C(\mem[4][2] ), .D(n77), .Z(n453) );
  EO1 U152 ( .A(n78), .B(n65), .C(\mem[5][2] ), .D(n78), .Z(n454) );
  EO1 U153 ( .A(n79), .B(n65), .C(\mem[6][2] ), .D(n79), .Z(n455) );
  EO1 U154 ( .A(n80), .B(n65), .C(\mem[7][2] ), .D(n80), .Z(n456) );
  EO1 U155 ( .A(n81), .B(n65), .C(\mem[8][2] ), .D(n81), .Z(n457) );
  EO1 U156 ( .A(n82), .B(n65), .C(\mem[9][2] ), .D(n82), .Z(n458) );
  AO2 U157 ( .A(n84), .B(n65), .C(n252), .D(n83), .Z(n459) );
  AO2 U158 ( .A(n86), .B(n65), .C(n227), .D(n85), .Z(n460) );
  EO1 U159 ( .A(n87), .B(n65), .C(\mem[12][2] ), .D(n87), .Z(n461) );
  EO1 U160 ( .A(n88), .B(n65), .C(\mem[13][2] ), .D(n88), .Z(n462) );
  AO2 U161 ( .A(n91), .B(n65), .C(n228), .D(n89), .Z(n463) );
  ND2 U162 ( .A(n70), .B(data_in[3]), .Z(n66) );
  AO2 U163 ( .A(n72), .B(n66), .C(n249), .D(n71), .Z(n464) );
  EO1 U164 ( .A(n73), .B(n66), .C(\mem[0][3] ), .D(n73), .Z(n465) );
  EO1 U165 ( .A(n74), .B(n66), .C(\mem[1][3] ), .D(n74), .Z(n466) );
  EO1 U166 ( .A(n75), .B(n66), .C(\mem[2][3] ), .D(n75), .Z(n467) );
  EO1 U167 ( .A(n76), .B(n66), .C(\mem[3][3] ), .D(n76), .Z(n468) );
  EO1 U168 ( .A(n77), .B(n66), .C(\mem[4][3] ), .D(n77), .Z(n469) );
  EO1 U169 ( .A(n78), .B(n66), .C(\mem[5][3] ), .D(n78), .Z(n470) );
  EO1 U170 ( .A(n79), .B(n66), .C(\mem[6][3] ), .D(n79), .Z(n471) );
  EO1 U171 ( .A(n80), .B(n66), .C(\mem[7][3] ), .D(n80), .Z(n472) );
  EO1 U172 ( .A(n81), .B(n66), .C(\mem[8][3] ), .D(n81), .Z(n473) );
  EO1 U173 ( .A(n82), .B(n66), .C(\mem[9][3] ), .D(n82), .Z(n474) );
  AO2 U174 ( .A(n84), .B(n66), .C(n250), .D(n83), .Z(n475) );
  AO2 U175 ( .A(n86), .B(n66), .C(n225), .D(n85), .Z(n476) );
  EO1 U176 ( .A(n87), .B(n66), .C(\mem[12][3] ), .D(n87), .Z(n477) );
  EO1 U177 ( .A(n88), .B(n66), .C(\mem[13][3] ), .D(n88), .Z(n478) );
  AO2 U178 ( .A(n91), .B(n66), .C(n226), .D(n89), .Z(n479) );
  ND2 U179 ( .A(n70), .B(data_in[4]), .Z(n67) );
  AO2 U180 ( .A(n72), .B(n67), .C(n247), .D(n71), .Z(n480) );
  EO1 U181 ( .A(n73), .B(n67), .C(\mem[0][4] ), .D(n73), .Z(n481) );
  EO1 U182 ( .A(n74), .B(n67), .C(\mem[1][4] ), .D(n74), .Z(n482) );
  EO1 U183 ( .A(n75), .B(n67), .C(\mem[2][4] ), .D(n75), .Z(n483) );
  EO1 U184 ( .A(n76), .B(n67), .C(\mem[3][4] ), .D(n76), .Z(n484) );
  EO1 U185 ( .A(n77), .B(n67), .C(\mem[4][4] ), .D(n77), .Z(n485) );
  EO1 U186 ( .A(n78), .B(n67), .C(\mem[5][4] ), .D(n78), .Z(n486) );
  EO1 U187 ( .A(n79), .B(n67), .C(\mem[6][4] ), .D(n79), .Z(n487) );
  EO1 U188 ( .A(n80), .B(n67), .C(\mem[7][4] ), .D(n80), .Z(n488) );
  EO1 U189 ( .A(n81), .B(n67), .C(\mem[8][4] ), .D(n81), .Z(n489) );
  EO1 U190 ( .A(n82), .B(n67), .C(\mem[9][4] ), .D(n82), .Z(n490) );
  AO2 U191 ( .A(n84), .B(n67), .C(n248), .D(n83), .Z(n491) );
  AO2 U192 ( .A(n86), .B(n67), .C(n223), .D(n85), .Z(n492) );
  EO1 U193 ( .A(n87), .B(n67), .C(\mem[12][4] ), .D(n87), .Z(n493) );
  EO1 U194 ( .A(n88), .B(n67), .C(\mem[13][4] ), .D(n88), .Z(n494) );
  AO2 U195 ( .A(n91), .B(n67), .C(n224), .D(n89), .Z(n495) );
  ND2 U196 ( .A(n70), .B(data_in[5]), .Z(n68) );
  AO2 U197 ( .A(n72), .B(n68), .C(n245), .D(n71), .Z(n496) );
  EO1 U198 ( .A(n73), .B(n68), .C(\mem[0][5] ), .D(n73), .Z(n497) );
  EO1 U199 ( .A(n74), .B(n68), .C(\mem[1][5] ), .D(n74), .Z(n498) );
  EO1 U200 ( .A(n75), .B(n68), .C(\mem[2][5] ), .D(n75), .Z(n499) );
  EO1 U201 ( .A(n76), .B(n68), .C(\mem[3][5] ), .D(n76), .Z(n500) );
  EO1 U202 ( .A(n77), .B(n68), .C(\mem[4][5] ), .D(n77), .Z(n501) );
  EO1 U203 ( .A(n78), .B(n68), .C(\mem[5][5] ), .D(n78), .Z(n502) );
  EO1 U204 ( .A(n79), .B(n68), .C(\mem[6][5] ), .D(n79), .Z(n503) );
  EO1 U205 ( .A(n80), .B(n68), .C(\mem[7][5] ), .D(n80), .Z(n504) );
  EO1 U206 ( .A(n81), .B(n68), .C(\mem[8][5] ), .D(n81), .Z(n505) );
  EO1 U207 ( .A(n82), .B(n68), .C(\mem[9][5] ), .D(n82), .Z(n506) );
  AO2 U208 ( .A(n84), .B(n68), .C(n246), .D(n83), .Z(n507) );
  AO2 U209 ( .A(n86), .B(n68), .C(n221), .D(n85), .Z(n508) );
  EO1 U210 ( .A(n87), .B(n68), .C(\mem[12][5] ), .D(n87), .Z(n509) );
  EO1 U211 ( .A(n88), .B(n68), .C(\mem[13][5] ), .D(n88), .Z(n510) );
  AO2 U212 ( .A(n91), .B(n68), .C(n222), .D(n89), .Z(n511) );
  ND2 U213 ( .A(n70), .B(data_in[6]), .Z(n69) );
  AO2 U214 ( .A(n72), .B(n69), .C(n219), .D(n71), .Z(n512) );
  EO1 U215 ( .A(n73), .B(n69), .C(\mem[0][6] ), .D(n73), .Z(n513) );
  EO1 U216 ( .A(n74), .B(n69), .C(\mem[1][6] ), .D(n74), .Z(n514) );
  EO1 U217 ( .A(n75), .B(n69), .C(\mem[2][6] ), .D(n75), .Z(n515) );
  EO1 U218 ( .A(n76), .B(n69), .C(\mem[3][6] ), .D(n76), .Z(n516) );
  EO1 U219 ( .A(n77), .B(n69), .C(\mem[4][6] ), .D(n77), .Z(n517) );
  EO1 U220 ( .A(n78), .B(n69), .C(\mem[5][6] ), .D(n78), .Z(n518) );
  EO1 U221 ( .A(n79), .B(n69), .C(\mem[6][6] ), .D(n79), .Z(n519) );
  EO1 U222 ( .A(n80), .B(n69), .C(\mem[7][6] ), .D(n80), .Z(n520) );
  EO1 U223 ( .A(n81), .B(n69), .C(\mem[8][6] ), .D(n81), .Z(n521) );
  EO1 U224 ( .A(n82), .B(n69), .C(\mem[9][6] ), .D(n82), .Z(n522) );
  AO2 U225 ( .A(n84), .B(n69), .C(n244), .D(n83), .Z(n523) );
  AO2 U226 ( .A(n86), .B(n69), .C(n243), .D(n85), .Z(n524) );
  EO1 U227 ( .A(n87), .B(n69), .C(\mem[12][6] ), .D(n87), .Z(n525) );
  EO1 U228 ( .A(n88), .B(n69), .C(\mem[13][6] ), .D(n88), .Z(n526) );
  AO2 U229 ( .A(n91), .B(n69), .C(n220), .D(n89), .Z(n527) );
  ND2 U230 ( .A(n70), .B(data_in[7]), .Z(n90) );
  AO2 U231 ( .A(n72), .B(n90), .C(n217), .D(n71), .Z(n528) );
  EO1 U232 ( .A(n73), .B(n90), .C(\mem[0][7] ), .D(n73), .Z(n529) );
  EO1 U233 ( .A(n74), .B(n90), .C(\mem[1][7] ), .D(n74), .Z(n530) );
  EO1 U234 ( .A(n75), .B(n90), .C(\mem[2][7] ), .D(n75), .Z(n531) );
  EO1 U235 ( .A(n76), .B(n90), .C(\mem[3][7] ), .D(n76), .Z(n532) );
  EO1 U236 ( .A(n77), .B(n90), .C(\mem[4][7] ), .D(n77), .Z(n533) );
  EO1 U237 ( .A(n78), .B(n90), .C(\mem[5][7] ), .D(n78), .Z(n534) );
  EO1 U238 ( .A(n79), .B(n90), .C(\mem[6][7] ), .D(n79), .Z(n535) );
  EO1 U239 ( .A(n80), .B(n90), .C(\mem[7][7] ), .D(n80), .Z(n536) );
  EO1 U240 ( .A(n81), .B(n90), .C(\mem[8][7] ), .D(n81), .Z(n537) );
  EO1 U241 ( .A(n82), .B(n90), .C(\mem[9][7] ), .D(n82), .Z(n538) );
  AO2 U242 ( .A(n84), .B(n90), .C(n242), .D(n83), .Z(n539) );
  AO2 U243 ( .A(n86), .B(n90), .C(n241), .D(n85), .Z(n540) );
  EO1 U244 ( .A(n87), .B(n90), .C(\mem[12][7] ), .D(n87), .Z(n541) );
  EO1 U245 ( .A(n88), .B(n90), .C(\mem[13][7] ), .D(n88), .Z(n542) );
  AO2 U246 ( .A(n91), .B(n90), .C(n218), .D(n89), .Z(n543) );
  AO1P U247 ( .A(n212), .B(n93), .C(n92), .D(n115), .Z(n544) );
  AO3 U248 ( .A(wr_ptr[2]), .B(wr_ptr[1]), .C(n95), .D(n94), .Z(n97) );
  NR2 U249 ( .A(wr_ptr[2]), .B(n98), .Z(n96) );
  AO1P U250 ( .A(n98), .B(n97), .C(n115), .D(n96), .Z(n545) );
  NR2 U251 ( .A(n214), .B(n100), .Z(n99) );
  AO1P U252 ( .A(n214), .B(n100), .C(n115), .D(n99), .Z(n547) );
  ND2 U253 ( .A(rd_ptr[3]), .B(n101), .Z(n192) );
  ND2 U254 ( .A(n210), .B(rd_ptr[3]), .Z(n102) );
  OR2P U255 ( .A(n211), .B(n102), .Z(n193) );
  AO4 U256 ( .A(n239), .B(n192), .C(n215), .D(n193), .Z(n114) );
  ND2 U257 ( .A(n213), .B(n210), .Z(n103) );
  NR2 U258 ( .A(n211), .B(n103), .Z(n195) );
  ND2 U259 ( .A(rd_ptr[2]), .B(n211), .Z(n104) );
  NR2 U260 ( .A(rd_ptr[3]), .B(n104), .Z(n194) );
  AO2 U261 ( .A(\mem[3][0] ), .B(n195), .C(\mem[5][0] ), .D(n194), .Z(n107) );
  AN2P U262 ( .A(n213), .B(n101), .Z(n197) );
  NR2 U263 ( .A(rd_ptr[1]), .B(n102), .Z(n196) );
  AO2 U264 ( .A(\mem[7][0] ), .B(n197), .C(\mem[9][0] ), .D(n196), .Z(n106) );
  NR2 U265 ( .A(rd_ptr[1]), .B(n103), .Z(n199) );
  NR2 U266 ( .A(n213), .B(n104), .Z(n198) );
  AO2 U267 ( .A(\mem[1][0] ), .B(n199), .C(\mem[13][0] ), .D(n198), .Z(n105)
         );
  ND4 U268 ( .A(rd_ptr[0]), .B(n107), .C(n106), .D(n105), .Z(n113) );
  AO4 U269 ( .A(n240), .B(n193), .C(n216), .D(n192), .Z(n112) );
  AO2 U270 ( .A(\mem[2][0] ), .B(n195), .C(\mem[4][0] ), .D(n194), .Z(n110) );
  AO2 U271 ( .A(\mem[6][0] ), .B(n197), .C(\mem[8][0] ), .D(n196), .Z(n109) );
  AO2 U272 ( .A(\mem[0][0] ), .B(n199), .C(\mem[12][0] ), .D(n198), .Z(n108)
         );
  ND4 U273 ( .A(n110), .B(n109), .C(n108), .D(n232), .Z(n111) );
  AO4 U274 ( .A(n114), .B(n113), .C(n112), .D(n111), .Z(n120) );
  NR2 U275 ( .A(n117), .B(n115), .Z(n119) );
  NR4 U276 ( .A(n117), .B(count[4]), .C(n116), .D(n115), .Z(n118) );
  ND2 U277 ( .A(n118), .B(n233), .Z(n122) );
  ND2 U278 ( .A(n119), .B(n122), .Z(n207) );
  AO4 U279 ( .A(n209), .B(n120), .C(n207), .D(n255), .Z(n548) );
  ND2 U280 ( .A(soft_reset), .B(resetn), .Z(n121) );
  AO3 U281 ( .A(n207), .B(n231), .C(n122), .D(n121), .Z(n549) );
  AO4 U282 ( .A(n217), .B(n192), .C(n241), .D(n193), .Z(n132) );
  AO2 U283 ( .A(\mem[3][7] ), .B(n195), .C(\mem[5][7] ), .D(n194), .Z(n125) );
  AO2 U284 ( .A(\mem[7][7] ), .B(n197), .C(\mem[9][7] ), .D(n196), .Z(n124) );
  AO2 U285 ( .A(\mem[1][7] ), .B(n199), .C(\mem[13][7] ), .D(n198), .Z(n123)
         );
  ND4 U286 ( .A(rd_ptr[0]), .B(n125), .C(n124), .D(n123), .Z(n131) );
  AO4 U287 ( .A(n242), .B(n193), .C(n218), .D(n192), .Z(n130) );
  AO2 U288 ( .A(\mem[2][7] ), .B(n195), .C(\mem[4][7] ), .D(n194), .Z(n128) );
  AO2 U289 ( .A(\mem[6][7] ), .B(n197), .C(\mem[8][7] ), .D(n196), .Z(n127) );
  AO2 U290 ( .A(\mem[0][7] ), .B(n199), .C(\mem[12][7] ), .D(n198), .Z(n126)
         );
  ND4 U291 ( .A(n128), .B(n127), .C(n126), .D(n232), .Z(n129) );
  AO4 U292 ( .A(n132), .B(n131), .C(n130), .D(n129), .Z(n133) );
  AO4 U293 ( .A(n209), .B(n133), .C(n207), .D(n256), .Z(n550) );
  AO4 U294 ( .A(n219), .B(n192), .C(n243), .D(n193), .Z(n143) );
  AO2 U295 ( .A(\mem[3][6] ), .B(n195), .C(\mem[5][6] ), .D(n194), .Z(n136) );
  AO2 U296 ( .A(\mem[7][6] ), .B(n197), .C(\mem[9][6] ), .D(n196), .Z(n135) );
  AO2 U297 ( .A(\mem[1][6] ), .B(n199), .C(\mem[13][6] ), .D(n198), .Z(n134)
         );
  ND4 U298 ( .A(rd_ptr[0]), .B(n136), .C(n135), .D(n134), .Z(n142) );
  AO4 U299 ( .A(n244), .B(n193), .C(n220), .D(n192), .Z(n141) );
  AO2 U300 ( .A(\mem[2][6] ), .B(n195), .C(\mem[4][6] ), .D(n194), .Z(n139) );
  AO2 U301 ( .A(\mem[6][6] ), .B(n197), .C(\mem[8][6] ), .D(n196), .Z(n138) );
  AO2 U302 ( .A(\mem[0][6] ), .B(n199), .C(\mem[12][6] ), .D(n198), .Z(n137)
         );
  ND4 U303 ( .A(n139), .B(n138), .C(n137), .D(n232), .Z(n140) );
  AO4 U304 ( .A(n143), .B(n142), .C(n141), .D(n140), .Z(n144) );
  AO4 U305 ( .A(n209), .B(n144), .C(n207), .D(n404), .Z(n551) );
  AO4 U306 ( .A(n245), .B(n192), .C(n221), .D(n193), .Z(n154) );
  AO2 U307 ( .A(\mem[3][5] ), .B(n195), .C(\mem[5][5] ), .D(n194), .Z(n147) );
  AO2 U308 ( .A(\mem[7][5] ), .B(n197), .C(\mem[9][5] ), .D(n196), .Z(n146) );
  AO2 U309 ( .A(\mem[1][5] ), .B(n199), .C(\mem[13][5] ), .D(n198), .Z(n145)
         );
  ND4 U310 ( .A(rd_ptr[0]), .B(n147), .C(n146), .D(n145), .Z(n153) );
  AO4 U311 ( .A(n246), .B(n193), .C(n222), .D(n192), .Z(n152) );
  AO2 U312 ( .A(\mem[2][5] ), .B(n195), .C(\mem[4][5] ), .D(n194), .Z(n150) );
  AO2 U313 ( .A(\mem[6][5] ), .B(n197), .C(\mem[8][5] ), .D(n196), .Z(n149) );
  AO2 U314 ( .A(\mem[0][5] ), .B(n199), .C(\mem[12][5] ), .D(n198), .Z(n148)
         );
  ND4 U315 ( .A(n150), .B(n149), .C(n148), .D(n232), .Z(n151) );
  AO4 U316 ( .A(n154), .B(n153), .C(n152), .D(n151), .Z(n155) );
  AO4 U317 ( .A(n209), .B(n155), .C(n207), .D(n405), .Z(n552) );
  AO4 U318 ( .A(n247), .B(n192), .C(n223), .D(n193), .Z(n165) );
  AO2 U319 ( .A(\mem[3][4] ), .B(n195), .C(\mem[5][4] ), .D(n194), .Z(n158) );
  AO2 U320 ( .A(\mem[7][4] ), .B(n197), .C(\mem[9][4] ), .D(n196), .Z(n157) );
  AO2 U321 ( .A(\mem[1][4] ), .B(n199), .C(\mem[13][4] ), .D(n198), .Z(n156)
         );
  ND4 U322 ( .A(rd_ptr[0]), .B(n158), .C(n157), .D(n156), .Z(n164) );
  AO4 U323 ( .A(n248), .B(n193), .C(n224), .D(n192), .Z(n163) );
  AO2 U324 ( .A(\mem[2][4] ), .B(n195), .C(\mem[4][4] ), .D(n194), .Z(n161) );
  AO2 U325 ( .A(\mem[6][4] ), .B(n197), .C(\mem[8][4] ), .D(n196), .Z(n160) );
  AO2 U326 ( .A(\mem[0][4] ), .B(n199), .C(\mem[12][4] ), .D(n198), .Z(n159)
         );
  ND4 U327 ( .A(n161), .B(n160), .C(n159), .D(n232), .Z(n162) );
  AO4 U328 ( .A(n165), .B(n164), .C(n163), .D(n162), .Z(n166) );
  AO4 U329 ( .A(n209), .B(n166), .C(n207), .D(n406), .Z(n553) );
  AO4 U330 ( .A(n249), .B(n192), .C(n225), .D(n193), .Z(n176) );
  AO2 U331 ( .A(\mem[3][3] ), .B(n195), .C(\mem[5][3] ), .D(n194), .Z(n169) );
  AO2 U332 ( .A(\mem[7][3] ), .B(n197), .C(\mem[9][3] ), .D(n196), .Z(n168) );
  AO2 U333 ( .A(\mem[1][3] ), .B(n199), .C(\mem[13][3] ), .D(n198), .Z(n167)
         );
  ND4 U334 ( .A(rd_ptr[0]), .B(n169), .C(n168), .D(n167), .Z(n175) );
  AO4 U335 ( .A(n250), .B(n193), .C(n226), .D(n192), .Z(n174) );
  AO2 U336 ( .A(\mem[2][3] ), .B(n195), .C(\mem[4][3] ), .D(n194), .Z(n172) );
  AO2 U337 ( .A(\mem[6][3] ), .B(n197), .C(\mem[8][3] ), .D(n196), .Z(n171) );
  AO2 U338 ( .A(\mem[0][3] ), .B(n199), .C(\mem[12][3] ), .D(n198), .Z(n170)
         );
  ND4 U339 ( .A(n172), .B(n171), .C(n170), .D(n232), .Z(n173) );
  AO4 U340 ( .A(n176), .B(n175), .C(n174), .D(n173), .Z(n177) );
  AO4 U341 ( .A(n209), .B(n177), .C(n207), .D(n407), .Z(n554) );
  AO4 U342 ( .A(n251), .B(n192), .C(n227), .D(n193), .Z(n187) );
  AO2 U343 ( .A(\mem[3][2] ), .B(n195), .C(\mem[5][2] ), .D(n194), .Z(n180) );
  AO2 U344 ( .A(\mem[7][2] ), .B(n197), .C(\mem[9][2] ), .D(n196), .Z(n179) );
  AO2 U345 ( .A(\mem[1][2] ), .B(n199), .C(\mem[13][2] ), .D(n198), .Z(n178)
         );
  ND4 U346 ( .A(rd_ptr[0]), .B(n180), .C(n179), .D(n178), .Z(n186) );
  AO4 U347 ( .A(n252), .B(n193), .C(n228), .D(n192), .Z(n185) );
  AO2 U348 ( .A(\mem[2][2] ), .B(n195), .C(\mem[4][2] ), .D(n194), .Z(n183) );
  AO2 U349 ( .A(\mem[6][2] ), .B(n197), .C(\mem[8][2] ), .D(n196), .Z(n182) );
  AO2 U350 ( .A(\mem[0][2] ), .B(n199), .C(\mem[12][2] ), .D(n198), .Z(n181)
         );
  ND4 U351 ( .A(n183), .B(n182), .C(n181), .D(n232), .Z(n184) );
  AO4 U352 ( .A(n187), .B(n186), .C(n185), .D(n184), .Z(n188) );
  AO4 U353 ( .A(n209), .B(n188), .C(n207), .D(n408), .Z(n555) );
  AO4 U354 ( .A(n253), .B(n192), .C(n229), .D(n193), .Z(n206) );
  AO2 U355 ( .A(\mem[3][1] ), .B(n195), .C(\mem[5][1] ), .D(n194), .Z(n191) );
  AO2 U356 ( .A(\mem[7][1] ), .B(n197), .C(\mem[9][1] ), .D(n196), .Z(n190) );
  AO2 U357 ( .A(\mem[1][1] ), .B(n199), .C(\mem[13][1] ), .D(n198), .Z(n189)
         );
  ND4 U358 ( .A(rd_ptr[0]), .B(n191), .C(n190), .D(n189), .Z(n205) );
  AO4 U359 ( .A(n254), .B(n193), .C(n230), .D(n192), .Z(n204) );
  AO2 U360 ( .A(\mem[2][1] ), .B(n195), .C(\mem[4][1] ), .D(n194), .Z(n202) );
  AO2 U361 ( .A(\mem[6][1] ), .B(n197), .C(\mem[8][1] ), .D(n196), .Z(n201) );
  AO2 U362 ( .A(\mem[0][1] ), .B(n199), .C(\mem[12][1] ), .D(n198), .Z(n200)
         );
  ND4 U363 ( .A(n202), .B(n201), .C(n200), .D(n232), .Z(n203) );
  AO4 U364 ( .A(n206), .B(n205), .C(n204), .D(n203), .Z(n208) );
  AO4 U365 ( .A(n209), .B(n208), .C(n207), .D(n409), .Z(n556) );
endmodule


module fifo_1 ( clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state, data_in, 
        data_out, full, empty );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, resetn, soft_reset, wr_enb, rd_enb, lfd_state;
  output full, empty;
  wire   \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] ,
         \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][7] , \mem[1][6] ,
         \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] ,
         \mem[1][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[3][7] ,
         \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] ,
         \mem[3][1] , \mem[3][0] , \mem[4][7] , \mem[4][6] , \mem[4][5] ,
         \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] ,
         \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] ,
         \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] ,
         \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] ,
         \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[8][7] ,
         \mem[8][6] , \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] ,
         \mem[8][1] , \mem[8][0] , \mem[9][7] , \mem[9][6] , \mem[9][5] ,
         \mem[9][4] , \mem[9][3] , \mem[9][2] , \mem[9][1] , \mem[9][0] ,
         \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] , \mem[12][3] ,
         \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , N71, N74, N77, N80, N83, N86, N89, N92, N179, N180,
         N181, N182, N183, N185, N186, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556;
  wire   [4:0] rd_ptr;
  wire   [4:0] count;
  wire   [4:0] wr_ptr;
  tri   [7:0] data_out;
  assign full = N185;
  assign empty = N186;

  FD1 \wr_ptr_reg[0]  ( .D(n544), .CP(clk), .Q(wr_ptr[0]), .QN(n212) );
  FD1 \rd_ptr_reg[1]  ( .D(n410), .CP(clk), .Q(rd_ptr[1]), .QN(n211) );
  FD1 \rd_ptr_reg[0]  ( .D(n411), .CP(clk), .Q(rd_ptr[0]), .QN(n232) );
  FD1 \rd_ptr_reg[2]  ( .D(n412), .CP(clk), .Q(rd_ptr[2]), .QN(n210) );
  FD1 \rd_ptr_reg[3]  ( .D(n413), .CP(clk), .Q(rd_ptr[3]), .QN(n213) );
  FD1 \rd_ptr_reg[4]  ( .D(n414), .CP(clk), .Q(rd_ptr[4]), .QN(n237) );
  FD1 \wr_ptr_reg[1]  ( .D(n415), .CP(clk), .Q(wr_ptr[1]), .QN(n235) );
  FD1 \wr_ptr_reg[2]  ( .D(n545), .CP(clk), .Q(wr_ptr[2]), .QN(n234) );
  FD1 \wr_ptr_reg[3]  ( .D(n546), .CP(clk), .Q(wr_ptr[3]), .QN(n238) );
  FD1 \wr_ptr_reg[4]  ( .D(n547), .CP(clk), .Q(wr_ptr[4]), .QN(n214) );
  FD1 \mem_reg[0][7]  ( .D(n529), .CP(clk), .Q(\mem[0][7] ) );
  FD1 \mem_reg[0][6]  ( .D(n513), .CP(clk), .Q(\mem[0][6] ) );
  FD1 \mem_reg[0][5]  ( .D(n497), .CP(clk), .Q(\mem[0][5] ) );
  FD1 \mem_reg[0][4]  ( .D(n481), .CP(clk), .Q(\mem[0][4] ) );
  FD1 \mem_reg[0][3]  ( .D(n465), .CP(clk), .Q(\mem[0][3] ) );
  FD1 \mem_reg[0][2]  ( .D(n449), .CP(clk), .Q(\mem[0][2] ) );
  FD1 \mem_reg[0][1]  ( .D(n433), .CP(clk), .Q(\mem[0][1] ) );
  FD1 \mem_reg[0][0]  ( .D(n417), .CP(clk), .Q(\mem[0][0] ) );
  FD1 \mem_reg[1][7]  ( .D(n530), .CP(clk), .Q(\mem[1][7] ) );
  FD1 \mem_reg[1][6]  ( .D(n514), .CP(clk), .Q(\mem[1][6] ) );
  FD1 \mem_reg[1][5]  ( .D(n498), .CP(clk), .Q(\mem[1][5] ) );
  FD1 \mem_reg[1][4]  ( .D(n482), .CP(clk), .Q(\mem[1][4] ) );
  FD1 \mem_reg[1][3]  ( .D(n466), .CP(clk), .Q(\mem[1][3] ) );
  FD1 \mem_reg[1][2]  ( .D(n450), .CP(clk), .Q(\mem[1][2] ) );
  FD1 \mem_reg[1][1]  ( .D(n434), .CP(clk), .Q(\mem[1][1] ) );
  FD1 \mem_reg[1][0]  ( .D(n418), .CP(clk), .Q(\mem[1][0] ) );
  FD1 \mem_reg[2][7]  ( .D(n531), .CP(clk), .Q(\mem[2][7] ) );
  FD1 \mem_reg[2][6]  ( .D(n515), .CP(clk), .Q(\mem[2][6] ) );
  FD1 \mem_reg[2][5]  ( .D(n499), .CP(clk), .Q(\mem[2][5] ) );
  FD1 \mem_reg[2][4]  ( .D(n483), .CP(clk), .Q(\mem[2][4] ) );
  FD1 \mem_reg[2][3]  ( .D(n467), .CP(clk), .Q(\mem[2][3] ) );
  FD1 \mem_reg[2][2]  ( .D(n451), .CP(clk), .Q(\mem[2][2] ) );
  FD1 \mem_reg[2][1]  ( .D(n435), .CP(clk), .Q(\mem[2][1] ) );
  FD1 \mem_reg[2][0]  ( .D(n419), .CP(clk), .Q(\mem[2][0] ) );
  FD1 \mem_reg[3][7]  ( .D(n532), .CP(clk), .Q(\mem[3][7] ) );
  FD1 \mem_reg[3][6]  ( .D(n516), .CP(clk), .Q(\mem[3][6] ) );
  FD1 \mem_reg[3][5]  ( .D(n500), .CP(clk), .Q(\mem[3][5] ) );
  FD1 \mem_reg[3][4]  ( .D(n484), .CP(clk), .Q(\mem[3][4] ) );
  FD1 \mem_reg[3][3]  ( .D(n468), .CP(clk), .Q(\mem[3][3] ) );
  FD1 \mem_reg[3][2]  ( .D(n452), .CP(clk), .Q(\mem[3][2] ) );
  FD1 \mem_reg[3][1]  ( .D(n436), .CP(clk), .Q(\mem[3][1] ) );
  FD1 \mem_reg[3][0]  ( .D(n420), .CP(clk), .Q(\mem[3][0] ) );
  FD1 \mem_reg[4][7]  ( .D(n533), .CP(clk), .Q(\mem[4][7] ) );
  FD1 \mem_reg[4][6]  ( .D(n517), .CP(clk), .Q(\mem[4][6] ) );
  FD1 \mem_reg[4][5]  ( .D(n501), .CP(clk), .Q(\mem[4][5] ) );
  FD1 \mem_reg[4][4]  ( .D(n485), .CP(clk), .Q(\mem[4][4] ) );
  FD1 \mem_reg[4][3]  ( .D(n469), .CP(clk), .Q(\mem[4][3] ) );
  FD1 \mem_reg[4][2]  ( .D(n453), .CP(clk), .Q(\mem[4][2] ) );
  FD1 \mem_reg[4][1]  ( .D(n437), .CP(clk), .Q(\mem[4][1] ) );
  FD1 \mem_reg[4][0]  ( .D(n421), .CP(clk), .Q(\mem[4][0] ) );
  FD1 \mem_reg[5][7]  ( .D(n534), .CP(clk), .Q(\mem[5][7] ) );
  FD1 \mem_reg[5][6]  ( .D(n518), .CP(clk), .Q(\mem[5][6] ) );
  FD1 \mem_reg[5][5]  ( .D(n502), .CP(clk), .Q(\mem[5][5] ) );
  FD1 \mem_reg[5][4]  ( .D(n486), .CP(clk), .Q(\mem[5][4] ) );
  FD1 \mem_reg[5][3]  ( .D(n470), .CP(clk), .Q(\mem[5][3] ) );
  FD1 \mem_reg[5][2]  ( .D(n454), .CP(clk), .Q(\mem[5][2] ) );
  FD1 \mem_reg[5][1]  ( .D(n438), .CP(clk), .Q(\mem[5][1] ) );
  FD1 \mem_reg[5][0]  ( .D(n422), .CP(clk), .Q(\mem[5][0] ) );
  FD1 \mem_reg[6][7]  ( .D(n535), .CP(clk), .Q(\mem[6][7] ) );
  FD1 \mem_reg[6][6]  ( .D(n519), .CP(clk), .Q(\mem[6][6] ) );
  FD1 \mem_reg[6][5]  ( .D(n503), .CP(clk), .Q(\mem[6][5] ) );
  FD1 \mem_reg[6][4]  ( .D(n487), .CP(clk), .Q(\mem[6][4] ) );
  FD1 \mem_reg[6][3]  ( .D(n471), .CP(clk), .Q(\mem[6][3] ) );
  FD1 \mem_reg[6][2]  ( .D(n455), .CP(clk), .Q(\mem[6][2] ) );
  FD1 \mem_reg[6][1]  ( .D(n439), .CP(clk), .Q(\mem[6][1] ) );
  FD1 \mem_reg[6][0]  ( .D(n423), .CP(clk), .Q(\mem[6][0] ) );
  FD1 \mem_reg[7][7]  ( .D(n536), .CP(clk), .Q(\mem[7][7] ) );
  FD1 \mem_reg[7][6]  ( .D(n520), .CP(clk), .Q(\mem[7][6] ) );
  FD1 \mem_reg[7][5]  ( .D(n504), .CP(clk), .Q(\mem[7][5] ) );
  FD1 \mem_reg[7][4]  ( .D(n488), .CP(clk), .Q(\mem[7][4] ) );
  FD1 \mem_reg[7][3]  ( .D(n472), .CP(clk), .Q(\mem[7][3] ) );
  FD1 \mem_reg[7][2]  ( .D(n456), .CP(clk), .Q(\mem[7][2] ) );
  FD1 \mem_reg[7][1]  ( .D(n440), .CP(clk), .Q(\mem[7][1] ) );
  FD1 \mem_reg[7][0]  ( .D(n424), .CP(clk), .Q(\mem[7][0] ) );
  FD1 \mem_reg[8][7]  ( .D(n537), .CP(clk), .Q(\mem[8][7] ) );
  FD1 \mem_reg[8][6]  ( .D(n521), .CP(clk), .Q(\mem[8][6] ) );
  FD1 \mem_reg[8][5]  ( .D(n505), .CP(clk), .Q(\mem[8][5] ) );
  FD1 \mem_reg[8][4]  ( .D(n489), .CP(clk), .Q(\mem[8][4] ) );
  FD1 \mem_reg[8][3]  ( .D(n473), .CP(clk), .Q(\mem[8][3] ) );
  FD1 \mem_reg[8][2]  ( .D(n457), .CP(clk), .Q(\mem[8][2] ) );
  FD1 \mem_reg[8][1]  ( .D(n441), .CP(clk), .Q(\mem[8][1] ) );
  FD1 \mem_reg[8][0]  ( .D(n425), .CP(clk), .Q(\mem[8][0] ) );
  FD1 \mem_reg[9][7]  ( .D(n538), .CP(clk), .Q(\mem[9][7] ) );
  FD1 \mem_reg[9][6]  ( .D(n522), .CP(clk), .Q(\mem[9][6] ) );
  FD1 \mem_reg[9][5]  ( .D(n506), .CP(clk), .Q(\mem[9][5] ) );
  FD1 \mem_reg[9][4]  ( .D(n490), .CP(clk), .Q(\mem[9][4] ) );
  FD1 \mem_reg[9][3]  ( .D(n474), .CP(clk), .Q(\mem[9][3] ) );
  FD1 \mem_reg[9][2]  ( .D(n458), .CP(clk), .Q(\mem[9][2] ) );
  FD1 \mem_reg[9][1]  ( .D(n442), .CP(clk), .Q(\mem[9][1] ) );
  FD1 \mem_reg[9][0]  ( .D(n426), .CP(clk), .Q(\mem[9][0] ) );
  FD1 \mem_reg[10][7]  ( .D(n539), .CP(clk), .QN(n242) );
  FD1 \mem_reg[10][6]  ( .D(n523), .CP(clk), .QN(n244) );
  FD1 \mem_reg[10][5]  ( .D(n507), .CP(clk), .QN(n246) );
  FD1 \mem_reg[10][4]  ( .D(n491), .CP(clk), .QN(n248) );
  FD1 \mem_reg[10][3]  ( .D(n475), .CP(clk), .QN(n250) );
  FD1 \mem_reg[10][2]  ( .D(n459), .CP(clk), .QN(n252) );
  FD1 \mem_reg[10][1]  ( .D(n443), .CP(clk), .QN(n254) );
  FD1 \mem_reg[10][0]  ( .D(n427), .CP(clk), .QN(n240) );
  FD1 \mem_reg[11][7]  ( .D(n540), .CP(clk), .QN(n241) );
  FD1 \mem_reg[11][6]  ( .D(n524), .CP(clk), .QN(n243) );
  FD1 \mem_reg[11][5]  ( .D(n508), .CP(clk), .QN(n221) );
  FD1 \mem_reg[11][4]  ( .D(n492), .CP(clk), .QN(n223) );
  FD1 \mem_reg[11][3]  ( .D(n476), .CP(clk), .QN(n225) );
  FD1 \mem_reg[11][2]  ( .D(n460), .CP(clk), .QN(n227) );
  FD1 \mem_reg[11][1]  ( .D(n444), .CP(clk), .QN(n229) );
  FD1 \mem_reg[11][0]  ( .D(n428), .CP(clk), .QN(n215) );
  FD1 \mem_reg[12][7]  ( .D(n541), .CP(clk), .Q(\mem[12][7] ) );
  FD1 \mem_reg[12][6]  ( .D(n525), .CP(clk), .Q(\mem[12][6] ) );
  FD1 \mem_reg[12][5]  ( .D(n509), .CP(clk), .Q(\mem[12][5] ) );
  FD1 \mem_reg[12][4]  ( .D(n493), .CP(clk), .Q(\mem[12][4] ) );
  FD1 \mem_reg[12][3]  ( .D(n477), .CP(clk), .Q(\mem[12][3] ) );
  FD1 \mem_reg[12][2]  ( .D(n461), .CP(clk), .Q(\mem[12][2] ) );
  FD1 \mem_reg[12][1]  ( .D(n445), .CP(clk), .Q(\mem[12][1] ) );
  FD1 \mem_reg[12][0]  ( .D(n429), .CP(clk), .Q(\mem[12][0] ) );
  FD1 \mem_reg[13][7]  ( .D(n542), .CP(clk), .Q(\mem[13][7] ) );
  FD1 \mem_reg[13][6]  ( .D(n526), .CP(clk), .Q(\mem[13][6] ) );
  FD1 \mem_reg[13][5]  ( .D(n510), .CP(clk), .Q(\mem[13][5] ) );
  FD1 \mem_reg[13][4]  ( .D(n494), .CP(clk), .Q(\mem[13][4] ) );
  FD1 \mem_reg[13][3]  ( .D(n478), .CP(clk), .Q(\mem[13][3] ) );
  FD1 \mem_reg[13][2]  ( .D(n462), .CP(clk), .Q(\mem[13][2] ) );
  FD1 \mem_reg[13][1]  ( .D(n446), .CP(clk), .Q(\mem[13][1] ) );
  FD1 \mem_reg[13][0]  ( .D(n430), .CP(clk), .Q(\mem[13][0] ) );
  FD1 \mem_reg[14][7]  ( .D(n543), .CP(clk), .QN(n218) );
  FD1 \mem_reg[14][6]  ( .D(n527), .CP(clk), .QN(n220) );
  FD1 \mem_reg[14][5]  ( .D(n511), .CP(clk), .QN(n222) );
  FD1 \mem_reg[14][4]  ( .D(n495), .CP(clk), .QN(n224) );
  FD1 \mem_reg[14][3]  ( .D(n479), .CP(clk), .QN(n226) );
  FD1 \mem_reg[14][2]  ( .D(n463), .CP(clk), .QN(n228) );
  FD1 \mem_reg[14][1]  ( .D(n447), .CP(clk), .QN(n230) );
  FD1 \mem_reg[14][0]  ( .D(n431), .CP(clk), .QN(n216) );
  FD1 \mem_reg[15][7]  ( .D(n528), .CP(clk), .QN(n217) );
  FD1 \mem_reg[15][6]  ( .D(n512), .CP(clk), .QN(n219) );
  FD1 \mem_reg[15][5]  ( .D(n496), .CP(clk), .QN(n245) );
  FD1 \mem_reg[15][4]  ( .D(n480), .CP(clk), .QN(n247) );
  FD1 \mem_reg[15][3]  ( .D(n464), .CP(clk), .QN(n249) );
  FD1 \mem_reg[15][2]  ( .D(n448), .CP(clk), .QN(n251) );
  FD1 \mem_reg[15][1]  ( .D(n432), .CP(clk), .QN(n253) );
  FD1 \mem_reg[15][0]  ( .D(n416), .CP(clk), .QN(n239) );
  FD1 \count_reg[4]  ( .D(N183), .CP(clk), .Q(count[4]) );
  FD1 \count_reg[3]  ( .D(N182), .CP(clk), .Q(count[3]), .QN(n233) );
  FD1 \count_reg[2]  ( .D(N181), .CP(clk), .Q(count[2]), .QN(n236) );
  FD1 \count_reg[1]  ( .D(N180), .CP(clk), .Q(count[1]) );
  FD1 \count_reg[0]  ( .D(N179), .CP(clk), .Q(count[0]) );
  FD1 \data_out_reg[0]  ( .D(n548), .CP(clk), .Q(N92), .QN(n255) );
  FD1 \data_out_tri_enable_reg[0]  ( .D(n549), .CP(clk), .QN(n231) );
  FD1 \data_out_reg[7]  ( .D(n550), .CP(clk), .Q(N71), .QN(n256) );
  FD1 \data_out_reg[6]  ( .D(n551), .CP(clk), .Q(N74), .QN(n404) );
  FD1 \data_out_reg[5]  ( .D(n552), .CP(clk), .Q(N77), .QN(n405) );
  FD1 \data_out_reg[4]  ( .D(n553), .CP(clk), .Q(N80), .QN(n406) );
  FD1 \data_out_reg[3]  ( .D(n554), .CP(clk), .Q(N83), .QN(n407) );
  FD1 \data_out_reg[2]  ( .D(n555), .CP(clk), .Q(N86), .QN(n408) );
  FD1 \data_out_reg[1]  ( .D(n556), .CP(clk), .Q(N89), .QN(n409) );
  BTS4 \data_out_tri[0]  ( .A(N92), .E(n231), .Z(data_out[0]) );
  BTS4 \data_out_tri[1]  ( .A(N89), .E(n231), .Z(data_out[1]) );
  BTS4 \data_out_tri[2]  ( .A(N86), .E(n231), .Z(data_out[2]) );
  BTS4 \data_out_tri[3]  ( .A(N83), .E(n231), .Z(data_out[3]) );
  BTS4 \data_out_tri[4]  ( .A(N80), .E(n231), .Z(data_out[4]) );
  BTS4 \data_out_tri[5]  ( .A(N77), .E(n231), .Z(data_out[5]) );
  BTS4 \data_out_tri[6]  ( .A(N74), .E(n231), .Z(data_out[6]) );
  BTS4 \data_out_tri[7]  ( .A(N71), .E(n231), .Z(data_out[7]) );
  AO4 U3 ( .A(n214), .B(n237), .C(rd_ptr[4]), .D(wr_ptr[4]), .Z(n5) );
  AO2 U4 ( .A(wr_ptr[3]), .B(n213), .C(rd_ptr[3]), .D(n238), .Z(n4) );
  AO2 U5 ( .A(wr_ptr[2]), .B(n210), .C(rd_ptr[2]), .D(n234), .Z(n3) );
  AO2 U6 ( .A(wr_ptr[0]), .B(n232), .C(rd_ptr[0]), .D(n212), .Z(n2) );
  AO2 U7 ( .A(wr_ptr[1]), .B(n211), .C(rd_ptr[1]), .D(n235), .Z(n1) );
  ND4 U8 ( .A(n4), .B(n3), .C(n2), .D(n1), .Z(n6) );
  NR2 U9 ( .A(n5), .B(n6), .Z(N185) );
  IVP U10 ( .A(n5), .Z(n7) );
  NR2 U11 ( .A(n7), .B(n6), .Z(N186) );
  IVP U12 ( .A(wr_enb), .Z(n8) );
  NR2 U13 ( .A(N185), .B(n8), .Z(n98) );
  IVP U14 ( .A(n98), .Z(n93) );
  NR2 U15 ( .A(n234), .B(n212), .Z(n50) );
  ND2 U16 ( .A(wr_ptr[1]), .B(n50), .Z(n95) );
  NR2 U17 ( .A(n93), .B(n95), .Z(n9) );
  ND2 U18 ( .A(wr_ptr[3]), .B(n9), .Z(n100) );
  IVP U19 ( .A(resetn), .Z(n36) );
  NR2 U20 ( .A(n36), .B(soft_reset), .Z(n51) );
  AO3 U21 ( .A(wr_ptr[3]), .B(n9), .C(n100), .D(n51), .Z(n10) );
  IVP U22 ( .A(n10), .Z(n546) );
  IVP U23 ( .A(rd_enb), .Z(n11) );
  NR2 U24 ( .A(n11), .B(N186), .Z(n117) );
  ND2 U25 ( .A(n93), .B(n117), .Z(n16) );
  NR2 U26 ( .A(n93), .B(n117), .Z(n24) );
  IVP U27 ( .A(n24), .Z(n27) );
  ND2 U28 ( .A(n16), .B(n27), .Z(n21) );
  IVP U29 ( .A(n51), .Z(n115) );
  NR2 U30 ( .A(count[0]), .B(n21), .Z(n12) );
  AO1P U31 ( .A(count[0]), .B(n21), .C(n115), .D(n12), .Z(N179) );
  IVP U32 ( .A(n16), .Z(n30) );
  EO1 U33 ( .A(count[0]), .B(n27), .C(n30), .D(count[0]), .Z(n14) );
  NR2 U34 ( .A(count[1]), .B(n14), .Z(n13) );
  AO1P U35 ( .A(count[1]), .B(n14), .C(n115), .D(n13), .Z(N180) );
  ND2 U36 ( .A(n30), .B(count[1]), .Z(n15) );
  AO3 U37 ( .A(count[1]), .B(n27), .C(n15), .D(n14), .Z(n18) );
  OR3 U38 ( .A(count[0]), .B(count[2]), .C(count[1]), .Z(n116) );
  NR2 U39 ( .A(n116), .B(n16), .Z(n33) );
  AN4P U40 ( .A(n236), .B(count[0]), .C(count[1]), .D(n24), .Z(n17) );
  AO1P U41 ( .A(count[2]), .B(n18), .C(n33), .D(n17), .Z(n19) );
  NR2 U42 ( .A(n19), .B(n115), .Z(N181) );
  ND2 U43 ( .A(count[0]), .B(count[1]), .Z(n20) );
  NR2 U44 ( .A(n236), .B(n20), .Z(n23) );
  ND2 U45 ( .A(n30), .B(n116), .Z(n22) );
  AO3 U46 ( .A(n23), .B(n27), .C(n22), .D(n21), .Z(n29) );
  ND2 U47 ( .A(n24), .B(n23), .Z(n31) );
  ND2 U48 ( .A(n233), .B(n31), .Z(n25) );
  AO4 U49 ( .A(n233), .B(n29), .C(n33), .D(n25), .Z(n26) );
  NR2 U50 ( .A(n26), .B(n115), .Z(N182) );
  NR2 U51 ( .A(n27), .B(count[3]), .Z(n28) );
  AO1P U52 ( .A(count[3]), .B(n30), .C(n29), .D(n28), .Z(n35) );
  NR2 U53 ( .A(n31), .B(n233), .Z(n32) );
  AO1P U54 ( .A(n33), .B(n233), .C(count[4]), .D(n32), .Z(n34) );
  AO1P U55 ( .A(count[4]), .B(n35), .C(n34), .D(n115), .Z(N183) );
  ND2 U56 ( .A(n51), .B(n117), .Z(n209) );
  IVP U57 ( .A(n209), .Z(n44) );
  ND2 U58 ( .A(n44), .B(n211), .Z(n38) );
  NR2 U59 ( .A(n44), .B(n36), .Z(n39) );
  NR2 U60 ( .A(rd_ptr[0]), .B(n209), .Z(n37) );
  NR2 U61 ( .A(n39), .B(n37), .Z(n42) );
  AO4 U62 ( .A(n232), .B(n38), .C(n42), .D(n211), .Z(n410) );
  EO1 U63 ( .A(n209), .B(n232), .C(n232), .D(n39), .Z(n411) );
  NR2 U64 ( .A(n232), .B(n211), .Z(n40) );
  AO2 U65 ( .A(rd_ptr[2]), .B(n211), .C(n40), .D(n210), .Z(n41) );
  AO4 U66 ( .A(n42), .B(n210), .C(n41), .D(n209), .Z(n412) );
  NR2 U67 ( .A(n210), .B(n211), .Z(n101) );
  ND2 U68 ( .A(rd_ptr[0]), .B(n101), .Z(n43) );
  AO2 U69 ( .A(n44), .B(n43), .C(resetn), .D(n209), .Z(n47) );
  ND2 U70 ( .A(n213), .B(n44), .Z(n45) );
  AO4 U71 ( .A(n47), .B(n213), .C(n45), .D(n43), .Z(n413) );
  ND4 U72 ( .A(rd_ptr[3]), .B(rd_ptr[0]), .C(n44), .D(n101), .Z(n48) );
  AN2P U73 ( .A(rd_ptr[4]), .B(n45), .Z(n46) );
  AO2 U74 ( .A(n48), .B(n237), .C(n47), .D(n46), .Z(n414) );
  NR2 U75 ( .A(n212), .B(n93), .Z(n92) );
  NR2 U76 ( .A(wr_ptr[1]), .B(n92), .Z(n49) );
  AO1P U77 ( .A(wr_ptr[1]), .B(n92), .C(n115), .D(n49), .Z(n415) );
  ND2 U78 ( .A(n51), .B(n98), .Z(n52) );
  NR2 U79 ( .A(n238), .B(n52), .Z(n56) );
  AO6 U80 ( .A(wr_ptr[1]), .B(n56), .C(n115), .Z(n62) );
  NR2 U81 ( .A(n50), .B(n115), .Z(n60) );
  NR2 U82 ( .A(n62), .B(n60), .Z(n72) );
  IVP U83 ( .A(n52), .Z(n70) );
  ND2 U84 ( .A(n70), .B(data_in[0]), .Z(n63) );
  IVP U85 ( .A(n72), .Z(n71) );
  AO2 U86 ( .A(n72), .B(n63), .C(n239), .D(n71), .Z(n416) );
  ND2 U87 ( .A(n234), .B(n212), .Z(n94) );
  AN2P U88 ( .A(n94), .B(n51), .Z(n57) );
  NR2 U89 ( .A(wr_ptr[3]), .B(n52), .Z(n53) );
  AO6 U90 ( .A(n53), .B(n235), .C(n115), .Z(n54) );
  NR2 U91 ( .A(n57), .B(n54), .Z(n73) );
  EO1 U92 ( .A(n73), .B(n63), .C(\mem[0][0] ), .D(n73), .Z(n417) );
  AO6 U93 ( .A(wr_ptr[0]), .B(n234), .C(n115), .Z(n58) );
  NR2 U94 ( .A(n54), .B(n58), .Z(n74) );
  EO1 U95 ( .A(n74), .B(n63), .C(\mem[1][0] ), .D(n74), .Z(n418) );
  AO6 U96 ( .A(wr_ptr[1]), .B(n53), .C(n115), .Z(n55) );
  NR2 U97 ( .A(n57), .B(n55), .Z(n75) );
  EO1 U98 ( .A(n75), .B(n63), .C(\mem[2][0] ), .D(n75), .Z(n419) );
  NR2 U99 ( .A(n58), .B(n55), .Z(n76) );
  EO1 U100 ( .A(n76), .B(n63), .C(\mem[3][0] ), .D(n76), .Z(n420) );
  AO6 U101 ( .A(wr_ptr[2]), .B(n212), .C(n115), .Z(n61) );
  NR2 U102 ( .A(n54), .B(n61), .Z(n77) );
  EO1 U103 ( .A(n77), .B(n63), .C(\mem[4][0] ), .D(n77), .Z(n421) );
  NR2 U104 ( .A(n60), .B(n54), .Z(n78) );
  EO1 U105 ( .A(n78), .B(n63), .C(\mem[5][0] ), .D(n78), .Z(n422) );
  NR2 U106 ( .A(n55), .B(n61), .Z(n79) );
  EO1 U107 ( .A(n79), .B(n63), .C(\mem[6][0] ), .D(n79), .Z(n423) );
  NR2 U108 ( .A(n60), .B(n55), .Z(n80) );
  EO1 U109 ( .A(n80), .B(n63), .C(\mem[7][0] ), .D(n80), .Z(n424) );
  AO6 U110 ( .A(n56), .B(n235), .C(n115), .Z(n59) );
  NR2 U111 ( .A(n57), .B(n59), .Z(n81) );
  EO1 U112 ( .A(n81), .B(n63), .C(\mem[8][0] ), .D(n81), .Z(n425) );
  NR2 U113 ( .A(n58), .B(n59), .Z(n82) );
  EO1 U114 ( .A(n82), .B(n63), .C(\mem[9][0] ), .D(n82), .Z(n426) );
  NR2 U115 ( .A(n62), .B(n57), .Z(n84) );
  IVP U116 ( .A(n84), .Z(n83) );
  AO2 U117 ( .A(n84), .B(n63), .C(n240), .D(n83), .Z(n427) );
  NR2 U118 ( .A(n62), .B(n58), .Z(n86) );
  IVP U119 ( .A(n86), .Z(n85) );
  AO2 U120 ( .A(n86), .B(n63), .C(n215), .D(n85), .Z(n428) );
  NR2 U121 ( .A(n61), .B(n59), .Z(n87) );
  EO1 U122 ( .A(n87), .B(n63), .C(\mem[12][0] ), .D(n87), .Z(n429) );
  NR2 U123 ( .A(n60), .B(n59), .Z(n88) );
  EO1 U124 ( .A(n88), .B(n63), .C(\mem[13][0] ), .D(n88), .Z(n430) );
  NR2 U125 ( .A(n62), .B(n61), .Z(n91) );
  IVP U126 ( .A(n91), .Z(n89) );
  AO2 U127 ( .A(n91), .B(n63), .C(n216), .D(n89), .Z(n431) );
  ND2 U128 ( .A(n70), .B(data_in[1]), .Z(n64) );
  AO2 U129 ( .A(n72), .B(n64), .C(n253), .D(n71), .Z(n432) );
  EO1 U130 ( .A(n73), .B(n64), .C(\mem[0][1] ), .D(n73), .Z(n433) );
  EO1 U131 ( .A(n74), .B(n64), .C(\mem[1][1] ), .D(n74), .Z(n434) );
  EO1 U132 ( .A(n75), .B(n64), .C(\mem[2][1] ), .D(n75), .Z(n435) );
  EO1 U133 ( .A(n76), .B(n64), .C(\mem[3][1] ), .D(n76), .Z(n436) );
  EO1 U134 ( .A(n77), .B(n64), .C(\mem[4][1] ), .D(n77), .Z(n437) );
  EO1 U135 ( .A(n78), .B(n64), .C(\mem[5][1] ), .D(n78), .Z(n438) );
  EO1 U136 ( .A(n79), .B(n64), .C(\mem[6][1] ), .D(n79), .Z(n439) );
  EO1 U137 ( .A(n80), .B(n64), .C(\mem[7][1] ), .D(n80), .Z(n440) );
  EO1 U138 ( .A(n81), .B(n64), .C(\mem[8][1] ), .D(n81), .Z(n441) );
  EO1 U139 ( .A(n82), .B(n64), .C(\mem[9][1] ), .D(n82), .Z(n442) );
  AO2 U140 ( .A(n84), .B(n64), .C(n254), .D(n83), .Z(n443) );
  AO2 U141 ( .A(n86), .B(n64), .C(n229), .D(n85), .Z(n444) );
  EO1 U142 ( .A(n87), .B(n64), .C(\mem[12][1] ), .D(n87), .Z(n445) );
  EO1 U143 ( .A(n88), .B(n64), .C(\mem[13][1] ), .D(n88), .Z(n446) );
  AO2 U144 ( .A(n91), .B(n64), .C(n230), .D(n89), .Z(n447) );
  ND2 U145 ( .A(n70), .B(data_in[2]), .Z(n65) );
  AO2 U146 ( .A(n72), .B(n65), .C(n251), .D(n71), .Z(n448) );
  EO1 U147 ( .A(n73), .B(n65), .C(\mem[0][2] ), .D(n73), .Z(n449) );
  EO1 U148 ( .A(n74), .B(n65), .C(\mem[1][2] ), .D(n74), .Z(n450) );
  EO1 U149 ( .A(n75), .B(n65), .C(\mem[2][2] ), .D(n75), .Z(n451) );
  EO1 U150 ( .A(n76), .B(n65), .C(\mem[3][2] ), .D(n76), .Z(n452) );
  EO1 U151 ( .A(n77), .B(n65), .C(\mem[4][2] ), .D(n77), .Z(n453) );
  EO1 U152 ( .A(n78), .B(n65), .C(\mem[5][2] ), .D(n78), .Z(n454) );
  EO1 U153 ( .A(n79), .B(n65), .C(\mem[6][2] ), .D(n79), .Z(n455) );
  EO1 U154 ( .A(n80), .B(n65), .C(\mem[7][2] ), .D(n80), .Z(n456) );
  EO1 U155 ( .A(n81), .B(n65), .C(\mem[8][2] ), .D(n81), .Z(n457) );
  EO1 U156 ( .A(n82), .B(n65), .C(\mem[9][2] ), .D(n82), .Z(n458) );
  AO2 U157 ( .A(n84), .B(n65), .C(n252), .D(n83), .Z(n459) );
  AO2 U158 ( .A(n86), .B(n65), .C(n227), .D(n85), .Z(n460) );
  EO1 U159 ( .A(n87), .B(n65), .C(\mem[12][2] ), .D(n87), .Z(n461) );
  EO1 U160 ( .A(n88), .B(n65), .C(\mem[13][2] ), .D(n88), .Z(n462) );
  AO2 U161 ( .A(n91), .B(n65), .C(n228), .D(n89), .Z(n463) );
  ND2 U162 ( .A(n70), .B(data_in[3]), .Z(n66) );
  AO2 U163 ( .A(n72), .B(n66), .C(n249), .D(n71), .Z(n464) );
  EO1 U164 ( .A(n73), .B(n66), .C(\mem[0][3] ), .D(n73), .Z(n465) );
  EO1 U165 ( .A(n74), .B(n66), .C(\mem[1][3] ), .D(n74), .Z(n466) );
  EO1 U166 ( .A(n75), .B(n66), .C(\mem[2][3] ), .D(n75), .Z(n467) );
  EO1 U167 ( .A(n76), .B(n66), .C(\mem[3][3] ), .D(n76), .Z(n468) );
  EO1 U168 ( .A(n77), .B(n66), .C(\mem[4][3] ), .D(n77), .Z(n469) );
  EO1 U169 ( .A(n78), .B(n66), .C(\mem[5][3] ), .D(n78), .Z(n470) );
  EO1 U170 ( .A(n79), .B(n66), .C(\mem[6][3] ), .D(n79), .Z(n471) );
  EO1 U171 ( .A(n80), .B(n66), .C(\mem[7][3] ), .D(n80), .Z(n472) );
  EO1 U172 ( .A(n81), .B(n66), .C(\mem[8][3] ), .D(n81), .Z(n473) );
  EO1 U173 ( .A(n82), .B(n66), .C(\mem[9][3] ), .D(n82), .Z(n474) );
  AO2 U174 ( .A(n84), .B(n66), .C(n250), .D(n83), .Z(n475) );
  AO2 U175 ( .A(n86), .B(n66), .C(n225), .D(n85), .Z(n476) );
  EO1 U176 ( .A(n87), .B(n66), .C(\mem[12][3] ), .D(n87), .Z(n477) );
  EO1 U177 ( .A(n88), .B(n66), .C(\mem[13][3] ), .D(n88), .Z(n478) );
  AO2 U178 ( .A(n91), .B(n66), .C(n226), .D(n89), .Z(n479) );
  ND2 U179 ( .A(n70), .B(data_in[4]), .Z(n67) );
  AO2 U180 ( .A(n72), .B(n67), .C(n247), .D(n71), .Z(n480) );
  EO1 U181 ( .A(n73), .B(n67), .C(\mem[0][4] ), .D(n73), .Z(n481) );
  EO1 U182 ( .A(n74), .B(n67), .C(\mem[1][4] ), .D(n74), .Z(n482) );
  EO1 U183 ( .A(n75), .B(n67), .C(\mem[2][4] ), .D(n75), .Z(n483) );
  EO1 U184 ( .A(n76), .B(n67), .C(\mem[3][4] ), .D(n76), .Z(n484) );
  EO1 U185 ( .A(n77), .B(n67), .C(\mem[4][4] ), .D(n77), .Z(n485) );
  EO1 U186 ( .A(n78), .B(n67), .C(\mem[5][4] ), .D(n78), .Z(n486) );
  EO1 U187 ( .A(n79), .B(n67), .C(\mem[6][4] ), .D(n79), .Z(n487) );
  EO1 U188 ( .A(n80), .B(n67), .C(\mem[7][4] ), .D(n80), .Z(n488) );
  EO1 U189 ( .A(n81), .B(n67), .C(\mem[8][4] ), .D(n81), .Z(n489) );
  EO1 U190 ( .A(n82), .B(n67), .C(\mem[9][4] ), .D(n82), .Z(n490) );
  AO2 U191 ( .A(n84), .B(n67), .C(n248), .D(n83), .Z(n491) );
  AO2 U192 ( .A(n86), .B(n67), .C(n223), .D(n85), .Z(n492) );
  EO1 U193 ( .A(n87), .B(n67), .C(\mem[12][4] ), .D(n87), .Z(n493) );
  EO1 U194 ( .A(n88), .B(n67), .C(\mem[13][4] ), .D(n88), .Z(n494) );
  AO2 U195 ( .A(n91), .B(n67), .C(n224), .D(n89), .Z(n495) );
  ND2 U196 ( .A(n70), .B(data_in[5]), .Z(n68) );
  AO2 U197 ( .A(n72), .B(n68), .C(n245), .D(n71), .Z(n496) );
  EO1 U198 ( .A(n73), .B(n68), .C(\mem[0][5] ), .D(n73), .Z(n497) );
  EO1 U199 ( .A(n74), .B(n68), .C(\mem[1][5] ), .D(n74), .Z(n498) );
  EO1 U200 ( .A(n75), .B(n68), .C(\mem[2][5] ), .D(n75), .Z(n499) );
  EO1 U201 ( .A(n76), .B(n68), .C(\mem[3][5] ), .D(n76), .Z(n500) );
  EO1 U202 ( .A(n77), .B(n68), .C(\mem[4][5] ), .D(n77), .Z(n501) );
  EO1 U203 ( .A(n78), .B(n68), .C(\mem[5][5] ), .D(n78), .Z(n502) );
  EO1 U204 ( .A(n79), .B(n68), .C(\mem[6][5] ), .D(n79), .Z(n503) );
  EO1 U205 ( .A(n80), .B(n68), .C(\mem[7][5] ), .D(n80), .Z(n504) );
  EO1 U206 ( .A(n81), .B(n68), .C(\mem[8][5] ), .D(n81), .Z(n505) );
  EO1 U207 ( .A(n82), .B(n68), .C(\mem[9][5] ), .D(n82), .Z(n506) );
  AO2 U208 ( .A(n84), .B(n68), .C(n246), .D(n83), .Z(n507) );
  AO2 U209 ( .A(n86), .B(n68), .C(n221), .D(n85), .Z(n508) );
  EO1 U210 ( .A(n87), .B(n68), .C(\mem[12][5] ), .D(n87), .Z(n509) );
  EO1 U211 ( .A(n88), .B(n68), .C(\mem[13][5] ), .D(n88), .Z(n510) );
  AO2 U212 ( .A(n91), .B(n68), .C(n222), .D(n89), .Z(n511) );
  ND2 U213 ( .A(n70), .B(data_in[6]), .Z(n69) );
  AO2 U214 ( .A(n72), .B(n69), .C(n219), .D(n71), .Z(n512) );
  EO1 U215 ( .A(n73), .B(n69), .C(\mem[0][6] ), .D(n73), .Z(n513) );
  EO1 U216 ( .A(n74), .B(n69), .C(\mem[1][6] ), .D(n74), .Z(n514) );
  EO1 U217 ( .A(n75), .B(n69), .C(\mem[2][6] ), .D(n75), .Z(n515) );
  EO1 U218 ( .A(n76), .B(n69), .C(\mem[3][6] ), .D(n76), .Z(n516) );
  EO1 U219 ( .A(n77), .B(n69), .C(\mem[4][6] ), .D(n77), .Z(n517) );
  EO1 U220 ( .A(n78), .B(n69), .C(\mem[5][6] ), .D(n78), .Z(n518) );
  EO1 U221 ( .A(n79), .B(n69), .C(\mem[6][6] ), .D(n79), .Z(n519) );
  EO1 U222 ( .A(n80), .B(n69), .C(\mem[7][6] ), .D(n80), .Z(n520) );
  EO1 U223 ( .A(n81), .B(n69), .C(\mem[8][6] ), .D(n81), .Z(n521) );
  EO1 U224 ( .A(n82), .B(n69), .C(\mem[9][6] ), .D(n82), .Z(n522) );
  AO2 U225 ( .A(n84), .B(n69), .C(n244), .D(n83), .Z(n523) );
  AO2 U226 ( .A(n86), .B(n69), .C(n243), .D(n85), .Z(n524) );
  EO1 U227 ( .A(n87), .B(n69), .C(\mem[12][6] ), .D(n87), .Z(n525) );
  EO1 U228 ( .A(n88), .B(n69), .C(\mem[13][6] ), .D(n88), .Z(n526) );
  AO2 U229 ( .A(n91), .B(n69), .C(n220), .D(n89), .Z(n527) );
  ND2 U230 ( .A(n70), .B(data_in[7]), .Z(n90) );
  AO2 U231 ( .A(n72), .B(n90), .C(n217), .D(n71), .Z(n528) );
  EO1 U232 ( .A(n73), .B(n90), .C(\mem[0][7] ), .D(n73), .Z(n529) );
  EO1 U233 ( .A(n74), .B(n90), .C(\mem[1][7] ), .D(n74), .Z(n530) );
  EO1 U234 ( .A(n75), .B(n90), .C(\mem[2][7] ), .D(n75), .Z(n531) );
  EO1 U235 ( .A(n76), .B(n90), .C(\mem[3][7] ), .D(n76), .Z(n532) );
  EO1 U236 ( .A(n77), .B(n90), .C(\mem[4][7] ), .D(n77), .Z(n533) );
  EO1 U237 ( .A(n78), .B(n90), .C(\mem[5][7] ), .D(n78), .Z(n534) );
  EO1 U238 ( .A(n79), .B(n90), .C(\mem[6][7] ), .D(n79), .Z(n535) );
  EO1 U239 ( .A(n80), .B(n90), .C(\mem[7][7] ), .D(n80), .Z(n536) );
  EO1 U240 ( .A(n81), .B(n90), .C(\mem[8][7] ), .D(n81), .Z(n537) );
  EO1 U241 ( .A(n82), .B(n90), .C(\mem[9][7] ), .D(n82), .Z(n538) );
  AO2 U242 ( .A(n84), .B(n90), .C(n242), .D(n83), .Z(n539) );
  AO2 U243 ( .A(n86), .B(n90), .C(n241), .D(n85), .Z(n540) );
  EO1 U244 ( .A(n87), .B(n90), .C(\mem[12][7] ), .D(n87), .Z(n541) );
  EO1 U245 ( .A(n88), .B(n90), .C(\mem[13][7] ), .D(n88), .Z(n542) );
  AO2 U246 ( .A(n91), .B(n90), .C(n218), .D(n89), .Z(n543) );
  AO1P U247 ( .A(n212), .B(n93), .C(n92), .D(n115), .Z(n544) );
  AO3 U248 ( .A(wr_ptr[2]), .B(wr_ptr[1]), .C(n95), .D(n94), .Z(n97) );
  NR2 U249 ( .A(wr_ptr[2]), .B(n98), .Z(n96) );
  AO1P U250 ( .A(n98), .B(n97), .C(n115), .D(n96), .Z(n545) );
  NR2 U251 ( .A(n214), .B(n100), .Z(n99) );
  AO1P U252 ( .A(n214), .B(n100), .C(n115), .D(n99), .Z(n547) );
  ND2 U253 ( .A(rd_ptr[3]), .B(n101), .Z(n192) );
  ND2 U254 ( .A(n210), .B(rd_ptr[3]), .Z(n102) );
  OR2P U255 ( .A(n211), .B(n102), .Z(n193) );
  AO4 U256 ( .A(n239), .B(n192), .C(n215), .D(n193), .Z(n114) );
  ND2 U257 ( .A(n213), .B(n210), .Z(n103) );
  NR2 U258 ( .A(n211), .B(n103), .Z(n195) );
  ND2 U259 ( .A(rd_ptr[2]), .B(n211), .Z(n104) );
  NR2 U260 ( .A(rd_ptr[3]), .B(n104), .Z(n194) );
  AO2 U261 ( .A(\mem[3][0] ), .B(n195), .C(\mem[5][0] ), .D(n194), .Z(n107) );
  AN2P U262 ( .A(n213), .B(n101), .Z(n197) );
  NR2 U263 ( .A(rd_ptr[1]), .B(n102), .Z(n196) );
  AO2 U264 ( .A(\mem[7][0] ), .B(n197), .C(\mem[9][0] ), .D(n196), .Z(n106) );
  NR2 U265 ( .A(rd_ptr[1]), .B(n103), .Z(n199) );
  NR2 U266 ( .A(n213), .B(n104), .Z(n198) );
  AO2 U267 ( .A(\mem[1][0] ), .B(n199), .C(\mem[13][0] ), .D(n198), .Z(n105)
         );
  ND4 U268 ( .A(rd_ptr[0]), .B(n107), .C(n106), .D(n105), .Z(n113) );
  AO4 U269 ( .A(n240), .B(n193), .C(n216), .D(n192), .Z(n112) );
  AO2 U270 ( .A(\mem[2][0] ), .B(n195), .C(\mem[4][0] ), .D(n194), .Z(n110) );
  AO2 U271 ( .A(\mem[6][0] ), .B(n197), .C(\mem[8][0] ), .D(n196), .Z(n109) );
  AO2 U272 ( .A(\mem[0][0] ), .B(n199), .C(\mem[12][0] ), .D(n198), .Z(n108)
         );
  ND4 U273 ( .A(n110), .B(n109), .C(n108), .D(n232), .Z(n111) );
  AO4 U274 ( .A(n114), .B(n113), .C(n112), .D(n111), .Z(n120) );
  NR2 U275 ( .A(n117), .B(n115), .Z(n119) );
  NR4 U276 ( .A(n117), .B(count[4]), .C(n116), .D(n115), .Z(n118) );
  ND2 U277 ( .A(n118), .B(n233), .Z(n122) );
  ND2 U278 ( .A(n119), .B(n122), .Z(n207) );
  AO4 U279 ( .A(n209), .B(n120), .C(n207), .D(n255), .Z(n548) );
  ND2 U280 ( .A(soft_reset), .B(resetn), .Z(n121) );
  AO3 U281 ( .A(n207), .B(n231), .C(n122), .D(n121), .Z(n549) );
  AO4 U282 ( .A(n217), .B(n192), .C(n241), .D(n193), .Z(n132) );
  AO2 U283 ( .A(\mem[3][7] ), .B(n195), .C(\mem[5][7] ), .D(n194), .Z(n125) );
  AO2 U284 ( .A(\mem[7][7] ), .B(n197), .C(\mem[9][7] ), .D(n196), .Z(n124) );
  AO2 U285 ( .A(\mem[1][7] ), .B(n199), .C(\mem[13][7] ), .D(n198), .Z(n123)
         );
  ND4 U286 ( .A(rd_ptr[0]), .B(n125), .C(n124), .D(n123), .Z(n131) );
  AO4 U287 ( .A(n242), .B(n193), .C(n218), .D(n192), .Z(n130) );
  AO2 U288 ( .A(\mem[2][7] ), .B(n195), .C(\mem[4][7] ), .D(n194), .Z(n128) );
  AO2 U289 ( .A(\mem[6][7] ), .B(n197), .C(\mem[8][7] ), .D(n196), .Z(n127) );
  AO2 U290 ( .A(\mem[0][7] ), .B(n199), .C(\mem[12][7] ), .D(n198), .Z(n126)
         );
  ND4 U291 ( .A(n128), .B(n127), .C(n126), .D(n232), .Z(n129) );
  AO4 U292 ( .A(n132), .B(n131), .C(n130), .D(n129), .Z(n133) );
  AO4 U293 ( .A(n209), .B(n133), .C(n207), .D(n256), .Z(n550) );
  AO4 U294 ( .A(n219), .B(n192), .C(n243), .D(n193), .Z(n143) );
  AO2 U295 ( .A(\mem[3][6] ), .B(n195), .C(\mem[5][6] ), .D(n194), .Z(n136) );
  AO2 U296 ( .A(\mem[7][6] ), .B(n197), .C(\mem[9][6] ), .D(n196), .Z(n135) );
  AO2 U297 ( .A(\mem[1][6] ), .B(n199), .C(\mem[13][6] ), .D(n198), .Z(n134)
         );
  ND4 U298 ( .A(rd_ptr[0]), .B(n136), .C(n135), .D(n134), .Z(n142) );
  AO4 U299 ( .A(n244), .B(n193), .C(n220), .D(n192), .Z(n141) );
  AO2 U300 ( .A(\mem[2][6] ), .B(n195), .C(\mem[4][6] ), .D(n194), .Z(n139) );
  AO2 U301 ( .A(\mem[6][6] ), .B(n197), .C(\mem[8][6] ), .D(n196), .Z(n138) );
  AO2 U302 ( .A(\mem[0][6] ), .B(n199), .C(\mem[12][6] ), .D(n198), .Z(n137)
         );
  ND4 U303 ( .A(n139), .B(n138), .C(n137), .D(n232), .Z(n140) );
  AO4 U304 ( .A(n143), .B(n142), .C(n141), .D(n140), .Z(n144) );
  AO4 U305 ( .A(n209), .B(n144), .C(n207), .D(n404), .Z(n551) );
  AO4 U306 ( .A(n245), .B(n192), .C(n221), .D(n193), .Z(n154) );
  AO2 U307 ( .A(\mem[3][5] ), .B(n195), .C(\mem[5][5] ), .D(n194), .Z(n147) );
  AO2 U308 ( .A(\mem[7][5] ), .B(n197), .C(\mem[9][5] ), .D(n196), .Z(n146) );
  AO2 U309 ( .A(\mem[1][5] ), .B(n199), .C(\mem[13][5] ), .D(n198), .Z(n145)
         );
  ND4 U310 ( .A(rd_ptr[0]), .B(n147), .C(n146), .D(n145), .Z(n153) );
  AO4 U311 ( .A(n246), .B(n193), .C(n222), .D(n192), .Z(n152) );
  AO2 U312 ( .A(\mem[2][5] ), .B(n195), .C(\mem[4][5] ), .D(n194), .Z(n150) );
  AO2 U313 ( .A(\mem[6][5] ), .B(n197), .C(\mem[8][5] ), .D(n196), .Z(n149) );
  AO2 U314 ( .A(\mem[0][5] ), .B(n199), .C(\mem[12][5] ), .D(n198), .Z(n148)
         );
  ND4 U315 ( .A(n150), .B(n149), .C(n148), .D(n232), .Z(n151) );
  AO4 U316 ( .A(n154), .B(n153), .C(n152), .D(n151), .Z(n155) );
  AO4 U317 ( .A(n209), .B(n155), .C(n207), .D(n405), .Z(n552) );
  AO4 U318 ( .A(n247), .B(n192), .C(n223), .D(n193), .Z(n165) );
  AO2 U319 ( .A(\mem[3][4] ), .B(n195), .C(\mem[5][4] ), .D(n194), .Z(n158) );
  AO2 U320 ( .A(\mem[7][4] ), .B(n197), .C(\mem[9][4] ), .D(n196), .Z(n157) );
  AO2 U321 ( .A(\mem[1][4] ), .B(n199), .C(\mem[13][4] ), .D(n198), .Z(n156)
         );
  ND4 U322 ( .A(rd_ptr[0]), .B(n158), .C(n157), .D(n156), .Z(n164) );
  AO4 U323 ( .A(n248), .B(n193), .C(n224), .D(n192), .Z(n163) );
  AO2 U324 ( .A(\mem[2][4] ), .B(n195), .C(\mem[4][4] ), .D(n194), .Z(n161) );
  AO2 U325 ( .A(\mem[6][4] ), .B(n197), .C(\mem[8][4] ), .D(n196), .Z(n160) );
  AO2 U326 ( .A(\mem[0][4] ), .B(n199), .C(\mem[12][4] ), .D(n198), .Z(n159)
         );
  ND4 U327 ( .A(n161), .B(n160), .C(n159), .D(n232), .Z(n162) );
  AO4 U328 ( .A(n165), .B(n164), .C(n163), .D(n162), .Z(n166) );
  AO4 U329 ( .A(n209), .B(n166), .C(n207), .D(n406), .Z(n553) );
  AO4 U330 ( .A(n249), .B(n192), .C(n225), .D(n193), .Z(n176) );
  AO2 U331 ( .A(\mem[3][3] ), .B(n195), .C(\mem[5][3] ), .D(n194), .Z(n169) );
  AO2 U332 ( .A(\mem[7][3] ), .B(n197), .C(\mem[9][3] ), .D(n196), .Z(n168) );
  AO2 U333 ( .A(\mem[1][3] ), .B(n199), .C(\mem[13][3] ), .D(n198), .Z(n167)
         );
  ND4 U334 ( .A(rd_ptr[0]), .B(n169), .C(n168), .D(n167), .Z(n175) );
  AO4 U335 ( .A(n250), .B(n193), .C(n226), .D(n192), .Z(n174) );
  AO2 U336 ( .A(\mem[2][3] ), .B(n195), .C(\mem[4][3] ), .D(n194), .Z(n172) );
  AO2 U337 ( .A(\mem[6][3] ), .B(n197), .C(\mem[8][3] ), .D(n196), .Z(n171) );
  AO2 U338 ( .A(\mem[0][3] ), .B(n199), .C(\mem[12][3] ), .D(n198), .Z(n170)
         );
  ND4 U339 ( .A(n172), .B(n171), .C(n170), .D(n232), .Z(n173) );
  AO4 U340 ( .A(n176), .B(n175), .C(n174), .D(n173), .Z(n177) );
  AO4 U341 ( .A(n209), .B(n177), .C(n207), .D(n407), .Z(n554) );
  AO4 U342 ( .A(n251), .B(n192), .C(n227), .D(n193), .Z(n187) );
  AO2 U343 ( .A(\mem[3][2] ), .B(n195), .C(\mem[5][2] ), .D(n194), .Z(n180) );
  AO2 U344 ( .A(\mem[7][2] ), .B(n197), .C(\mem[9][2] ), .D(n196), .Z(n179) );
  AO2 U345 ( .A(\mem[1][2] ), .B(n199), .C(\mem[13][2] ), .D(n198), .Z(n178)
         );
  ND4 U346 ( .A(rd_ptr[0]), .B(n180), .C(n179), .D(n178), .Z(n186) );
  AO4 U347 ( .A(n252), .B(n193), .C(n228), .D(n192), .Z(n185) );
  AO2 U348 ( .A(\mem[2][2] ), .B(n195), .C(\mem[4][2] ), .D(n194), .Z(n183) );
  AO2 U349 ( .A(\mem[6][2] ), .B(n197), .C(\mem[8][2] ), .D(n196), .Z(n182) );
  AO2 U350 ( .A(\mem[0][2] ), .B(n199), .C(\mem[12][2] ), .D(n198), .Z(n181)
         );
  ND4 U351 ( .A(n183), .B(n182), .C(n181), .D(n232), .Z(n184) );
  AO4 U352 ( .A(n187), .B(n186), .C(n185), .D(n184), .Z(n188) );
  AO4 U353 ( .A(n209), .B(n188), .C(n207), .D(n408), .Z(n555) );
  AO4 U354 ( .A(n253), .B(n192), .C(n229), .D(n193), .Z(n206) );
  AO2 U355 ( .A(\mem[3][1] ), .B(n195), .C(\mem[5][1] ), .D(n194), .Z(n191) );
  AO2 U356 ( .A(\mem[7][1] ), .B(n197), .C(\mem[9][1] ), .D(n196), .Z(n190) );
  AO2 U357 ( .A(\mem[1][1] ), .B(n199), .C(\mem[13][1] ), .D(n198), .Z(n189)
         );
  ND4 U358 ( .A(rd_ptr[0]), .B(n191), .C(n190), .D(n189), .Z(n205) );
  AO4 U359 ( .A(n254), .B(n193), .C(n230), .D(n192), .Z(n204) );
  AO2 U360 ( .A(\mem[2][1] ), .B(n195), .C(\mem[4][1] ), .D(n194), .Z(n202) );
  AO2 U361 ( .A(\mem[6][1] ), .B(n197), .C(\mem[8][1] ), .D(n196), .Z(n201) );
  AO2 U362 ( .A(\mem[0][1] ), .B(n199), .C(\mem[12][1] ), .D(n198), .Z(n200)
         );
  ND4 U363 ( .A(n202), .B(n201), .C(n200), .D(n232), .Z(n203) );
  AO4 U364 ( .A(n206), .B(n205), .C(n204), .D(n203), .Z(n208) );
  AO4 U365 ( .A(n209), .B(n208), .C(n207), .D(n409), .Z(n556) );
endmodule


module router1x3 ( clk, resetn, read_en0, read_en1, read_en2, data_in, 
        pkt_valid, data_out0, data_out1, data_out2, valid_out0, valid_out1, 
        valid_out2, error, busy );
  input [7:0] data_in;
  output [7:0] data_out0;
  output [7:0] data_out1;
  output [7:0] data_out2;
  input clk, resetn, read_en0, read_en1, read_en2, pkt_valid;
  output valid_out0, valid_out1, valid_out2, error, busy;
  wire   soft_reset_0, lfd_state, full_0, empty_0, soft_reset_1, full_1,
         empty_1, soft_reset_2, full_2, empty_2, detect_add, write_reg_enb,
         fifo_full, parity_done, low_pkt_valid, ld_state, laf_state,
         full_state, rst_int_reg;
  wire   [2:0] write_enb;
  wire   [7:0] d_in;
  tri   [7:0] data_out0;
  tri   [7:0] data_out1;
  tri   [7:0] data_out2;

  fifo_2 fifo_0 ( .clk(clk), .resetn(resetn), .soft_reset(soft_reset_0), 
        .wr_enb(write_enb[0]), .rd_enb(read_en0), .lfd_state(1'b0), .data_in(
        d_in), .data_out(data_out0), .full(full_0), .empty(empty_0) );
  fifo_1 fifo_1 ( .clk(clk), .resetn(resetn), .soft_reset(soft_reset_1), 
        .wr_enb(write_enb[1]), .rd_enb(read_en1), .lfd_state(1'b0), .data_in(
        d_in), .data_out(data_out1), .full(full_1), .empty(empty_1) );
  fifo_0 fifo_2 ( .clk(clk), .resetn(resetn), .soft_reset(soft_reset_2), 
        .wr_enb(write_enb[2]), .rd_enb(read_en2), .lfd_state(1'b0), .data_in(
        d_in), .data_out(data_out2), .full(full_2), .empty(empty_2) );
  synchronizer_router sync ( .clk(clk), .resetn(resetn), .detect_add(
        detect_add), .data_in(data_in[1:0]), .write_enb_reg(write_reg_enb), 
        .empty0(empty_0), .empty1(empty_1), .empty2(empty_2), .full0(full_0), 
        .full1(full_1), .full2(full_2), .read_enb0(read_en0), .read_enb1(
        read_en1), .read_enb2(read_en2), .write_enb(write_enb), .valid_out0(
        valid_out0), .valid_out1(valid_out1), .valid_out2(valid_out2), 
        .soft_reset0(soft_reset_0), .soft_reset1(soft_reset_1), .soft_reset2(
        soft_reset_2), .fifo_full(fifo_full) );
  fsm fsm1 ( .clk(clk), .resetn(resetn), .pkt_valid(pkt_valid), .data_in(
        data_in[1:0]), .fifo_full(fifo_full), .fifo_empty0(empty_0), 
        .fifo_empty1(empty_1), .fifo_empty2(empty_2), .parity_done(parity_done), .soft_reset0(soft_reset_0), .soft_reset1(soft_reset_1), .soft_reset2(
        soft_reset_2), .low_pkt_valid(low_pkt_valid), .busy(busy), 
        .detect_add(detect_add), .lfd_state(lfd_state), .ld_state(ld_state), 
        .laf_state(laf_state), .full_state(full_state), .write_enb_reg(
        write_reg_enb), .rst_int_reg(rst_int_reg) );
  register reg1 ( .clk(clk), .resetn(resetn), .pkt_valid(pkt_valid), .data_in(
        data_in), .fifo_full(fifo_full), .rst_int_reg(rst_int_reg), 
        .detect_add(detect_add), .ld_state(ld_state), .lfd_state(lfd_state), 
        .laf_state(laf_state), .full_state(full_state), .parity_done(
        parity_done), .low_pkt_valid(low_pkt_valid), .error(error), .dout(d_in) );
endmodule

