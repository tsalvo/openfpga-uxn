-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 69
entity uint2_mux64_0CLK_9ff5fd8d is
port(
 sel : in unsigned(5 downto 0);
 in0 : in unsigned(1 downto 0);
 in1 : in unsigned(1 downto 0);
 in2 : in unsigned(1 downto 0);
 in3 : in unsigned(1 downto 0);
 in4 : in unsigned(1 downto 0);
 in5 : in unsigned(1 downto 0);
 in6 : in unsigned(1 downto 0);
 in7 : in unsigned(1 downto 0);
 in8 : in unsigned(1 downto 0);
 in9 : in unsigned(1 downto 0);
 in10 : in unsigned(1 downto 0);
 in11 : in unsigned(1 downto 0);
 in12 : in unsigned(1 downto 0);
 in13 : in unsigned(1 downto 0);
 in14 : in unsigned(1 downto 0);
 in15 : in unsigned(1 downto 0);
 in16 : in unsigned(1 downto 0);
 in17 : in unsigned(1 downto 0);
 in18 : in unsigned(1 downto 0);
 in19 : in unsigned(1 downto 0);
 in20 : in unsigned(1 downto 0);
 in21 : in unsigned(1 downto 0);
 in22 : in unsigned(1 downto 0);
 in23 : in unsigned(1 downto 0);
 in24 : in unsigned(1 downto 0);
 in25 : in unsigned(1 downto 0);
 in26 : in unsigned(1 downto 0);
 in27 : in unsigned(1 downto 0);
 in28 : in unsigned(1 downto 0);
 in29 : in unsigned(1 downto 0);
 in30 : in unsigned(1 downto 0);
 in31 : in unsigned(1 downto 0);
 in32 : in unsigned(1 downto 0);
 in33 : in unsigned(1 downto 0);
 in34 : in unsigned(1 downto 0);
 in35 : in unsigned(1 downto 0);
 in36 : in unsigned(1 downto 0);
 in37 : in unsigned(1 downto 0);
 in38 : in unsigned(1 downto 0);
 in39 : in unsigned(1 downto 0);
 in40 : in unsigned(1 downto 0);
 in41 : in unsigned(1 downto 0);
 in42 : in unsigned(1 downto 0);
 in43 : in unsigned(1 downto 0);
 in44 : in unsigned(1 downto 0);
 in45 : in unsigned(1 downto 0);
 in46 : in unsigned(1 downto 0);
 in47 : in unsigned(1 downto 0);
 in48 : in unsigned(1 downto 0);
 in49 : in unsigned(1 downto 0);
 in50 : in unsigned(1 downto 0);
 in51 : in unsigned(1 downto 0);
 in52 : in unsigned(1 downto 0);
 in53 : in unsigned(1 downto 0);
 in54 : in unsigned(1 downto 0);
 in55 : in unsigned(1 downto 0);
 in56 : in unsigned(1 downto 0);
 in57 : in unsigned(1 downto 0);
 in58 : in unsigned(1 downto 0);
 in59 : in unsigned(1 downto 0);
 in60 : in unsigned(1 downto 0);
 in61 : in unsigned(1 downto 0);
 in62 : in unsigned(1 downto 0);
 in63 : in unsigned(1 downto 0);
 return_output : out unsigned(1 downto 0));
