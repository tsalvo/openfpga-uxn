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
-- layer0_node0_MUX[bit_math_h_l18_c3_5346]
signal layer0_node0_MUX_bit_math_h_l18_c3_5346_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_4bfc]
signal layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_6ed7]
signal layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_be7b]
signal layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_0234]
signal layer0_node4_MUX_bit_math_h_l62_c3_0234_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_477b]
signal layer0_node5_MUX_bit_math_h_l73_c3_477b_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_7899]
signal layer0_node6_MUX_bit_math_h_l84_c3_7899_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_1188]
signal layer0_node7_MUX_bit_math_h_l95_c3_1188_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_440d]
signal layer0_node8_MUX_bit_math_h_l106_c3_440d_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_1f36]
signal layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_7759]
signal layer0_node10_MUX_bit_math_h_l128_c3_7759_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_bc50]
signal layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_2f9d]
signal layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_86c0]
signal layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_a44b]
signal layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_b864]
signal layer0_node15_MUX_bit_math_h_l183_c3_b864_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_0ea6]
signal layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_3af8]
signal layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_5786]
signal layer0_node18_MUX_bit_math_h_l216_c3_5786_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_1174]
signal layer0_node19_MUX_bit_math_h_l227_c3_1174_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_a724]
signal layer0_node20_MUX_bit_math_h_l238_c3_a724_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_95df]
signal layer0_node21_MUX_bit_math_h_l249_c3_95df_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_b9ff]
signal layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_e6b6]
signal layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_d7da]
signal layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_e0ae]
signal layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_862b]
signal layer0_node26_MUX_bit_math_h_l304_c3_862b_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_a0cf]
signal layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_4de1]
signal layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_669d]
signal layer0_node29_MUX_bit_math_h_l337_c3_669d_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_92a3]
signal layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_7551]
signal layer0_node31_MUX_bit_math_h_l359_c3_7551_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_2073]
signal layer1_node0_MUX_bit_math_h_l376_c3_2073_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_15c0]
signal layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_195c]
signal layer1_node2_MUX_bit_math_h_l398_c3_195c_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_d1e0]
signal layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_3560]
signal layer1_node4_MUX_bit_math_h_l420_c3_3560_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_f1e7]
signal layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_babd]
signal layer1_node6_MUX_bit_math_h_l442_c3_babd_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_9648]
signal layer1_node7_MUX_bit_math_h_l453_c3_9648_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_c122]
signal layer1_node8_MUX_bit_math_h_l464_c3_c122_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_f70a]
signal layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_5912]
signal layer1_node10_MUX_bit_math_h_l486_c3_5912_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_27b6]
signal layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_dc9b]
signal layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_d37a]
signal layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_f819]
signal layer1_node14_MUX_bit_math_h_l530_c3_f819_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_a0a1]
signal layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_2ab2]
signal layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_6575]
signal layer2_node1_MUX_bit_math_h_l569_c3_6575_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_4df4]
signal layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_ae2c]
signal layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_fb32]
signal layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_1a7f]
signal layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_5b46]
signal layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_cfcb]
signal layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_55f7]
signal layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_ee60]
signal layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_ebc1]
signal layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_8012]
signal layer3_node3_MUX_bit_math_h_l685_c3_8012_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_df38]
signal layer4_node0_MUX_bit_math_h_l702_c3_df38_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_79d0]
signal layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_69ff]
signal layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_5346
layer0_node0_MUX_bit_math_h_l18_c3_5346 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_5346_cond,
layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_4bfc
layer0_node1_MUX_bit_math_h_l29_c3_4bfc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond,
layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_6ed7
layer0_node2_MUX_bit_math_h_l40_c3_6ed7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond,
layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_be7b
layer0_node3_MUX_bit_math_h_l51_c3_be7b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond,
layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_0234
layer0_node4_MUX_bit_math_h_l62_c3_0234 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_0234_cond,
layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_477b
layer0_node5_MUX_bit_math_h_l73_c3_477b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_477b_cond,
layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_7899
layer0_node6_MUX_bit_math_h_l84_c3_7899 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_7899_cond,
layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_1188
layer0_node7_MUX_bit_math_h_l95_c3_1188 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_1188_cond,
layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_440d
layer0_node8_MUX_bit_math_h_l106_c3_440d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_440d_cond,
layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_1f36
layer0_node9_MUX_bit_math_h_l117_c3_1f36 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond,
layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_7759
layer0_node10_MUX_bit_math_h_l128_c3_7759 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_7759_cond,
layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_bc50
layer0_node11_MUX_bit_math_h_l139_c3_bc50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond,
layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_2f9d
layer0_node12_MUX_bit_math_h_l150_c3_2f9d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond,
layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_86c0
layer0_node13_MUX_bit_math_h_l161_c3_86c0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond,
layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_a44b
layer0_node14_MUX_bit_math_h_l172_c3_a44b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond,
layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_b864
layer0_node15_MUX_bit_math_h_l183_c3_b864 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_b864_cond,
layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_0ea6
layer0_node16_MUX_bit_math_h_l194_c3_0ea6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond,
layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_3af8
layer0_node17_MUX_bit_math_h_l205_c3_3af8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond,
layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_5786
layer0_node18_MUX_bit_math_h_l216_c3_5786 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_5786_cond,
layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_1174
layer0_node19_MUX_bit_math_h_l227_c3_1174 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_1174_cond,
layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_a724
layer0_node20_MUX_bit_math_h_l238_c3_a724 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_a724_cond,
layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_95df
layer0_node21_MUX_bit_math_h_l249_c3_95df : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_95df_cond,
layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_b9ff
layer0_node22_MUX_bit_math_h_l260_c3_b9ff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond,
layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_e6b6
layer0_node23_MUX_bit_math_h_l271_c3_e6b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond,
layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_d7da
layer0_node24_MUX_bit_math_h_l282_c3_d7da : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond,
layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_e0ae
layer0_node25_MUX_bit_math_h_l293_c3_e0ae : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond,
layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_862b
layer0_node26_MUX_bit_math_h_l304_c3_862b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_862b_cond,
layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_a0cf
layer0_node27_MUX_bit_math_h_l315_c3_a0cf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond,
layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_4de1
layer0_node28_MUX_bit_math_h_l326_c3_4de1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond,
layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_669d
layer0_node29_MUX_bit_math_h_l337_c3_669d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_669d_cond,
layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_92a3
layer0_node30_MUX_bit_math_h_l348_c3_92a3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond,
layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_7551
layer0_node31_MUX_bit_math_h_l359_c3_7551 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_7551_cond,
layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_2073
layer1_node0_MUX_bit_math_h_l376_c3_2073 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_2073_cond,
layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_15c0
layer1_node1_MUX_bit_math_h_l387_c3_15c0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond,
layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_195c
layer1_node2_MUX_bit_math_h_l398_c3_195c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_195c_cond,
layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_d1e0
layer1_node3_MUX_bit_math_h_l409_c3_d1e0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond,
layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_3560
layer1_node4_MUX_bit_math_h_l420_c3_3560 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_3560_cond,
layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_f1e7
layer1_node5_MUX_bit_math_h_l431_c3_f1e7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond,
layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_babd
layer1_node6_MUX_bit_math_h_l442_c3_babd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_babd_cond,
layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_9648
layer1_node7_MUX_bit_math_h_l453_c3_9648 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_9648_cond,
layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_c122
layer1_node8_MUX_bit_math_h_l464_c3_c122 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_c122_cond,
layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_f70a
layer1_node9_MUX_bit_math_h_l475_c3_f70a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond,
layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_5912
layer1_node10_MUX_bit_math_h_l486_c3_5912 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_5912_cond,
layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_27b6
layer1_node11_MUX_bit_math_h_l497_c3_27b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond,
layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_dc9b
layer1_node12_MUX_bit_math_h_l508_c3_dc9b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond,
layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_d37a
layer1_node13_MUX_bit_math_h_l519_c3_d37a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond,
layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_f819
layer1_node14_MUX_bit_math_h_l530_c3_f819 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_f819_cond,
layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_a0a1
layer1_node15_MUX_bit_math_h_l541_c3_a0a1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond,
layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_2ab2
layer2_node0_MUX_bit_math_h_l558_c3_2ab2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond,
layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_6575
layer2_node1_MUX_bit_math_h_l569_c3_6575 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_6575_cond,
layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_4df4
layer2_node2_MUX_bit_math_h_l580_c3_4df4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond,
layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_ae2c
layer2_node3_MUX_bit_math_h_l591_c3_ae2c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond,
layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_fb32
layer2_node4_MUX_bit_math_h_l602_c3_fb32 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond,
layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_1a7f
layer2_node5_MUX_bit_math_h_l613_c3_1a7f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond,
layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_5b46
layer2_node6_MUX_bit_math_h_l624_c3_5b46 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond,
layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_cfcb
layer2_node7_MUX_bit_math_h_l635_c3_cfcb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond,
layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_55f7
layer3_node0_MUX_bit_math_h_l652_c3_55f7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond,
layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_ee60
layer3_node1_MUX_bit_math_h_l663_c3_ee60 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond,
layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_ebc1
layer3_node2_MUX_bit_math_h_l674_c3_ebc1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond,
layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_8012
layer3_node3_MUX_bit_math_h_l685_c3_8012 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_8012_cond,
layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_df38
layer4_node0_MUX_bit_math_h_l702_c3_df38 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_df38_cond,
layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_79d0
layer4_node1_MUX_bit_math_h_l713_c3_79d0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond,
layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_69ff
layer5_node0_MUX_bit_math_h_l730_c3_69ff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond,
layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_dca6_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_f5fb_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue := VAR_in9;
     -- uint6_1_1[bit_math_h_l372_c10_1c88] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_2_2[bit_math_h_l554_c10_d355] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output := uint6_2_2(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_dca6] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_dca6_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_9914] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output := uint6_0_0(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_f5fb] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_f5fb_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_a8c9] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output := uint6_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond := VAR_uint6_0_0_bit_math_h_l14_c10_9914_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_1c88_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d355_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond := VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond := VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond := VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_cond := VAR_uint6_3_3_bit_math_h_l648_c10_a8c9_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_cond := VAR_uint6_4_4_bit_math_h_l698_c10_dca6_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond := VAR_uint6_4_4_bit_math_h_l698_c10_dca6_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond := VAR_uint6_5_5_bit_math_h_l726_c10_f5fb_return_output;
     -- layer0_node20_MUX[bit_math_h_l238_c3_a724] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_a724_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output := layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_862b] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_862b_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output := layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_92a3] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output := layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_477b] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_477b_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output := layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_1188] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_1188_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output := layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_5346] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_5346_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output := layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_1174] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_1174_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output := layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_be7b] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output := layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_7551] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_7551_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output := layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_0ea6] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output := layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_a0cf] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output := layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_4bfc] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output := layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_440d] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_440d_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output := layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_e0ae] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output := layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_6ed7] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output := layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_0234] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_0234_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output := layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_1f36] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output := layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_bc50] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output := layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_b864] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_b864_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output := layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_4de1] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output := layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_a44b] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output := layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_86c0] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output := layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_7899] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_7899_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output := layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_b9ff] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output := layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_669d] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_669d_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output := layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_5786] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_5786_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output := layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_2f9d] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output := layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_3af8] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output := layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_95df] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_95df_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output := layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_7759] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_7759_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output := layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_e6b6] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output := layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_d7da] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output := layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_5346_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_7759_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_bc50_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_2f9d_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_86c0_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_a44b_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_b864_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_0ea6_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_3af8_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_5786_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_1174_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_4bfc_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_a724_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_95df_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_b9ff_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_e6b6_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_d7da_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_e0ae_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_862b_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_a0cf_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_4de1_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_669d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_6ed7_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_92a3_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_7551_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_be7b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_0234_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_477b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_7899_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_1188_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_440d_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_1f36_return_output;
     -- layer1_node14_MUX[bit_math_h_l530_c3_f819] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_f819_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output := layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_c122] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_c122_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output := layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_195c] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_195c_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output := layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_dc9b] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output := layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_3560] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_3560_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output := layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_babd] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_babd_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output := layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_a0a1] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output := layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_15c0] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output := layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_d37a] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output := layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_d1e0] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output := layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_9648] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_9648_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output := layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_27b6] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output := layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_5912] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_5912_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output := layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_f1e7] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output := layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_f70a] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output := layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_2073] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_2073_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output := layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_2073_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_5912_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_27b6_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_dc9b_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_d37a_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_f819_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_a0a1_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_15c0_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_195c_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_d1e0_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_3560_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_f1e7_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_babd_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_9648_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_c122_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_f70a_return_output;
     -- layer2_node4_MUX[bit_math_h_l602_c3_fb32] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output := layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_1a7f] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output := layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output;

     -- layer2_node6_MUX[bit_math_h_l624_c3_5b46] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output := layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_6575] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_6575_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output := layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_2ab2] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output := layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_cfcb] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output := layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_ae2c] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output := layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_4df4] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output := layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_2ab2_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_6575_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_4df4_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_ae2c_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_fb32_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_1a7f_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_5b46_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_cfcb_return_output;
     -- layer3_node2_MUX[bit_math_h_l674_c3_ebc1] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output := layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_55f7] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output := layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_8012] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_8012_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output := layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output;

     -- layer3_node1_MUX[bit_math_h_l663_c3_ee60] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output := layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_55f7_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_ee60_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_ebc1_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_8012_return_output;
     -- layer4_node1_MUX[bit_math_h_l713_c3_79d0] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output := layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output;

     -- layer4_node0_MUX[bit_math_h_l702_c3_df38] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_df38_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output := layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_df38_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_79d0_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_69ff] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output := layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_69ff_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
