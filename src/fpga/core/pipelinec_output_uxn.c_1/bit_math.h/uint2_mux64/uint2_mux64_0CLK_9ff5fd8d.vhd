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
-- layer0_node0_MUX[bit_math_h_l18_c3_7b99]
signal layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_f58f]
signal layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_4474]
signal layer0_node2_MUX_bit_math_h_l40_c3_4474_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_ffb1]
signal layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_b38e]
signal layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_fad4]
signal layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_4c09]
signal layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_c88d]
signal layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_c915]
signal layer0_node8_MUX_bit_math_h_l106_c3_c915_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_022e]
signal layer0_node9_MUX_bit_math_h_l117_c3_022e_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_1e46]
signal layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_f127]
signal layer0_node11_MUX_bit_math_h_l139_c3_f127_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_5a32]
signal layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_d460]
signal layer0_node13_MUX_bit_math_h_l161_c3_d460_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_dcd8]
signal layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_518c]
signal layer0_node15_MUX_bit_math_h_l183_c3_518c_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_6fd3]
signal layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_1d43]
signal layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_7750]
signal layer0_node18_MUX_bit_math_h_l216_c3_7750_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_3635]
signal layer0_node19_MUX_bit_math_h_l227_c3_3635_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_987d]
signal layer0_node20_MUX_bit_math_h_l238_c3_987d_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_c689]
signal layer0_node21_MUX_bit_math_h_l249_c3_c689_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_dfc1]
signal layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_223c]
signal layer0_node23_MUX_bit_math_h_l271_c3_223c_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_97d4]
signal layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_62e2]
signal layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_7515]
signal layer0_node26_MUX_bit_math_h_l304_c3_7515_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_072a]
signal layer0_node27_MUX_bit_math_h_l315_c3_072a_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_2930]
signal layer0_node28_MUX_bit_math_h_l326_c3_2930_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_34fe]
signal layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_db94]
signal layer0_node30_MUX_bit_math_h_l348_c3_db94_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_2069]
signal layer0_node31_MUX_bit_math_h_l359_c3_2069_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_d38e]
signal layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_c4ee]
signal layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_35bb]
signal layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_b612]
signal layer1_node3_MUX_bit_math_h_l409_c3_b612_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_e901]
signal layer1_node4_MUX_bit_math_h_l420_c3_e901_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_4588]
signal layer1_node5_MUX_bit_math_h_l431_c3_4588_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_51be]
signal layer1_node6_MUX_bit_math_h_l442_c3_51be_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_c1b1]
signal layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_49e7]
signal layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_dd27]
signal layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_cf90]
signal layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_3a37]
signal layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_5bfa]
signal layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_017c]
signal layer1_node13_MUX_bit_math_h_l519_c3_017c_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_2c42]
signal layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_af56]
signal layer1_node15_MUX_bit_math_h_l541_c3_af56_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_cac5]
signal layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_88f5]
signal layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_818f]
signal layer2_node2_MUX_bit_math_h_l580_c3_818f_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_0de5]
signal layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_c424]
signal layer2_node4_MUX_bit_math_h_l602_c3_c424_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_bfa4]
signal layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_8afb]
signal layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_ff65]
signal layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_40e0]
signal layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_62fa]
signal layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_0853]
signal layer3_node2_MUX_bit_math_h_l674_c3_0853_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_76eb]
signal layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_6018]
signal layer4_node0_MUX_bit_math_h_l702_c3_6018_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_0e2c]
signal layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_d82d]
signal layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_7b99
layer0_node0_MUX_bit_math_h_l18_c3_7b99 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond,
layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_f58f
layer0_node1_MUX_bit_math_h_l29_c3_f58f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond,
layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_4474
layer0_node2_MUX_bit_math_h_l40_c3_4474 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_4474_cond,
layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_ffb1
layer0_node3_MUX_bit_math_h_l51_c3_ffb1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond,
layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_b38e
layer0_node4_MUX_bit_math_h_l62_c3_b38e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond,
layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_fad4
layer0_node5_MUX_bit_math_h_l73_c3_fad4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond,
layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_4c09
layer0_node6_MUX_bit_math_h_l84_c3_4c09 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond,
layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_c88d
layer0_node7_MUX_bit_math_h_l95_c3_c88d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond,
layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_c915
layer0_node8_MUX_bit_math_h_l106_c3_c915 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_c915_cond,
layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_022e
layer0_node9_MUX_bit_math_h_l117_c3_022e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_022e_cond,
layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_1e46
layer0_node10_MUX_bit_math_h_l128_c3_1e46 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond,
layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_f127
layer0_node11_MUX_bit_math_h_l139_c3_f127 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_f127_cond,
layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_5a32
layer0_node12_MUX_bit_math_h_l150_c3_5a32 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond,
layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_d460
layer0_node13_MUX_bit_math_h_l161_c3_d460 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_d460_cond,
layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_dcd8
layer0_node14_MUX_bit_math_h_l172_c3_dcd8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond,
layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_518c
layer0_node15_MUX_bit_math_h_l183_c3_518c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_518c_cond,
layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_6fd3
layer0_node16_MUX_bit_math_h_l194_c3_6fd3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond,
layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_1d43
layer0_node17_MUX_bit_math_h_l205_c3_1d43 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond,
layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_7750
layer0_node18_MUX_bit_math_h_l216_c3_7750 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_7750_cond,
layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_3635
layer0_node19_MUX_bit_math_h_l227_c3_3635 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_3635_cond,
layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_987d
layer0_node20_MUX_bit_math_h_l238_c3_987d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_987d_cond,
layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_c689
layer0_node21_MUX_bit_math_h_l249_c3_c689 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_c689_cond,
layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_dfc1
layer0_node22_MUX_bit_math_h_l260_c3_dfc1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond,
layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_223c
layer0_node23_MUX_bit_math_h_l271_c3_223c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_223c_cond,
layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_97d4
layer0_node24_MUX_bit_math_h_l282_c3_97d4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond,
layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_62e2
layer0_node25_MUX_bit_math_h_l293_c3_62e2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond,
layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_7515
layer0_node26_MUX_bit_math_h_l304_c3_7515 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_7515_cond,
layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_072a
layer0_node27_MUX_bit_math_h_l315_c3_072a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_072a_cond,
layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_2930
layer0_node28_MUX_bit_math_h_l326_c3_2930 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_2930_cond,
layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_34fe
layer0_node29_MUX_bit_math_h_l337_c3_34fe : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond,
layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_db94
layer0_node30_MUX_bit_math_h_l348_c3_db94 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_db94_cond,
layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_2069
layer0_node31_MUX_bit_math_h_l359_c3_2069 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_2069_cond,
layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_d38e
layer1_node0_MUX_bit_math_h_l376_c3_d38e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond,
layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_c4ee
layer1_node1_MUX_bit_math_h_l387_c3_c4ee : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond,
layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_35bb
layer1_node2_MUX_bit_math_h_l398_c3_35bb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond,
layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_b612
layer1_node3_MUX_bit_math_h_l409_c3_b612 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_b612_cond,
layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_e901
layer1_node4_MUX_bit_math_h_l420_c3_e901 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_e901_cond,
layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_4588
layer1_node5_MUX_bit_math_h_l431_c3_4588 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_4588_cond,
layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_51be
layer1_node6_MUX_bit_math_h_l442_c3_51be : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_51be_cond,
layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_c1b1
layer1_node7_MUX_bit_math_h_l453_c3_c1b1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond,
layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_49e7
layer1_node8_MUX_bit_math_h_l464_c3_49e7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond,
layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_dd27
layer1_node9_MUX_bit_math_h_l475_c3_dd27 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond,
layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_cf90
layer1_node10_MUX_bit_math_h_l486_c3_cf90 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond,
layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_3a37
layer1_node11_MUX_bit_math_h_l497_c3_3a37 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond,
layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_5bfa
layer1_node12_MUX_bit_math_h_l508_c3_5bfa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond,
layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_017c
layer1_node13_MUX_bit_math_h_l519_c3_017c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_017c_cond,
layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_2c42
layer1_node14_MUX_bit_math_h_l530_c3_2c42 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond,
layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_af56
layer1_node15_MUX_bit_math_h_l541_c3_af56 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_af56_cond,
layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_cac5
layer2_node0_MUX_bit_math_h_l558_c3_cac5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond,
layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_88f5
layer2_node1_MUX_bit_math_h_l569_c3_88f5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond,
layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_818f
layer2_node2_MUX_bit_math_h_l580_c3_818f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_818f_cond,
layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_0de5
layer2_node3_MUX_bit_math_h_l591_c3_0de5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond,
layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_c424
layer2_node4_MUX_bit_math_h_l602_c3_c424 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_c424_cond,
layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_bfa4
layer2_node5_MUX_bit_math_h_l613_c3_bfa4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond,
layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_8afb
layer2_node6_MUX_bit_math_h_l624_c3_8afb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond,
layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_ff65
layer2_node7_MUX_bit_math_h_l635_c3_ff65 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond,
layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_40e0
layer3_node0_MUX_bit_math_h_l652_c3_40e0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond,
layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_62fa
layer3_node1_MUX_bit_math_h_l663_c3_62fa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond,
layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_0853
layer3_node2_MUX_bit_math_h_l674_c3_0853 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_0853_cond,
layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_76eb
layer3_node3_MUX_bit_math_h_l685_c3_76eb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond,
layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_6018
layer4_node0_MUX_bit_math_h_l702_c3_6018 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_6018_cond,
layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_0e2c
layer4_node1_MUX_bit_math_h_l713_c3_0e2c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond,
layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_d82d
layer5_node0_MUX_bit_math_h_l730_c3_d82d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond,
layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_3bde_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_95be_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue := VAR_in9;
     -- uint6_2_2[bit_math_h_l554_c10_b341] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output := uint6_2_2(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_10bb] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output := uint6_3_3(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_95be] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_95be_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_7aa8] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output := uint6_0_0(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_3bde] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_3bde_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_1_1[bit_math_h_l372_c10_5f28] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output := uint6_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_7aa8_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond := VAR_uint6_1_1_bit_math_h_l372_c10_5f28_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond := VAR_uint6_2_2_bit_math_h_l554_c10_b341_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond := VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond := VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_cond := VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond := VAR_uint6_3_3_bit_math_h_l648_c10_10bb_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_cond := VAR_uint6_4_4_bit_math_h_l698_c10_3bde_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond := VAR_uint6_4_4_bit_math_h_l698_c10_3bde_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond := VAR_uint6_5_5_bit_math_h_l726_c10_95be_return_output;
     -- layer0_node22_MUX[bit_math_h_l260_c3_dfc1] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output := layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_dcd8] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output := layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_987d] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_987d_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output := layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_d460] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_d460_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output := layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_518c] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_518c_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output := layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_223c] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_223c_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output := layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_97d4] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output := layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_4474] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_4474_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output := layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_7b99] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output := layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_7750] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_7750_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output := layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_62e2] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output := layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_1d43] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output := layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_6fd3] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output := layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_5a32] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output := layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_c689] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_c689_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output := layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_072a] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_072a_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output := layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_b38e] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output := layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_f127] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_f127_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output := layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_1e46] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output := layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_2930] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_2930_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output := layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_4c09] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output := layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_c915] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_c915_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output := layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_db94] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_db94_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output := layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_fad4] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output := layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_2069] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_2069_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output := layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_34fe] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output := layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_c88d] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output := layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_3635] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_3635_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output := layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_f58f] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output := layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_022e] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_022e_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output := layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_ffb1] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output := layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_7515] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_7515_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output := layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_7b99_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_1e46_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_f127_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_5a32_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_d460_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_dcd8_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_518c_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_6fd3_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_1d43_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_7750_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_3635_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_f58f_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_987d_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_c689_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_dfc1_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_223c_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_97d4_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_62e2_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_7515_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_072a_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_2930_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fe_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_4474_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_db94_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_2069_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_ffb1_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_b38e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_fad4_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_4c09_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_c88d_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_c915_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_022e_return_output;
     -- layer1_node1_MUX[bit_math_h_l387_c3_c4ee] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output := layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_c1b1] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output := layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_51be] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_51be_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output := layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_5bfa] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output := layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_dd27] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output := layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_d38e] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output := layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_017c] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_017c_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output := layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_af56] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_af56_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output := layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_b612] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_b612_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output := layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_2c42] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output := layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_3a37] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output := layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_35bb] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output := layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_e901] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_e901_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output := layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_49e7] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output := layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_cf90] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output := layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_4588] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_4588_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output := layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_d38e_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_cf90_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_3a37_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_5bfa_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_017c_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_2c42_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_af56_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_c4ee_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_35bb_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_b612_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_e901_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_4588_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_51be_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_c1b1_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_49e7_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_dd27_return_output;
     -- layer2_node5_MUX[bit_math_h_l613_c3_bfa4] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output := layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_0de5] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output := layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_818f] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_818f_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output := layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output;

     -- layer2_node4_MUX[bit_math_h_l602_c3_c424] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_c424_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output := layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output;

     -- layer2_node6_MUX[bit_math_h_l624_c3_8afb] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output := layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_cac5] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output := layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_88f5] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output := layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_ff65] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output := layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_cac5_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_88f5_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_818f_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_0de5_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_c424_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_bfa4_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_8afb_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_ff65_return_output;
     -- layer3_node2_MUX[bit_math_h_l674_c3_0853] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_0853_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output := layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output;

     -- layer3_node1_MUX[bit_math_h_l663_c3_62fa] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output := layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_40e0] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output := layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_76eb] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output := layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_40e0_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_62fa_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_0853_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_76eb_return_output;
     -- layer4_node0_MUX[bit_math_h_l702_c3_6018] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_6018_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output := layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output;

     -- layer4_node1_MUX[bit_math_h_l713_c3_0e2c] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output := layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_6018_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_0e2c_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_d82d] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output := layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_d82d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