end uint2_mux64_0CLK_9ff5fd8d;
architecture arch of uint2_mux64_0CLK_9ff5fd8d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_e29e]
signal layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_7c5b]
signal layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_657a]
signal layer0_node2_MUX_bit_math_h_l40_c3_657a_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_3978]
signal layer0_node3_MUX_bit_math_h_l51_c3_3978_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_f74b]
signal layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_7822]
signal layer0_node5_MUX_bit_math_h_l73_c3_7822_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_61f2]
signal layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_f0c1]
signal layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_d298]
signal layer0_node8_MUX_bit_math_h_l106_c3_d298_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_449e]
signal layer0_node9_MUX_bit_math_h_l117_c3_449e_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_97c4]
signal layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_6d92]
signal layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_bbf1]
signal layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_80c1]
signal layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_59a4]
signal layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_3f56]
signal layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_1d49]
signal layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_62aa]
signal layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_c508]
signal layer0_node18_MUX_bit_math_h_l216_c3_c508_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_2579]
signal layer0_node19_MUX_bit_math_h_l227_c3_2579_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_af48]
signal layer0_node20_MUX_bit_math_h_l238_c3_af48_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_65e2]
signal layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_d325]
signal layer0_node22_MUX_bit_math_h_l260_c3_d325_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_6252]
signal layer0_node23_MUX_bit_math_h_l271_c3_6252_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_95f8]
signal layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_ff87]
signal layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_8e37]
signal layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_f0f4]
signal layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_f9bb]
signal layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_bc9e]
signal layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_ca4f]
signal layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_7e86]
signal layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_4f28]
signal layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_84c6]
signal layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_f7ed]
signal layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_8e30]
signal layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_1ee0]
signal layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_58c8]
signal layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_bfa7]
signal layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_0f2a]
signal layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_4477]
signal layer1_node8_MUX_bit_math_h_l464_c3_4477_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_fe7f]
signal layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_d616]
signal layer1_node10_MUX_bit_math_h_l486_c3_d616_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_81cd]
signal layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_5ec2]
signal layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_8252]
signal layer1_node13_MUX_bit_math_h_l519_c3_8252_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_4ce6]
signal layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_fe32]
signal layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_7548]
signal layer2_node0_MUX_bit_math_h_l558_c3_7548_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_8863]
signal layer2_node1_MUX_bit_math_h_l569_c3_8863_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_a9b5]
signal layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_9d71]
signal layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_b66a]
signal layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_3a3a]
signal layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_5f33]
signal layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_beae]
signal layer2_node7_MUX_bit_math_h_l635_c3_beae_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_8efd]
signal layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_14f6]
signal layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_f4ac]
signal layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_f3f4]
signal layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_b2bd]
signal layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_6a95]
signal layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_71e5]
signal layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output : unsigned(1 downto 0);

