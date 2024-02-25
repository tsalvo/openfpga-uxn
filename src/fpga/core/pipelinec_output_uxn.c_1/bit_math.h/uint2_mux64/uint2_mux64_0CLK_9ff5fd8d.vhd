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
-- layer0_node0_MUX[bit_math_h_l18_c3_afe0]
signal layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_a734]
signal layer0_node1_MUX_bit_math_h_l29_c3_a734_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_6e07]
signal layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_a27e]
signal layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_8958]
signal layer0_node4_MUX_bit_math_h_l62_c3_8958_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_573d]
signal layer0_node5_MUX_bit_math_h_l73_c3_573d_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_991c]
signal layer0_node6_MUX_bit_math_h_l84_c3_991c_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_441c]
signal layer0_node7_MUX_bit_math_h_l95_c3_441c_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_ff47]
signal layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_fdbf]
signal layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_0359]
signal layer0_node10_MUX_bit_math_h_l128_c3_0359_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_a4a4]
signal layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_8c75]
signal layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_86b2]
signal layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_189c]
signal layer0_node14_MUX_bit_math_h_l172_c3_189c_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_02f4]
signal layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_0d90]
signal layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_d3f8]
signal layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_cadb]
signal layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_5415]
signal layer0_node19_MUX_bit_math_h_l227_c3_5415_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_84d6]
signal layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_f3ed]
signal layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_1451]
signal layer0_node22_MUX_bit_math_h_l260_c3_1451_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_e0b6]
signal layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_7711]
signal layer0_node24_MUX_bit_math_h_l282_c3_7711_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_6190]
signal layer0_node25_MUX_bit_math_h_l293_c3_6190_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_3ed7]
signal layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_83e6]
signal layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_b63d]
signal layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_0db1]
signal layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_b2ba]
signal layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_88b2]
signal layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_d0ab]
signal layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_9e96]
signal layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_a39e]
signal layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_ee02]
signal layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_7b28]
signal layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_5307]
signal layer1_node5_MUX_bit_math_h_l431_c3_5307_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_0a4f]
signal layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_bdab]
signal layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_0d76]
signal layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_2795]
signal layer1_node9_MUX_bit_math_h_l475_c3_2795_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_3430]
signal layer1_node10_MUX_bit_math_h_l486_c3_3430_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_fb18]
signal layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_7959]
signal layer1_node12_MUX_bit_math_h_l508_c3_7959_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_886d]
signal layer1_node13_MUX_bit_math_h_l519_c3_886d_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_0cd1]
signal layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_e21a]
signal layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_b21c]
signal layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_7c33]
signal layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_da63]
signal layer2_node2_MUX_bit_math_h_l580_c3_da63_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_a97e]
signal layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_1c8c]
signal layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_2ad3]
signal layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_2f5b]
signal layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_4ea5]
signal layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_a3da]
signal layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_4a8e]
signal layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_841e]
signal layer3_node2_MUX_bit_math_h_l674_c3_841e_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_14fa]
signal layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_37c0]
signal layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_1bad]
signal layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_d7b7]
signal layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_afe0
layer0_node0_MUX_bit_math_h_l18_c3_afe0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond,
layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_a734
layer0_node1_MUX_bit_math_h_l29_c3_a734 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_a734_cond,
layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_6e07
layer0_node2_MUX_bit_math_h_l40_c3_6e07 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond,
layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_a27e
layer0_node3_MUX_bit_math_h_l51_c3_a27e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond,
layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_8958
layer0_node4_MUX_bit_math_h_l62_c3_8958 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_8958_cond,
layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_573d
layer0_node5_MUX_bit_math_h_l73_c3_573d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_573d_cond,
layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_991c
layer0_node6_MUX_bit_math_h_l84_c3_991c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_991c_cond,
layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_441c
layer0_node7_MUX_bit_math_h_l95_c3_441c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_441c_cond,
layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_ff47
layer0_node8_MUX_bit_math_h_l106_c3_ff47 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond,
layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_fdbf
layer0_node9_MUX_bit_math_h_l117_c3_fdbf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond,
layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_0359
layer0_node10_MUX_bit_math_h_l128_c3_0359 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_0359_cond,
layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_a4a4
layer0_node11_MUX_bit_math_h_l139_c3_a4a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond,
layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_8c75
layer0_node12_MUX_bit_math_h_l150_c3_8c75 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond,
layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_86b2
layer0_node13_MUX_bit_math_h_l161_c3_86b2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond,
layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_189c
layer0_node14_MUX_bit_math_h_l172_c3_189c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_189c_cond,
layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_02f4
layer0_node15_MUX_bit_math_h_l183_c3_02f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond,
layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_0d90
layer0_node16_MUX_bit_math_h_l194_c3_0d90 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond,
layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_d3f8
layer0_node17_MUX_bit_math_h_l205_c3_d3f8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond,
layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_cadb
layer0_node18_MUX_bit_math_h_l216_c3_cadb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond,
layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_5415
layer0_node19_MUX_bit_math_h_l227_c3_5415 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_5415_cond,
layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_84d6
layer0_node20_MUX_bit_math_h_l238_c3_84d6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond,
layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_f3ed
layer0_node21_MUX_bit_math_h_l249_c3_f3ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond,
layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_1451
layer0_node22_MUX_bit_math_h_l260_c3_1451 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_1451_cond,
layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_e0b6
layer0_node23_MUX_bit_math_h_l271_c3_e0b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond,
layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_7711
layer0_node24_MUX_bit_math_h_l282_c3_7711 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_7711_cond,
layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_6190
layer0_node25_MUX_bit_math_h_l293_c3_6190 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_6190_cond,
layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_3ed7
layer0_node26_MUX_bit_math_h_l304_c3_3ed7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond,
layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_83e6
layer0_node27_MUX_bit_math_h_l315_c3_83e6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond,
layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_b63d
layer0_node28_MUX_bit_math_h_l326_c3_b63d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond,
layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_0db1
layer0_node29_MUX_bit_math_h_l337_c3_0db1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond,
layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_b2ba
layer0_node30_MUX_bit_math_h_l348_c3_b2ba : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond,
layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_88b2
layer0_node31_MUX_bit_math_h_l359_c3_88b2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond,
layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_d0ab
layer1_node0_MUX_bit_math_h_l376_c3_d0ab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond,
layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_9e96
layer1_node1_MUX_bit_math_h_l387_c3_9e96 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond,
layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_a39e
layer1_node2_MUX_bit_math_h_l398_c3_a39e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond,
layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_ee02
layer1_node3_MUX_bit_math_h_l409_c3_ee02 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond,
layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_7b28
layer1_node4_MUX_bit_math_h_l420_c3_7b28 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond,
layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_5307
layer1_node5_MUX_bit_math_h_l431_c3_5307 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_5307_cond,
layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_0a4f
layer1_node6_MUX_bit_math_h_l442_c3_0a4f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond,
layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_bdab
layer1_node7_MUX_bit_math_h_l453_c3_bdab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond,
layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_0d76
layer1_node8_MUX_bit_math_h_l464_c3_0d76 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond,
layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_2795
layer1_node9_MUX_bit_math_h_l475_c3_2795 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_2795_cond,
layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_3430
layer1_node10_MUX_bit_math_h_l486_c3_3430 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_3430_cond,
layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_fb18
layer1_node11_MUX_bit_math_h_l497_c3_fb18 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond,
layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_7959
layer1_node12_MUX_bit_math_h_l508_c3_7959 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_7959_cond,
layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_886d
layer1_node13_MUX_bit_math_h_l519_c3_886d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_886d_cond,
layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_0cd1
layer1_node14_MUX_bit_math_h_l530_c3_0cd1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond,
layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_e21a
layer1_node15_MUX_bit_math_h_l541_c3_e21a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond,
layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_b21c
layer2_node0_MUX_bit_math_h_l558_c3_b21c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond,
layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_7c33
layer2_node1_MUX_bit_math_h_l569_c3_7c33 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond,
layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_da63
layer2_node2_MUX_bit_math_h_l580_c3_da63 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_da63_cond,
layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_a97e
layer2_node3_MUX_bit_math_h_l591_c3_a97e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond,
layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_1c8c
layer2_node4_MUX_bit_math_h_l602_c3_1c8c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond,
layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_2ad3
layer2_node5_MUX_bit_math_h_l613_c3_2ad3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond,
layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_2f5b
layer2_node6_MUX_bit_math_h_l624_c3_2f5b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond,
layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_4ea5
layer2_node7_MUX_bit_math_h_l635_c3_4ea5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond,
layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_a3da
layer3_node0_MUX_bit_math_h_l652_c3_a3da : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond,
layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_4a8e
layer3_node1_MUX_bit_math_h_l663_c3_4a8e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond,
layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_841e
layer3_node2_MUX_bit_math_h_l674_c3_841e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_841e_cond,
layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_14fa
layer3_node3_MUX_bit_math_h_l685_c3_14fa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond,
layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_37c0
layer4_node0_MUX_bit_math_h_l702_c3_37c0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond,
layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_1bad
layer4_node1_MUX_bit_math_h_l713_c3_1bad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond,
layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_d7b7
layer5_node0_MUX_bit_math_h_l730_c3_d7b7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond,
layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_6014_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_1d32_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue := VAR_in9;
     -- uint6_1_1[bit_math_h_l372_c10_6abb] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_1d32] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_1d32_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_6014] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_6014_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_161a] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output := uint6_3_3(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_976e] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output := uint6_0_0(
     VAR_sel);

     -- uint6_2_2[bit_math_h_l554_c10_2ced] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output := uint6_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond := VAR_uint6_0_0_bit_math_h_l14_c10_976e_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_cond := VAR_uint6_1_1_bit_math_h_l372_c10_6abb_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_2ced_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond := VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond := VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_cond := VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond := VAR_uint6_3_3_bit_math_h_l648_c10_161a_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond := VAR_uint6_4_4_bit_math_h_l698_c10_6014_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond := VAR_uint6_4_4_bit_math_h_l698_c10_6014_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond := VAR_uint6_5_5_bit_math_h_l726_c10_1d32_return_output;
     -- layer0_node26_MUX[bit_math_h_l304_c3_3ed7] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output := layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_83e6] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output := layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_afe0] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output := layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_6e07] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output := layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_a734] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_a734_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output := layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_5415] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_5415_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output := layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_02f4] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output := layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_6190] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_6190_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output := layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_189c] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_189c_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output := layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_d3f8] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output := layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_e0b6] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output := layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_1451] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_1451_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output := layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_573d] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_573d_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output := layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_ff47] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output := layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_84d6] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output := layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_f3ed] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output := layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_86b2] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output := layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_a4a4] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output := layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_cadb] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output := layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_88b2] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output := layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_a27e] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output := layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_7711] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_7711_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output := layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_b2ba] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output := layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_0359] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_0359_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output := layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_0db1] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output := layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_fdbf] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output := layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_8c75] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output := layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_991c] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_991c_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output := layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_441c] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_441c_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output := layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_b63d] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output := layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_0d90] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output := layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_8958] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_8958_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output := layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_afe0_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_0359_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_a4a4_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_8c75_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_86b2_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_189c_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_02f4_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_0d90_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_d3f8_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_cadb_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_5415_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_a734_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_84d6_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_f3ed_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_1451_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_e0b6_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_7711_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_6190_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_3ed7_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_83e6_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_b63d_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_0db1_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_6e07_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_b2ba_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_88b2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_a27e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_8958_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_573d_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_991c_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_441c_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_ff47_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_fdbf_return_output;
     -- layer1_node8_MUX[bit_math_h_l464_c3_0d76] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output := layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_3430] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_3430_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output := layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_0a4f] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output := layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_5307] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_5307_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output := layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_7b28] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output := layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_7959] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_7959_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output := layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_9e96] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output := layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_fb18] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output := layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_0cd1] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output := layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_ee02] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output := layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_a39e] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output := layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_bdab] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output := layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_d0ab] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output := layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_886d] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_886d_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output := layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_2795] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_2795_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output := layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_e21a] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output := layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_d0ab_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_3430_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_fb18_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_7959_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_886d_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_0cd1_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_e21a_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_9e96_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_a39e_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_ee02_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_7b28_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_5307_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_0a4f_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_bdab_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_0d76_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_2795_return_output;
     -- layer2_node6_MUX[bit_math_h_l624_c3_2f5b] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output := layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_b21c] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output := layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_2ad3] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output := layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_a97e] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output := layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_da63] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_da63_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output := layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_4ea5] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output := layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output;

     -- layer2_node4_MUX[bit_math_h_l602_c3_1c8c] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output := layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_7c33] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output := layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_b21c_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_7c33_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_da63_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_a97e_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_1c8c_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_2ad3_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_2f5b_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_4ea5_return_output;
     -- layer3_node1_MUX[bit_math_h_l663_c3_4a8e] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output := layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_a3da] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output := layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output;

     -- layer3_node2_MUX[bit_math_h_l674_c3_841e] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_841e_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output := layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_14fa] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output := layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_a3da_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_4a8e_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_841e_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_14fa_return_output;
     -- layer4_node1_MUX[bit_math_h_l713_c3_1bad] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output := layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output;

     -- layer4_node0_MUX[bit_math_h_l702_c3_37c0] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output := layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_37c0_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_1bad_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_d7b7] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output := layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_d7b7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