function uint6_0_0( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint6_1_1( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint6_2_2( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint6_3_3( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint6_4_4( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint6_5_5( x : unsigned) return unsigned is
--variable x : unsigned(5 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_e29e
layer0_node0_MUX_bit_math_h_l18_c3_e29e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond,
layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_7c5b
layer0_node1_MUX_bit_math_h_l29_c3_7c5b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond,
layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_657a
layer0_node2_MUX_bit_math_h_l40_c3_657a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_657a_cond,
layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_3978
layer0_node3_MUX_bit_math_h_l51_c3_3978 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_3978_cond,
layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_f74b
layer0_node4_MUX_bit_math_h_l62_c3_f74b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond,
layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_7822
layer0_node5_MUX_bit_math_h_l73_c3_7822 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_7822_cond,
layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_61f2
layer0_node6_MUX_bit_math_h_l84_c3_61f2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond,
layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_f0c1
layer0_node7_MUX_bit_math_h_l95_c3_f0c1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond,
layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_d298
layer0_node8_MUX_bit_math_h_l106_c3_d298 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_d298_cond,
layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_449e
layer0_node9_MUX_bit_math_h_l117_c3_449e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_449e_cond,
layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_97c4
layer0_node10_MUX_bit_math_h_l128_c3_97c4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond,
layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_6d92
layer0_node11_MUX_bit_math_h_l139_c3_6d92 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond,
layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_bbf1
layer0_node12_MUX_bit_math_h_l150_c3_bbf1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond,
layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_80c1
layer0_node13_MUX_bit_math_h_l161_c3_80c1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond,
layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_59a4
layer0_node14_MUX_bit_math_h_l172_c3_59a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond,
layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_3f56
layer0_node15_MUX_bit_math_h_l183_c3_3f56 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond,
layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_1d49
layer0_node16_MUX_bit_math_h_l194_c3_1d49 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond,
layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_62aa
layer0_node17_MUX_bit_math_h_l205_c3_62aa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond,
layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_c508
layer0_node18_MUX_bit_math_h_l216_c3_c508 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_c508_cond,
layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_2579
layer0_node19_MUX_bit_math_h_l227_c3_2579 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_2579_cond,
layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_af48
layer0_node20_MUX_bit_math_h_l238_c3_af48 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_af48_cond,
layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_65e2
layer0_node21_MUX_bit_math_h_l249_c3_65e2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond,
layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_d325
layer0_node22_MUX_bit_math_h_l260_c3_d325 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_d325_cond,
layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_6252
layer0_node23_MUX_bit_math_h_l271_c3_6252 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_6252_cond,
layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_95f8
layer0_node24_MUX_bit_math_h_l282_c3_95f8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond,
layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_ff87
layer0_node25_MUX_bit_math_h_l293_c3_ff87 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond,
layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_8e37
layer0_node26_MUX_bit_math_h_l304_c3_8e37 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond,
layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_f0f4
layer0_node27_MUX_bit_math_h_l315_c3_f0f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond,
layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_f9bb
layer0_node28_MUX_bit_math_h_l326_c3_f9bb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond,
layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_bc9e
layer0_node29_MUX_bit_math_h_l337_c3_bc9e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond,
layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_ca4f
layer0_node30_MUX_bit_math_h_l348_c3_ca4f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond,
layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_7e86
layer0_node31_MUX_bit_math_h_l359_c3_7e86 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond,
layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_4f28
layer1_node0_MUX_bit_math_h_l376_c3_4f28 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond,
layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_84c6
layer1_node1_MUX_bit_math_h_l387_c3_84c6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond,
layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_f7ed
layer1_node2_MUX_bit_math_h_l398_c3_f7ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond,
layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_8e30
layer1_node3_MUX_bit_math_h_l409_c3_8e30 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond,
layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_1ee0
layer1_node4_MUX_bit_math_h_l420_c3_1ee0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond,
layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_58c8
layer1_node5_MUX_bit_math_h_l431_c3_58c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond,
layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_bfa7
layer1_node6_MUX_bit_math_h_l442_c3_bfa7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond,
layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_0f2a
layer1_node7_MUX_bit_math_h_l453_c3_0f2a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond,
layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_4477
layer1_node8_MUX_bit_math_h_l464_c3_4477 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_4477_cond,
layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_fe7f
layer1_node9_MUX_bit_math_h_l475_c3_fe7f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond,
layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_d616
layer1_node10_MUX_bit_math_h_l486_c3_d616 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_d616_cond,
layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_81cd
layer1_node11_MUX_bit_math_h_l497_c3_81cd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond,
layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_5ec2
layer1_node12_MUX_bit_math_h_l508_c3_5ec2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond,
layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_8252
layer1_node13_MUX_bit_math_h_l519_c3_8252 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_8252_cond,
layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_4ce6
layer1_node14_MUX_bit_math_h_l530_c3_4ce6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond,
layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_fe32
layer1_node15_MUX_bit_math_h_l541_c3_fe32 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond,
layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_7548
layer2_node0_MUX_bit_math_h_l558_c3_7548 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_7548_cond,
layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_8863
layer2_node1_MUX_bit_math_h_l569_c3_8863 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_8863_cond,
layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_a9b5
layer2_node2_MUX_bit_math_h_l580_c3_a9b5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond,
layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_9d71
layer2_node3_MUX_bit_math_h_l591_c3_9d71 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond,
layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_b66a
layer2_node4_MUX_bit_math_h_l602_c3_b66a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond,
layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_3a3a
layer2_node5_MUX_bit_math_h_l613_c3_3a3a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond,
layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_5f33
layer2_node6_MUX_bit_math_h_l624_c3_5f33 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond,
layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_beae
layer2_node7_MUX_bit_math_h_l635_c3_beae : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_beae_cond,
layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_8efd
layer3_node0_MUX_bit_math_h_l652_c3_8efd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond,
layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_14f6
layer3_node1_MUX_bit_math_h_l663_c3_14f6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond,
layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_f4ac
layer3_node2_MUX_bit_math_h_l674_c3_f4ac : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond,
layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_f3f4
layer3_node3_MUX_bit_math_h_l685_c3_f3f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond,
layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_b2bd
layer4_node0_MUX_bit_math_h_l702_c3_b2bd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond,
layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_6a95
layer4_node1_MUX_bit_math_h_l713_c3_6a95 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond,
layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_71e5
layer5_node0_MUX_bit_math_h_l730_c3_71e5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond,
layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 in4,
 in5,
 in6,
 in7,
 in8,
 in9,
 in10,
 in11,
 in12,
 in13,
 in14,
 in15,
 in16,
 in17,
 in18,
 in19,
 in20,
 in21,
 in22,
 in23,
 in24,
 in25,
 in26,
 in27,
 in28,
 in29,
 in30,
 in31,
 in32,
 in33,
 in34,
 in35,
 in36,
 in37,
 in38,
 in39,
 in40,
 in41,
 in42,
 in43,
 in44,
 in45,
 in46,
 in47,
 in48,
 in49,
 in50,
 in51,
 in52,
 in53,
 in54,
 in55,
 in56,
 in57,
 in58,
 in59,
 in60,
 in61,
 in62,
 in63,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_sel : unsigned(5 downto 0);
 variable VAR_in0 : unsigned(1 downto 0);
 variable VAR_in1 : unsigned(1 downto 0);
 variable VAR_in2 : unsigned(1 downto 0);
 variable VAR_in3 : unsigned(1 downto 0);
 variable VAR_in4 : unsigned(1 downto 0);
 variable VAR_in5 : unsigned(1 downto 0);
 variable VAR_in6 : unsigned(1 downto 0);
 variable VAR_in7 : unsigned(1 downto 0);
 variable VAR_in8 : unsigned(1 downto 0);
 variable VAR_in9 : unsigned(1 downto 0);
 variable VAR_in10 : unsigned(1 downto 0);
 variable VAR_in11 : unsigned(1 downto 0);
 variable VAR_in12 : unsigned(1 downto 0);
 variable VAR_in13 : unsigned(1 downto 0);
 variable VAR_in14 : unsigned(1 downto 0);
 variable VAR_in15 : unsigned(1 downto 0);
 variable VAR_in16 : unsigned(1 downto 0);
 variable VAR_in17 : unsigned(1 downto 0);
 variable VAR_in18 : unsigned(1 downto 0);
 variable VAR_in19 : unsigned(1 downto 0);
 variable VAR_in20 : unsigned(1 downto 0);
 variable VAR_in21 : unsigned(1 downto 0);
 variable VAR_in22 : unsigned(1 downto 0);
 variable VAR_in23 : unsigned(1 downto 0);
 variable VAR_in24 : unsigned(1 downto 0);
 variable VAR_in25 : unsigned(1 downto 0);
 variable VAR_in26 : unsigned(1 downto 0);
 variable VAR_in27 : unsigned(1 downto 0);
 variable VAR_in28 : unsigned(1 downto 0);
 variable VAR_in29 : unsigned(1 downto 0);
 variable VAR_in30 : unsigned(1 downto 0);
 variable VAR_in31 : unsigned(1 downto 0);
 variable VAR_in32 : unsigned(1 downto 0);
 variable VAR_in33 : unsigned(1 downto 0);
 variable VAR_in34 : unsigned(1 downto 0);
 variable VAR_in35 : unsigned(1 downto 0);
 variable VAR_in36 : unsigned(1 downto 0);
 variable VAR_in37 : unsigned(1 downto 0);
 variable VAR_in38 : unsigned(1 downto 0);
 variable VAR_in39 : unsigned(1 downto 0);
 variable VAR_in40 : unsigned(1 downto 0);
 variable VAR_in41 : unsigned(1 downto 0);
 variable VAR_in42 : unsigned(1 downto 0);
 variable VAR_in43 : unsigned(1 downto 0);
 variable VAR_in44 : unsigned(1 downto 0);
 variable VAR_in45 : unsigned(1 downto 0);
 variable VAR_in46 : unsigned(1 downto 0);
 variable VAR_in47 : unsigned(1 downto 0);
 variable VAR_in48 : unsigned(1 downto 0);
 variable VAR_in49 : unsigned(1 downto 0);
 variable VAR_in50 : unsigned(1 downto 0);
 variable VAR_in51 : unsigned(1 downto 0);
 variable VAR_in52 : unsigned(1 downto 0);
 variable VAR_in53 : unsigned(1 downto 0);
 variable VAR_in54 : unsigned(1 downto 0);
 variable VAR_in55 : unsigned(1 downto 0);
 variable VAR_in56 : unsigned(1 downto 0);
 variable VAR_in57 : unsigned(1 downto 0);
 variable VAR_in58 : unsigned(1 downto 0);
 variable VAR_in59 : unsigned(1 downto 0);
 variable VAR_in60 : unsigned(1 downto 0);
 variable VAR_in61 : unsigned(1 downto 0);
 variable VAR_in62 : unsigned(1 downto 0);
 variable VAR_in63 : unsigned(1 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_bf67_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_dd01_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_sel := sel;
     VAR_in0 := in0;
     VAR_in1 := in1;
     VAR_in2 := in2;
     VAR_in3 := in3;
     VAR_in4 := in4;
     VAR_in5 := in5;
     VAR_in6 := in6;
     VAR_in7 := in7;
     VAR_in8 := in8;
     VAR_in9 := in9;
     VAR_in10 := in10;
     VAR_in11 := in11;
     VAR_in12 := in12;
     VAR_in13 := in13;
     VAR_in14 := in14;
     VAR_in15 := in15;
     VAR_in16 := in16;
     VAR_in17 := in17;
     VAR_in18 := in18;
     VAR_in19 := in19;
     VAR_in20 := in20;
     VAR_in21 := in21;
     VAR_in22 := in22;
     VAR_in23 := in23;
     VAR_in24 := in24;
     VAR_in25 := in25;
     VAR_in26 := in26;
     VAR_in27 := in27;
     VAR_in28 := in28;
     VAR_in29 := in29;
     VAR_in30 := in30;
     VAR_in31 := in31;
     VAR_in32 := in32;
     VAR_in33 := in33;
     VAR_in34 := in34;
     VAR_in35 := in35;
     VAR_in36 := in36;
     VAR_in37 := in37;
     VAR_in38 := in38;
     VAR_in39 := in39;
     VAR_in40 := in40;
     VAR_in41 := in41;
     VAR_in42 := in42;
     VAR_in43 := in43;
     VAR_in44 := in44;
     VAR_in45 := in45;
     VAR_in46 := in46;
     VAR_in47 := in47;
     VAR_in48 := in48;
     VAR_in49 := in49;
     VAR_in50 := in50;
     VAR_in51 := in51;
     VAR_in52 := in52;
     VAR_in53 := in53;
     VAR_in54 := in54;
     VAR_in55 := in55;
     VAR_in56 := in56;
     VAR_in57 := in57;
     VAR_in58 := in58;
     VAR_in59 := in59;
     VAR_in60 := in60;
     VAR_in61 := in61;
     VAR_in62 := in62;
     VAR_in63 := in63;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue := VAR_in9;
     -- uint6_4_4[bit_math_h_l698_c10_bf67] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_bf67_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_6d60] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output := uint6_0_0(
     VAR_sel);

     -- uint6_2_2[bit_math_h_l554_c10_d1b0] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output := uint6_2_2(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_dd01] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_dd01_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_1_1[bit_math_h_l372_c10_e06b] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_501e] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output := uint6_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_6d60_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e06b_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1b0_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond := VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond := VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond := VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond := VAR_uint6_3_3_bit_math_h_l648_c10_501e_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond := VAR_uint6_4_4_bit_math_h_l698_c10_bf67_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond := VAR_uint6_4_4_bit_math_h_l698_c10_bf67_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond := VAR_uint6_5_5_bit_math_h_l726_c10_dd01_return_output;
     -- layer0_node29_MUX[bit_math_h_l337_c3_bc9e] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output := layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_7822] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_7822_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output := layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_af48] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_af48_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output := layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_6252] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_6252_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output := layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_d325] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_d325_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output := layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_ca4f] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output := layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_95f8] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output := layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_7c5b] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output := layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_f0c1] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output := layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_61f2] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output := layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_c508] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_c508_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output := layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_97c4] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output := layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_f0f4] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output := layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_bbf1] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output := layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_1d49] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output := layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_65e2] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output := layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_ff87] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output := layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_657a] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_657a_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output := layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_8e37] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output := layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_59a4] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output := layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_80c1] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output := layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_6d92] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output := layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_449e] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_449e_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output := layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_7e86] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output := layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_62aa] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output := layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_d298] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_d298_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output := layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_3f56] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output := layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_3978] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_3978_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output := layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_2579] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_2579_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output := layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_f9bb] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output := layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_e29e] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output := layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_f74b] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output := layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_e29e_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_97c4_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_6d92_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_bbf1_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_80c1_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_59a4_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_3f56_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_1d49_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_62aa_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_c508_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_2579_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_7c5b_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_af48_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_65e2_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_d325_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_6252_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_95f8_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_ff87_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_8e37_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_f0f4_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_f9bb_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_bc9e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_657a_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_ca4f_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_7e86_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_3978_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_f74b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_7822_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_61f2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_f0c1_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_d298_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_449e_return_output;
     -- layer1_node5_MUX[bit_math_h_l431_c3_58c8] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output := layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_bfa7] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output := layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_fe32] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output := layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_0f2a] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output := layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_f7ed] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output := layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_8252] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_8252_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output := layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_4f28] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output := layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_84c6] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output := layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_1ee0] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output := layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_5ec2] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output := layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_4477] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_4477_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output := layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_fe7f] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output := layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_4ce6] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output := layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_8e30] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output := layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_d616] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_d616_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output := layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_81cd] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output := layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_4f28_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_d616_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_81cd_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_5ec2_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_8252_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_4ce6_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_fe32_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_84c6_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_f7ed_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_8e30_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_1ee0_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_58c8_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_bfa7_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_0f2a_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_4477_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_fe7f_return_output;
     -- layer2_node6_MUX[bit_math_h_l624_c3_5f33] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output := layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_a9b5] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output := layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_7548] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_7548_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output := layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_9d71] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output := layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output;

     -- layer2_node4_MUX[bit_math_h_l602_c3_b66a] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output := layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_8863] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_8863_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output := layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_beae] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_beae_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output := layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_3a3a] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output := layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_7548_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_8863_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_a9b5_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_9d71_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_b66a_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_3a3a_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_5f33_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_beae_return_output;
     -- layer3_node1_MUX[bit_math_h_l663_c3_14f6] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output := layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_8efd] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output := layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output;

     -- layer3_node2_MUX[bit_math_h_l674_c3_f4ac] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output := layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_f3f4] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output := layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_8efd_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_14f6_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_f4ac_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_f3f4_return_output;
     -- layer4_node0_MUX[bit_math_h_l702_c3_b2bd] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output := layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output;

     -- layer4_node1_MUX[bit_math_h_l713_c3_6a95] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output := layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_b2bd_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_6a95_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_71e5] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output := layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_71e5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
