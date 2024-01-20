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
-- Submodules: 134
entity uint8_mux128_0CLK_9347d63d is
port(
 sel : in unsigned(6 downto 0);
 in0 : in unsigned(7 downto 0);
 in1 : in unsigned(7 downto 0);
 in2 : in unsigned(7 downto 0);
 in3 : in unsigned(7 downto 0);
 in4 : in unsigned(7 downto 0);
 in5 : in unsigned(7 downto 0);
 in6 : in unsigned(7 downto 0);
 in7 : in unsigned(7 downto 0);
 in8 : in unsigned(7 downto 0);
 in9 : in unsigned(7 downto 0);
 in10 : in unsigned(7 downto 0);
 in11 : in unsigned(7 downto 0);
 in12 : in unsigned(7 downto 0);
 in13 : in unsigned(7 downto 0);
 in14 : in unsigned(7 downto 0);
 in15 : in unsigned(7 downto 0);
 in16 : in unsigned(7 downto 0);
 in17 : in unsigned(7 downto 0);
 in18 : in unsigned(7 downto 0);
 in19 : in unsigned(7 downto 0);
 in20 : in unsigned(7 downto 0);
 in21 : in unsigned(7 downto 0);
 in22 : in unsigned(7 downto 0);
 in23 : in unsigned(7 downto 0);
 in24 : in unsigned(7 downto 0);
 in25 : in unsigned(7 downto 0);
 in26 : in unsigned(7 downto 0);
 in27 : in unsigned(7 downto 0);
 in28 : in unsigned(7 downto 0);
 in29 : in unsigned(7 downto 0);
 in30 : in unsigned(7 downto 0);
 in31 : in unsigned(7 downto 0);
 in32 : in unsigned(7 downto 0);
 in33 : in unsigned(7 downto 0);
 in34 : in unsigned(7 downto 0);
 in35 : in unsigned(7 downto 0);
 in36 : in unsigned(7 downto 0);
 in37 : in unsigned(7 downto 0);
 in38 : in unsigned(7 downto 0);
 in39 : in unsigned(7 downto 0);
 in40 : in unsigned(7 downto 0);
 in41 : in unsigned(7 downto 0);
 in42 : in unsigned(7 downto 0);
 in43 : in unsigned(7 downto 0);
 in44 : in unsigned(7 downto 0);
 in45 : in unsigned(7 downto 0);
 in46 : in unsigned(7 downto 0);
 in47 : in unsigned(7 downto 0);
 in48 : in unsigned(7 downto 0);
 in49 : in unsigned(7 downto 0);
 in50 : in unsigned(7 downto 0);
 in51 : in unsigned(7 downto 0);
 in52 : in unsigned(7 downto 0);
 in53 : in unsigned(7 downto 0);
 in54 : in unsigned(7 downto 0);
 in55 : in unsigned(7 downto 0);
 in56 : in unsigned(7 downto 0);
 in57 : in unsigned(7 downto 0);
 in58 : in unsigned(7 downto 0);
 in59 : in unsigned(7 downto 0);
 in60 : in unsigned(7 downto 0);
 in61 : in unsigned(7 downto 0);
 in62 : in unsigned(7 downto 0);
 in63 : in unsigned(7 downto 0);
 in64 : in unsigned(7 downto 0);
 in65 : in unsigned(7 downto 0);
 in66 : in unsigned(7 downto 0);
 in67 : in unsigned(7 downto 0);
 in68 : in unsigned(7 downto 0);
 in69 : in unsigned(7 downto 0);
 in70 : in unsigned(7 downto 0);
 in71 : in unsigned(7 downto 0);
 in72 : in unsigned(7 downto 0);
 in73 : in unsigned(7 downto 0);
 in74 : in unsigned(7 downto 0);
 in75 : in unsigned(7 downto 0);
 in76 : in unsigned(7 downto 0);
 in77 : in unsigned(7 downto 0);
 in78 : in unsigned(7 downto 0);
 in79 : in unsigned(7 downto 0);
 in80 : in unsigned(7 downto 0);
 in81 : in unsigned(7 downto 0);
 in82 : in unsigned(7 downto 0);
 in83 : in unsigned(7 downto 0);
 in84 : in unsigned(7 downto 0);
 in85 : in unsigned(7 downto 0);
 in86 : in unsigned(7 downto 0);
 in87 : in unsigned(7 downto 0);
 in88 : in unsigned(7 downto 0);
 in89 : in unsigned(7 downto 0);
 in90 : in unsigned(7 downto 0);
 in91 : in unsigned(7 downto 0);
 in92 : in unsigned(7 downto 0);
 in93 : in unsigned(7 downto 0);
 in94 : in unsigned(7 downto 0);
 in95 : in unsigned(7 downto 0);
 in96 : in unsigned(7 downto 0);
 in97 : in unsigned(7 downto 0);
 in98 : in unsigned(7 downto 0);
 in99 : in unsigned(7 downto 0);
 in100 : in unsigned(7 downto 0);
 in101 : in unsigned(7 downto 0);
 in102 : in unsigned(7 downto 0);
 in103 : in unsigned(7 downto 0);
 in104 : in unsigned(7 downto 0);
 in105 : in unsigned(7 downto 0);
 in106 : in unsigned(7 downto 0);
 in107 : in unsigned(7 downto 0);
 in108 : in unsigned(7 downto 0);
 in109 : in unsigned(7 downto 0);
 in110 : in unsigned(7 downto 0);
 in111 : in unsigned(7 downto 0);
 in112 : in unsigned(7 downto 0);
 in113 : in unsigned(7 downto 0);
 in114 : in unsigned(7 downto 0);
 in115 : in unsigned(7 downto 0);
 in116 : in unsigned(7 downto 0);
 in117 : in unsigned(7 downto 0);
 in118 : in unsigned(7 downto 0);
 in119 : in unsigned(7 downto 0);
 in120 : in unsigned(7 downto 0);
 in121 : in unsigned(7 downto 0);
 in122 : in unsigned(7 downto 0);
 in123 : in unsigned(7 downto 0);
 in124 : in unsigned(7 downto 0);
 in125 : in unsigned(7 downto 0);
 in126 : in unsigned(7 downto 0);
 in127 : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end uint8_mux128_0CLK_9347d63d;
architecture arch of uint8_mux128_0CLK_9347d63d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_b31a]
signal layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_6778]
signal layer0_node1_MUX_bit_math_h_l29_c3_6778_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_acf7]
signal layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_880b]
signal layer0_node3_MUX_bit_math_h_l51_c3_880b_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_2fcd]
signal layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_aec1]
signal layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_47d5]
signal layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_18bb]
signal layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output : unsigned(7 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_70df]
signal layer0_node8_MUX_bit_math_h_l106_c3_70df_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue : unsigned(7 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse : unsigned(7 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output : unsigned(7 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_fb2d]
signal layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue : unsigned(7 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse : unsigned(7 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output : unsigned(7 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_4bec]
signal layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue : unsigned(7 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse : unsigned(7 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output : unsigned(7 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_aff2]
signal layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue : unsigned(7 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse : unsigned(7 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output : unsigned(7 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_1323]
signal layer0_node12_MUX_bit_math_h_l150_c3_1323_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue : unsigned(7 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse : unsigned(7 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output : unsigned(7 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_f76f]
signal layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue : unsigned(7 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse : unsigned(7 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output : unsigned(7 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_121f]
signal layer0_node14_MUX_bit_math_h_l172_c3_121f_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue : unsigned(7 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse : unsigned(7 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output : unsigned(7 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_b6a9]
signal layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue : unsigned(7 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse : unsigned(7 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output : unsigned(7 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_4199]
signal layer0_node16_MUX_bit_math_h_l194_c3_4199_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue : unsigned(7 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse : unsigned(7 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output : unsigned(7 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_aeec]
signal layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue : unsigned(7 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse : unsigned(7 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output : unsigned(7 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_d627]
signal layer0_node18_MUX_bit_math_h_l216_c3_d627_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue : unsigned(7 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse : unsigned(7 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output : unsigned(7 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_f76c]
signal layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue : unsigned(7 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse : unsigned(7 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output : unsigned(7 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_5abe]
signal layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue : unsigned(7 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse : unsigned(7 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output : unsigned(7 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_5c30]
signal layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue : unsigned(7 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse : unsigned(7 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output : unsigned(7 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_9855]
signal layer0_node22_MUX_bit_math_h_l260_c3_9855_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue : unsigned(7 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse : unsigned(7 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output : unsigned(7 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_8ef6]
signal layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue : unsigned(7 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse : unsigned(7 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output : unsigned(7 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_2070]
signal layer0_node24_MUX_bit_math_h_l282_c3_2070_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue : unsigned(7 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse : unsigned(7 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output : unsigned(7 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_8af2]
signal layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue : unsigned(7 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse : unsigned(7 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output : unsigned(7 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_d769]
signal layer0_node26_MUX_bit_math_h_l304_c3_d769_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue : unsigned(7 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse : unsigned(7 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output : unsigned(7 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_dcf0]
signal layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue : unsigned(7 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse : unsigned(7 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output : unsigned(7 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_4f26]
signal layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue : unsigned(7 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse : unsigned(7 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output : unsigned(7 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_e26d]
signal layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue : unsigned(7 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse : unsigned(7 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output : unsigned(7 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_4f79]
signal layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue : unsigned(7 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse : unsigned(7 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output : unsigned(7 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_f68a]
signal layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue : unsigned(7 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse : unsigned(7 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output : unsigned(7 downto 0);

-- layer0_node32_MUX[bit_math_h_l370_c3_0dec]
signal layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond : unsigned(0 downto 0);
signal layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue : unsigned(7 downto 0);
signal layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse : unsigned(7 downto 0);
signal layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output : unsigned(7 downto 0);

-- layer0_node33_MUX[bit_math_h_l381_c3_dadd]
signal layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond : unsigned(0 downto 0);
signal layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue : unsigned(7 downto 0);
signal layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse : unsigned(7 downto 0);
signal layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output : unsigned(7 downto 0);

-- layer0_node34_MUX[bit_math_h_l392_c3_8132]
signal layer0_node34_MUX_bit_math_h_l392_c3_8132_cond : unsigned(0 downto 0);
signal layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue : unsigned(7 downto 0);
signal layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse : unsigned(7 downto 0);
signal layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output : unsigned(7 downto 0);

-- layer0_node35_MUX[bit_math_h_l403_c3_f450]
signal layer0_node35_MUX_bit_math_h_l403_c3_f450_cond : unsigned(0 downto 0);
signal layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue : unsigned(7 downto 0);
signal layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse : unsigned(7 downto 0);
signal layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output : unsigned(7 downto 0);

-- layer0_node36_MUX[bit_math_h_l414_c3_87f8]
signal layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond : unsigned(0 downto 0);
signal layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue : unsigned(7 downto 0);
signal layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse : unsigned(7 downto 0);
signal layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output : unsigned(7 downto 0);

-- layer0_node37_MUX[bit_math_h_l425_c3_5243]
signal layer0_node37_MUX_bit_math_h_l425_c3_5243_cond : unsigned(0 downto 0);
signal layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue : unsigned(7 downto 0);
signal layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse : unsigned(7 downto 0);
signal layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output : unsigned(7 downto 0);

-- layer0_node38_MUX[bit_math_h_l436_c3_d6d1]
signal layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond : unsigned(0 downto 0);
signal layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue : unsigned(7 downto 0);
signal layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse : unsigned(7 downto 0);
signal layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output : unsigned(7 downto 0);

-- layer0_node39_MUX[bit_math_h_l447_c3_0993]
signal layer0_node39_MUX_bit_math_h_l447_c3_0993_cond : unsigned(0 downto 0);
signal layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue : unsigned(7 downto 0);
signal layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse : unsigned(7 downto 0);
signal layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output : unsigned(7 downto 0);

-- layer0_node40_MUX[bit_math_h_l458_c3_335b]
signal layer0_node40_MUX_bit_math_h_l458_c3_335b_cond : unsigned(0 downto 0);
signal layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue : unsigned(7 downto 0);
signal layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse : unsigned(7 downto 0);
signal layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output : unsigned(7 downto 0);

-- layer0_node41_MUX[bit_math_h_l469_c3_7fa8]
signal layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond : unsigned(0 downto 0);
signal layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue : unsigned(7 downto 0);
signal layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse : unsigned(7 downto 0);
signal layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output : unsigned(7 downto 0);

-- layer0_node42_MUX[bit_math_h_l480_c3_f29c]
signal layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond : unsigned(0 downto 0);
signal layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue : unsigned(7 downto 0);
signal layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse : unsigned(7 downto 0);
signal layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output : unsigned(7 downto 0);

-- layer0_node43_MUX[bit_math_h_l491_c3_d993]
signal layer0_node43_MUX_bit_math_h_l491_c3_d993_cond : unsigned(0 downto 0);
signal layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue : unsigned(7 downto 0);
signal layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse : unsigned(7 downto 0);
signal layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output : unsigned(7 downto 0);

-- layer0_node44_MUX[bit_math_h_l502_c3_cc1f]
signal layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond : unsigned(0 downto 0);
signal layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue : unsigned(7 downto 0);
signal layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse : unsigned(7 downto 0);
signal layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output : unsigned(7 downto 0);

-- layer0_node45_MUX[bit_math_h_l513_c3_8b2f]
signal layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond : unsigned(0 downto 0);
signal layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue : unsigned(7 downto 0);
signal layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse : unsigned(7 downto 0);
signal layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output : unsigned(7 downto 0);

-- layer0_node46_MUX[bit_math_h_l524_c3_f9a9]
signal layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond : unsigned(0 downto 0);
signal layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue : unsigned(7 downto 0);
signal layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse : unsigned(7 downto 0);
signal layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output : unsigned(7 downto 0);

-- layer0_node47_MUX[bit_math_h_l535_c3_9554]
signal layer0_node47_MUX_bit_math_h_l535_c3_9554_cond : unsigned(0 downto 0);
signal layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue : unsigned(7 downto 0);
signal layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse : unsigned(7 downto 0);
signal layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output : unsigned(7 downto 0);

-- layer0_node48_MUX[bit_math_h_l546_c3_4e2a]
signal layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond : unsigned(0 downto 0);
signal layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue : unsigned(7 downto 0);
signal layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse : unsigned(7 downto 0);
signal layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output : unsigned(7 downto 0);

-- layer0_node49_MUX[bit_math_h_l557_c3_b62c]
signal layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond : unsigned(0 downto 0);
signal layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue : unsigned(7 downto 0);
signal layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse : unsigned(7 downto 0);
signal layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output : unsigned(7 downto 0);

-- layer0_node50_MUX[bit_math_h_l568_c3_cc21]
signal layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond : unsigned(0 downto 0);
signal layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue : unsigned(7 downto 0);
signal layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse : unsigned(7 downto 0);
signal layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output : unsigned(7 downto 0);

-- layer0_node51_MUX[bit_math_h_l579_c3_43b2]
signal layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond : unsigned(0 downto 0);
signal layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue : unsigned(7 downto 0);
signal layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse : unsigned(7 downto 0);
signal layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output : unsigned(7 downto 0);

-- layer0_node52_MUX[bit_math_h_l590_c3_e913]
signal layer0_node52_MUX_bit_math_h_l590_c3_e913_cond : unsigned(0 downto 0);
signal layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue : unsigned(7 downto 0);
signal layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse : unsigned(7 downto 0);
signal layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output : unsigned(7 downto 0);

-- layer0_node53_MUX[bit_math_h_l601_c3_a6b2]
signal layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond : unsigned(0 downto 0);
signal layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue : unsigned(7 downto 0);
signal layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse : unsigned(7 downto 0);
signal layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output : unsigned(7 downto 0);

-- layer0_node54_MUX[bit_math_h_l612_c3_a81a]
signal layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond : unsigned(0 downto 0);
signal layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue : unsigned(7 downto 0);
signal layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse : unsigned(7 downto 0);
signal layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output : unsigned(7 downto 0);

-- layer0_node55_MUX[bit_math_h_l623_c3_6b04]
signal layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond : unsigned(0 downto 0);
signal layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue : unsigned(7 downto 0);
signal layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse : unsigned(7 downto 0);
signal layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output : unsigned(7 downto 0);

-- layer0_node56_MUX[bit_math_h_l634_c3_4830]
signal layer0_node56_MUX_bit_math_h_l634_c3_4830_cond : unsigned(0 downto 0);
signal layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue : unsigned(7 downto 0);
signal layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse : unsigned(7 downto 0);
signal layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output : unsigned(7 downto 0);

-- layer0_node57_MUX[bit_math_h_l645_c3_4a10]
signal layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond : unsigned(0 downto 0);
signal layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue : unsigned(7 downto 0);
signal layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse : unsigned(7 downto 0);
signal layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output : unsigned(7 downto 0);

-- layer0_node58_MUX[bit_math_h_l656_c3_89a8]
signal layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond : unsigned(0 downto 0);
signal layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue : unsigned(7 downto 0);
signal layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse : unsigned(7 downto 0);
signal layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output : unsigned(7 downto 0);

-- layer0_node59_MUX[bit_math_h_l667_c3_8361]
signal layer0_node59_MUX_bit_math_h_l667_c3_8361_cond : unsigned(0 downto 0);
signal layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue : unsigned(7 downto 0);
signal layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse : unsigned(7 downto 0);
signal layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output : unsigned(7 downto 0);

-- layer0_node60_MUX[bit_math_h_l678_c3_2749]
signal layer0_node60_MUX_bit_math_h_l678_c3_2749_cond : unsigned(0 downto 0);
signal layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue : unsigned(7 downto 0);
signal layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse : unsigned(7 downto 0);
signal layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output : unsigned(7 downto 0);

-- layer0_node61_MUX[bit_math_h_l689_c3_c29c]
signal layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond : unsigned(0 downto 0);
signal layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue : unsigned(7 downto 0);
signal layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse : unsigned(7 downto 0);
signal layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output : unsigned(7 downto 0);

-- layer0_node62_MUX[bit_math_h_l700_c3_04cf]
signal layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond : unsigned(0 downto 0);
signal layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue : unsigned(7 downto 0);
signal layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse : unsigned(7 downto 0);
signal layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output : unsigned(7 downto 0);

-- layer0_node63_MUX[bit_math_h_l711_c3_14fe]
signal layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond : unsigned(0 downto 0);
signal layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue : unsigned(7 downto 0);
signal layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse : unsigned(7 downto 0);
signal layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l728_c3_9fc9]
signal layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l739_c3_5120]
signal layer1_node1_MUX_bit_math_h_l739_c3_5120_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l750_c3_8a9d]
signal layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l761_c3_1edb]
signal layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output : unsigned(7 downto 0);

-- layer1_node4_MUX[bit_math_h_l772_c3_3310]
signal layer1_node4_MUX_bit_math_h_l772_c3_3310_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue : unsigned(7 downto 0);
signal layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse : unsigned(7 downto 0);
signal layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output : unsigned(7 downto 0);

-- layer1_node5_MUX[bit_math_h_l783_c3_13a6]
signal layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue : unsigned(7 downto 0);
signal layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse : unsigned(7 downto 0);
signal layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output : unsigned(7 downto 0);

-- layer1_node6_MUX[bit_math_h_l794_c3_6881]
signal layer1_node6_MUX_bit_math_h_l794_c3_6881_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue : unsigned(7 downto 0);
signal layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse : unsigned(7 downto 0);
signal layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output : unsigned(7 downto 0);

-- layer1_node7_MUX[bit_math_h_l805_c3_efe0]
signal layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue : unsigned(7 downto 0);
signal layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse : unsigned(7 downto 0);
signal layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output : unsigned(7 downto 0);

-- layer1_node8_MUX[bit_math_h_l816_c3_77a8]
signal layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue : unsigned(7 downto 0);
signal layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse : unsigned(7 downto 0);
signal layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output : unsigned(7 downto 0);

-- layer1_node9_MUX[bit_math_h_l827_c3_d6b2]
signal layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue : unsigned(7 downto 0);
signal layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse : unsigned(7 downto 0);
signal layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output : unsigned(7 downto 0);

-- layer1_node10_MUX[bit_math_h_l838_c3_4167]
signal layer1_node10_MUX_bit_math_h_l838_c3_4167_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue : unsigned(7 downto 0);
signal layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse : unsigned(7 downto 0);
signal layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output : unsigned(7 downto 0);

-- layer1_node11_MUX[bit_math_h_l849_c3_437c]
signal layer1_node11_MUX_bit_math_h_l849_c3_437c_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue : unsigned(7 downto 0);
signal layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse : unsigned(7 downto 0);
signal layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output : unsigned(7 downto 0);

-- layer1_node12_MUX[bit_math_h_l860_c3_6ab1]
signal layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue : unsigned(7 downto 0);
signal layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse : unsigned(7 downto 0);
signal layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output : unsigned(7 downto 0);

-- layer1_node13_MUX[bit_math_h_l871_c3_4910]
signal layer1_node13_MUX_bit_math_h_l871_c3_4910_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue : unsigned(7 downto 0);
signal layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse : unsigned(7 downto 0);
signal layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output : unsigned(7 downto 0);

-- layer1_node14_MUX[bit_math_h_l882_c3_9e06]
signal layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue : unsigned(7 downto 0);
signal layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse : unsigned(7 downto 0);
signal layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output : unsigned(7 downto 0);

-- layer1_node15_MUX[bit_math_h_l893_c3_8bdc]
signal layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue : unsigned(7 downto 0);
signal layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse : unsigned(7 downto 0);
signal layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output : unsigned(7 downto 0);

-- layer1_node16_MUX[bit_math_h_l904_c3_f326]
signal layer1_node16_MUX_bit_math_h_l904_c3_f326_cond : unsigned(0 downto 0);
signal layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue : unsigned(7 downto 0);
signal layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse : unsigned(7 downto 0);
signal layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output : unsigned(7 downto 0);

-- layer1_node17_MUX[bit_math_h_l915_c3_2354]
signal layer1_node17_MUX_bit_math_h_l915_c3_2354_cond : unsigned(0 downto 0);
signal layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue : unsigned(7 downto 0);
signal layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse : unsigned(7 downto 0);
signal layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output : unsigned(7 downto 0);

-- layer1_node18_MUX[bit_math_h_l926_c3_bcb9]
signal layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond : unsigned(0 downto 0);
signal layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue : unsigned(7 downto 0);
signal layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse : unsigned(7 downto 0);
signal layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output : unsigned(7 downto 0);

-- layer1_node19_MUX[bit_math_h_l937_c3_a99c]
signal layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond : unsigned(0 downto 0);
signal layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue : unsigned(7 downto 0);
signal layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse : unsigned(7 downto 0);
signal layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output : unsigned(7 downto 0);

-- layer1_node20_MUX[bit_math_h_l948_c3_ea51]
signal layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond : unsigned(0 downto 0);
signal layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue : unsigned(7 downto 0);
signal layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse : unsigned(7 downto 0);
signal layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output : unsigned(7 downto 0);

-- layer1_node21_MUX[bit_math_h_l959_c3_8c51]
signal layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond : unsigned(0 downto 0);
signal layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue : unsigned(7 downto 0);
signal layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse : unsigned(7 downto 0);
signal layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output : unsigned(7 downto 0);

-- layer1_node22_MUX[bit_math_h_l970_c3_534d]
signal layer1_node22_MUX_bit_math_h_l970_c3_534d_cond : unsigned(0 downto 0);
signal layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue : unsigned(7 downto 0);
signal layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse : unsigned(7 downto 0);
signal layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output : unsigned(7 downto 0);

-- layer1_node23_MUX[bit_math_h_l981_c3_4aee]
signal layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond : unsigned(0 downto 0);
signal layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue : unsigned(7 downto 0);
signal layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse : unsigned(7 downto 0);
signal layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output : unsigned(7 downto 0);

-- layer1_node24_MUX[bit_math_h_l992_c3_818a]
signal layer1_node24_MUX_bit_math_h_l992_c3_818a_cond : unsigned(0 downto 0);
signal layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue : unsigned(7 downto 0);
signal layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse : unsigned(7 downto 0);
signal layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output : unsigned(7 downto 0);

-- layer1_node25_MUX[bit_math_h_l1003_c3_d851]
signal layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond : unsigned(0 downto 0);
signal layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue : unsigned(7 downto 0);
signal layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse : unsigned(7 downto 0);
signal layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output : unsigned(7 downto 0);

-- layer1_node26_MUX[bit_math_h_l1014_c3_3ac6]
signal layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond : unsigned(0 downto 0);
signal layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue : unsigned(7 downto 0);
signal layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse : unsigned(7 downto 0);
signal layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output : unsigned(7 downto 0);

-- layer1_node27_MUX[bit_math_h_l1025_c3_9e60]
signal layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond : unsigned(0 downto 0);
signal layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue : unsigned(7 downto 0);
signal layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse : unsigned(7 downto 0);
signal layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output : unsigned(7 downto 0);

-- layer1_node28_MUX[bit_math_h_l1036_c3_6b62]
signal layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond : unsigned(0 downto 0);
signal layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue : unsigned(7 downto 0);
signal layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse : unsigned(7 downto 0);
signal layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output : unsigned(7 downto 0);

-- layer1_node29_MUX[bit_math_h_l1047_c3_0dca]
signal layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond : unsigned(0 downto 0);
signal layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue : unsigned(7 downto 0);
signal layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse : unsigned(7 downto 0);
signal layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output : unsigned(7 downto 0);

-- layer1_node30_MUX[bit_math_h_l1058_c3_b078]
signal layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond : unsigned(0 downto 0);
signal layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue : unsigned(7 downto 0);
signal layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse : unsigned(7 downto 0);
signal layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output : unsigned(7 downto 0);

-- layer1_node31_MUX[bit_math_h_l1069_c3_3247]
signal layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond : unsigned(0 downto 0);
signal layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue : unsigned(7 downto 0);
signal layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse : unsigned(7 downto 0);
signal layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l1086_c3_4196]
signal layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l1097_c3_bc3c]
signal layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output : unsigned(7 downto 0);

-- layer2_node2_MUX[bit_math_h_l1108_c3_ab8d]
signal layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue : unsigned(7 downto 0);
signal layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse : unsigned(7 downto 0);
signal layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output : unsigned(7 downto 0);

-- layer2_node3_MUX[bit_math_h_l1119_c3_467d]
signal layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue : unsigned(7 downto 0);
signal layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse : unsigned(7 downto 0);
signal layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output : unsigned(7 downto 0);

-- layer2_node4_MUX[bit_math_h_l1130_c3_0f95]
signal layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue : unsigned(7 downto 0);
signal layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse : unsigned(7 downto 0);
signal layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output : unsigned(7 downto 0);

-- layer2_node5_MUX[bit_math_h_l1141_c3_433e]
signal layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue : unsigned(7 downto 0);
signal layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse : unsigned(7 downto 0);
signal layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output : unsigned(7 downto 0);

-- layer2_node6_MUX[bit_math_h_l1152_c3_2fc3]
signal layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue : unsigned(7 downto 0);
signal layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse : unsigned(7 downto 0);
signal layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output : unsigned(7 downto 0);

-- layer2_node7_MUX[bit_math_h_l1163_c3_7278]
signal layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue : unsigned(7 downto 0);
signal layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse : unsigned(7 downto 0);
signal layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output : unsigned(7 downto 0);

-- layer2_node8_MUX[bit_math_h_l1174_c3_371b]
signal layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond : unsigned(0 downto 0);
signal layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue : unsigned(7 downto 0);
signal layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse : unsigned(7 downto 0);
signal layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output : unsigned(7 downto 0);

-- layer2_node9_MUX[bit_math_h_l1185_c3_28c1]
signal layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond : unsigned(0 downto 0);
signal layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue : unsigned(7 downto 0);
signal layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse : unsigned(7 downto 0);
signal layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output : unsigned(7 downto 0);

-- layer2_node10_MUX[bit_math_h_l1196_c3_ceef]
signal layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond : unsigned(0 downto 0);
signal layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue : unsigned(7 downto 0);
signal layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse : unsigned(7 downto 0);
signal layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output : unsigned(7 downto 0);

-- layer2_node11_MUX[bit_math_h_l1207_c3_ca74]
signal layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond : unsigned(0 downto 0);
signal layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue : unsigned(7 downto 0);
signal layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse : unsigned(7 downto 0);
signal layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output : unsigned(7 downto 0);

-- layer2_node12_MUX[bit_math_h_l1218_c3_fb46]
signal layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond : unsigned(0 downto 0);
signal layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue : unsigned(7 downto 0);
signal layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse : unsigned(7 downto 0);
signal layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output : unsigned(7 downto 0);

-- layer2_node13_MUX[bit_math_h_l1229_c3_2a2d]
signal layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond : unsigned(0 downto 0);
signal layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue : unsigned(7 downto 0);
signal layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse : unsigned(7 downto 0);
signal layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output : unsigned(7 downto 0);

-- layer2_node14_MUX[bit_math_h_l1240_c3_cff6]
signal layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond : unsigned(0 downto 0);
signal layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue : unsigned(7 downto 0);
signal layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse : unsigned(7 downto 0);
signal layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output : unsigned(7 downto 0);

-- layer2_node15_MUX[bit_math_h_l1251_c3_99bc]
signal layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond : unsigned(0 downto 0);
signal layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue : unsigned(7 downto 0);
signal layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse : unsigned(7 downto 0);
signal layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l1268_c3_6dff]
signal layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output : unsigned(7 downto 0);

-- layer3_node1_MUX[bit_math_h_l1279_c3_fcdc]
signal layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue : unsigned(7 downto 0);
signal layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse : unsigned(7 downto 0);
signal layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output : unsigned(7 downto 0);

-- layer3_node2_MUX[bit_math_h_l1290_c3_680f]
signal layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue : unsigned(7 downto 0);
signal layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse : unsigned(7 downto 0);
signal layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output : unsigned(7 downto 0);

-- layer3_node3_MUX[bit_math_h_l1301_c3_fe30]
signal layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue : unsigned(7 downto 0);
signal layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse : unsigned(7 downto 0);
signal layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output : unsigned(7 downto 0);

-- layer3_node4_MUX[bit_math_h_l1312_c3_8b1f]
signal layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond : unsigned(0 downto 0);
signal layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue : unsigned(7 downto 0);
signal layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse : unsigned(7 downto 0);
signal layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output : unsigned(7 downto 0);

-- layer3_node5_MUX[bit_math_h_l1323_c3_5438]
signal layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond : unsigned(0 downto 0);
signal layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue : unsigned(7 downto 0);
signal layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse : unsigned(7 downto 0);
signal layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output : unsigned(7 downto 0);

-- layer3_node6_MUX[bit_math_h_l1334_c3_6997]
signal layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond : unsigned(0 downto 0);
signal layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue : unsigned(7 downto 0);
signal layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse : unsigned(7 downto 0);
signal layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output : unsigned(7 downto 0);

-- layer3_node7_MUX[bit_math_h_l1345_c3_b2c6]
signal layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond : unsigned(0 downto 0);
signal layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue : unsigned(7 downto 0);
signal layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse : unsigned(7 downto 0);
signal layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output : unsigned(7 downto 0);

-- layer4_node0_MUX[bit_math_h_l1362_c3_ecb1]
signal layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue : unsigned(7 downto 0);
signal layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse : unsigned(7 downto 0);
signal layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output : unsigned(7 downto 0);

-- layer4_node1_MUX[bit_math_h_l1373_c3_f134]
signal layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue : unsigned(7 downto 0);
signal layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse : unsigned(7 downto 0);
signal layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output : unsigned(7 downto 0);

-- layer4_node2_MUX[bit_math_h_l1384_c3_a513]
signal layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond : unsigned(0 downto 0);
signal layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue : unsigned(7 downto 0);
signal layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse : unsigned(7 downto 0);
signal layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output : unsigned(7 downto 0);

-- layer4_node3_MUX[bit_math_h_l1395_c3_7633]
signal layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond : unsigned(0 downto 0);
signal layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue : unsigned(7 downto 0);
signal layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse : unsigned(7 downto 0);
signal layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output : unsigned(7 downto 0);

-- layer5_node0_MUX[bit_math_h_l1412_c3_277a]
signal layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue : unsigned(7 downto 0);
signal layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse : unsigned(7 downto 0);
signal layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output : unsigned(7 downto 0);

-- layer5_node1_MUX[bit_math_h_l1423_c3_98a8]
signal layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond : unsigned(0 downto 0);
signal layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue : unsigned(7 downto 0);
signal layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse : unsigned(7 downto 0);
signal layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output : unsigned(7 downto 0);

-- layer6_node0_MUX[bit_math_h_l1440_c3_c512]
signal layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond : unsigned(0 downto 0);
signal layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue : unsigned(7 downto 0);
signal layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse : unsigned(7 downto 0);
signal layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output : unsigned(7 downto 0);

function uint7_0_0( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint7_1_1( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint7_2_2( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint7_3_3( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint7_4_4( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint7_5_5( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint7_6_6( x : unsigned) return unsigned is
--variable x : unsigned(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_b31a
layer0_node0_MUX_bit_math_h_l18_c3_b31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond,
layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_6778
layer0_node1_MUX_bit_math_h_l29_c3_6778 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_6778_cond,
layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_acf7
layer0_node2_MUX_bit_math_h_l40_c3_acf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond,
layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_880b
layer0_node3_MUX_bit_math_h_l51_c3_880b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_880b_cond,
layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_2fcd
layer0_node4_MUX_bit_math_h_l62_c3_2fcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond,
layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_aec1
layer0_node5_MUX_bit_math_h_l73_c3_aec1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond,
layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_47d5
layer0_node6_MUX_bit_math_h_l84_c3_47d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond,
layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_18bb
layer0_node7_MUX_bit_math_h_l95_c3_18bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond,
layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_70df
layer0_node8_MUX_bit_math_h_l106_c3_70df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_70df_cond,
layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_fb2d
layer0_node9_MUX_bit_math_h_l117_c3_fb2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond,
layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_4bec
layer0_node10_MUX_bit_math_h_l128_c3_4bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond,
layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_aff2
layer0_node11_MUX_bit_math_h_l139_c3_aff2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond,
layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_1323
layer0_node12_MUX_bit_math_h_l150_c3_1323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_1323_cond,
layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_f76f
layer0_node13_MUX_bit_math_h_l161_c3_f76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond,
layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_121f
layer0_node14_MUX_bit_math_h_l172_c3_121f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_121f_cond,
layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_b6a9
layer0_node15_MUX_bit_math_h_l183_c3_b6a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond,
layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_4199
layer0_node16_MUX_bit_math_h_l194_c3_4199 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_4199_cond,
layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_aeec
layer0_node17_MUX_bit_math_h_l205_c3_aeec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond,
layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_d627
layer0_node18_MUX_bit_math_h_l216_c3_d627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_d627_cond,
layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_f76c
layer0_node19_MUX_bit_math_h_l227_c3_f76c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond,
layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_5abe
layer0_node20_MUX_bit_math_h_l238_c3_5abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond,
layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_5c30
layer0_node21_MUX_bit_math_h_l249_c3_5c30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond,
layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_9855
layer0_node22_MUX_bit_math_h_l260_c3_9855 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_9855_cond,
layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_8ef6
layer0_node23_MUX_bit_math_h_l271_c3_8ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond,
layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_2070
layer0_node24_MUX_bit_math_h_l282_c3_2070 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_2070_cond,
layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_8af2
layer0_node25_MUX_bit_math_h_l293_c3_8af2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond,
layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_d769
layer0_node26_MUX_bit_math_h_l304_c3_d769 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_d769_cond,
layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_dcf0
layer0_node27_MUX_bit_math_h_l315_c3_dcf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond,
layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_4f26
layer0_node28_MUX_bit_math_h_l326_c3_4f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond,
layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_e26d
layer0_node29_MUX_bit_math_h_l337_c3_e26d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond,
layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_4f79
layer0_node30_MUX_bit_math_h_l348_c3_4f79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond,
layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_f68a
layer0_node31_MUX_bit_math_h_l359_c3_f68a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond,
layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output);

-- layer0_node32_MUX_bit_math_h_l370_c3_0dec
layer0_node32_MUX_bit_math_h_l370_c3_0dec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond,
layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue,
layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse,
layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output);

-- layer0_node33_MUX_bit_math_h_l381_c3_dadd
layer0_node33_MUX_bit_math_h_l381_c3_dadd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond,
layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue,
layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse,
layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output);

-- layer0_node34_MUX_bit_math_h_l392_c3_8132
layer0_node34_MUX_bit_math_h_l392_c3_8132 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node34_MUX_bit_math_h_l392_c3_8132_cond,
layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue,
layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse,
layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output);

-- layer0_node35_MUX_bit_math_h_l403_c3_f450
layer0_node35_MUX_bit_math_h_l403_c3_f450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node35_MUX_bit_math_h_l403_c3_f450_cond,
layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue,
layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse,
layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output);

-- layer0_node36_MUX_bit_math_h_l414_c3_87f8
layer0_node36_MUX_bit_math_h_l414_c3_87f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond,
layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue,
layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse,
layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output);

-- layer0_node37_MUX_bit_math_h_l425_c3_5243
layer0_node37_MUX_bit_math_h_l425_c3_5243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node37_MUX_bit_math_h_l425_c3_5243_cond,
layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue,
layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse,
layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output);

-- layer0_node38_MUX_bit_math_h_l436_c3_d6d1
layer0_node38_MUX_bit_math_h_l436_c3_d6d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond,
layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue,
layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse,
layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output);

-- layer0_node39_MUX_bit_math_h_l447_c3_0993
layer0_node39_MUX_bit_math_h_l447_c3_0993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node39_MUX_bit_math_h_l447_c3_0993_cond,
layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue,
layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse,
layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output);

-- layer0_node40_MUX_bit_math_h_l458_c3_335b
layer0_node40_MUX_bit_math_h_l458_c3_335b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node40_MUX_bit_math_h_l458_c3_335b_cond,
layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue,
layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse,
layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output);

-- layer0_node41_MUX_bit_math_h_l469_c3_7fa8
layer0_node41_MUX_bit_math_h_l469_c3_7fa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond,
layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue,
layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse,
layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output);

-- layer0_node42_MUX_bit_math_h_l480_c3_f29c
layer0_node42_MUX_bit_math_h_l480_c3_f29c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond,
layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue,
layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse,
layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output);

-- layer0_node43_MUX_bit_math_h_l491_c3_d993
layer0_node43_MUX_bit_math_h_l491_c3_d993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node43_MUX_bit_math_h_l491_c3_d993_cond,
layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue,
layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse,
layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output);

-- layer0_node44_MUX_bit_math_h_l502_c3_cc1f
layer0_node44_MUX_bit_math_h_l502_c3_cc1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond,
layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue,
layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse,
layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output);

-- layer0_node45_MUX_bit_math_h_l513_c3_8b2f
layer0_node45_MUX_bit_math_h_l513_c3_8b2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond,
layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue,
layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse,
layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output);

-- layer0_node46_MUX_bit_math_h_l524_c3_f9a9
layer0_node46_MUX_bit_math_h_l524_c3_f9a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond,
layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue,
layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse,
layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output);

-- layer0_node47_MUX_bit_math_h_l535_c3_9554
layer0_node47_MUX_bit_math_h_l535_c3_9554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node47_MUX_bit_math_h_l535_c3_9554_cond,
layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue,
layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse,
layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output);

-- layer0_node48_MUX_bit_math_h_l546_c3_4e2a
layer0_node48_MUX_bit_math_h_l546_c3_4e2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond,
layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue,
layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse,
layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output);

-- layer0_node49_MUX_bit_math_h_l557_c3_b62c
layer0_node49_MUX_bit_math_h_l557_c3_b62c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond,
layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue,
layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse,
layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output);

-- layer0_node50_MUX_bit_math_h_l568_c3_cc21
layer0_node50_MUX_bit_math_h_l568_c3_cc21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond,
layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue,
layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse,
layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output);

-- layer0_node51_MUX_bit_math_h_l579_c3_43b2
layer0_node51_MUX_bit_math_h_l579_c3_43b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond,
layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue,
layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse,
layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output);

-- layer0_node52_MUX_bit_math_h_l590_c3_e913
layer0_node52_MUX_bit_math_h_l590_c3_e913 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node52_MUX_bit_math_h_l590_c3_e913_cond,
layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue,
layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse,
layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output);

-- layer0_node53_MUX_bit_math_h_l601_c3_a6b2
layer0_node53_MUX_bit_math_h_l601_c3_a6b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond,
layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue,
layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse,
layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output);

-- layer0_node54_MUX_bit_math_h_l612_c3_a81a
layer0_node54_MUX_bit_math_h_l612_c3_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond,
layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue,
layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse,
layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output);

-- layer0_node55_MUX_bit_math_h_l623_c3_6b04
layer0_node55_MUX_bit_math_h_l623_c3_6b04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond,
layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue,
layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse,
layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output);

-- layer0_node56_MUX_bit_math_h_l634_c3_4830
layer0_node56_MUX_bit_math_h_l634_c3_4830 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node56_MUX_bit_math_h_l634_c3_4830_cond,
layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue,
layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse,
layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output);

-- layer0_node57_MUX_bit_math_h_l645_c3_4a10
layer0_node57_MUX_bit_math_h_l645_c3_4a10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond,
layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue,
layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse,
layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output);

-- layer0_node58_MUX_bit_math_h_l656_c3_89a8
layer0_node58_MUX_bit_math_h_l656_c3_89a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond,
layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue,
layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse,
layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output);

-- layer0_node59_MUX_bit_math_h_l667_c3_8361
layer0_node59_MUX_bit_math_h_l667_c3_8361 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node59_MUX_bit_math_h_l667_c3_8361_cond,
layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue,
layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse,
layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output);

-- layer0_node60_MUX_bit_math_h_l678_c3_2749
layer0_node60_MUX_bit_math_h_l678_c3_2749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node60_MUX_bit_math_h_l678_c3_2749_cond,
layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue,
layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse,
layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output);

-- layer0_node61_MUX_bit_math_h_l689_c3_c29c
layer0_node61_MUX_bit_math_h_l689_c3_c29c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond,
layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue,
layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse,
layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output);

-- layer0_node62_MUX_bit_math_h_l700_c3_04cf
layer0_node62_MUX_bit_math_h_l700_c3_04cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond,
layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue,
layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse,
layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output);

-- layer0_node63_MUX_bit_math_h_l711_c3_14fe
layer0_node63_MUX_bit_math_h_l711_c3_14fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond,
layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue,
layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse,
layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output);

-- layer1_node0_MUX_bit_math_h_l728_c3_9fc9
layer1_node0_MUX_bit_math_h_l728_c3_9fc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond,
layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue,
layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse,
layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output);

-- layer1_node1_MUX_bit_math_h_l739_c3_5120
layer1_node1_MUX_bit_math_h_l739_c3_5120 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l739_c3_5120_cond,
layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue,
layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse,
layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output);

-- layer1_node2_MUX_bit_math_h_l750_c3_8a9d
layer1_node2_MUX_bit_math_h_l750_c3_8a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond,
layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue,
layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse,
layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output);

-- layer1_node3_MUX_bit_math_h_l761_c3_1edb
layer1_node3_MUX_bit_math_h_l761_c3_1edb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond,
layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue,
layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse,
layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output);

-- layer1_node4_MUX_bit_math_h_l772_c3_3310
layer1_node4_MUX_bit_math_h_l772_c3_3310 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l772_c3_3310_cond,
layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue,
layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse,
layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output);

-- layer1_node5_MUX_bit_math_h_l783_c3_13a6
layer1_node5_MUX_bit_math_h_l783_c3_13a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond,
layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue,
layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse,
layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output);

-- layer1_node6_MUX_bit_math_h_l794_c3_6881
layer1_node6_MUX_bit_math_h_l794_c3_6881 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l794_c3_6881_cond,
layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue,
layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse,
layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output);

-- layer1_node7_MUX_bit_math_h_l805_c3_efe0
layer1_node7_MUX_bit_math_h_l805_c3_efe0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond,
layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue,
layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse,
layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output);

-- layer1_node8_MUX_bit_math_h_l816_c3_77a8
layer1_node8_MUX_bit_math_h_l816_c3_77a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond,
layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue,
layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse,
layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output);

-- layer1_node9_MUX_bit_math_h_l827_c3_d6b2
layer1_node9_MUX_bit_math_h_l827_c3_d6b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond,
layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue,
layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse,
layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output);

-- layer1_node10_MUX_bit_math_h_l838_c3_4167
layer1_node10_MUX_bit_math_h_l838_c3_4167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l838_c3_4167_cond,
layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue,
layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse,
layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output);

-- layer1_node11_MUX_bit_math_h_l849_c3_437c
layer1_node11_MUX_bit_math_h_l849_c3_437c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l849_c3_437c_cond,
layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue,
layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse,
layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output);

-- layer1_node12_MUX_bit_math_h_l860_c3_6ab1
layer1_node12_MUX_bit_math_h_l860_c3_6ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond,
layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue,
layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse,
layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output);

-- layer1_node13_MUX_bit_math_h_l871_c3_4910
layer1_node13_MUX_bit_math_h_l871_c3_4910 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l871_c3_4910_cond,
layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue,
layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse,
layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output);

-- layer1_node14_MUX_bit_math_h_l882_c3_9e06
layer1_node14_MUX_bit_math_h_l882_c3_9e06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond,
layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue,
layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse,
layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output);

-- layer1_node15_MUX_bit_math_h_l893_c3_8bdc
layer1_node15_MUX_bit_math_h_l893_c3_8bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond,
layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue,
layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse,
layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output);

-- layer1_node16_MUX_bit_math_h_l904_c3_f326
layer1_node16_MUX_bit_math_h_l904_c3_f326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node16_MUX_bit_math_h_l904_c3_f326_cond,
layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue,
layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse,
layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output);

-- layer1_node17_MUX_bit_math_h_l915_c3_2354
layer1_node17_MUX_bit_math_h_l915_c3_2354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node17_MUX_bit_math_h_l915_c3_2354_cond,
layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue,
layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse,
layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output);

-- layer1_node18_MUX_bit_math_h_l926_c3_bcb9
layer1_node18_MUX_bit_math_h_l926_c3_bcb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond,
layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue,
layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse,
layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output);

-- layer1_node19_MUX_bit_math_h_l937_c3_a99c
layer1_node19_MUX_bit_math_h_l937_c3_a99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond,
layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue,
layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse,
layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output);

-- layer1_node20_MUX_bit_math_h_l948_c3_ea51
layer1_node20_MUX_bit_math_h_l948_c3_ea51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond,
layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue,
layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse,
layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output);

-- layer1_node21_MUX_bit_math_h_l959_c3_8c51
layer1_node21_MUX_bit_math_h_l959_c3_8c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond,
layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue,
layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse,
layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output);

-- layer1_node22_MUX_bit_math_h_l970_c3_534d
layer1_node22_MUX_bit_math_h_l970_c3_534d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node22_MUX_bit_math_h_l970_c3_534d_cond,
layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue,
layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse,
layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output);

-- layer1_node23_MUX_bit_math_h_l981_c3_4aee
layer1_node23_MUX_bit_math_h_l981_c3_4aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond,
layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue,
layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse,
layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output);

-- layer1_node24_MUX_bit_math_h_l992_c3_818a
layer1_node24_MUX_bit_math_h_l992_c3_818a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node24_MUX_bit_math_h_l992_c3_818a_cond,
layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue,
layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse,
layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output);

-- layer1_node25_MUX_bit_math_h_l1003_c3_d851
layer1_node25_MUX_bit_math_h_l1003_c3_d851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond,
layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue,
layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse,
layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output);

-- layer1_node26_MUX_bit_math_h_l1014_c3_3ac6
layer1_node26_MUX_bit_math_h_l1014_c3_3ac6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond,
layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue,
layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse,
layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output);

-- layer1_node27_MUX_bit_math_h_l1025_c3_9e60
layer1_node27_MUX_bit_math_h_l1025_c3_9e60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond,
layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue,
layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse,
layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output);

-- layer1_node28_MUX_bit_math_h_l1036_c3_6b62
layer1_node28_MUX_bit_math_h_l1036_c3_6b62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond,
layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue,
layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse,
layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output);

-- layer1_node29_MUX_bit_math_h_l1047_c3_0dca
layer1_node29_MUX_bit_math_h_l1047_c3_0dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond,
layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue,
layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse,
layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output);

-- layer1_node30_MUX_bit_math_h_l1058_c3_b078
layer1_node30_MUX_bit_math_h_l1058_c3_b078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond,
layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue,
layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse,
layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output);

-- layer1_node31_MUX_bit_math_h_l1069_c3_3247
layer1_node31_MUX_bit_math_h_l1069_c3_3247 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond,
layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue,
layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse,
layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output);

-- layer2_node0_MUX_bit_math_h_l1086_c3_4196
layer2_node0_MUX_bit_math_h_l1086_c3_4196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond,
layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue,
layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse,
layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output);

-- layer2_node1_MUX_bit_math_h_l1097_c3_bc3c
layer2_node1_MUX_bit_math_h_l1097_c3_bc3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond,
layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue,
layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse,
layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output);

-- layer2_node2_MUX_bit_math_h_l1108_c3_ab8d
layer2_node2_MUX_bit_math_h_l1108_c3_ab8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond,
layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue,
layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse,
layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output);

-- layer2_node3_MUX_bit_math_h_l1119_c3_467d
layer2_node3_MUX_bit_math_h_l1119_c3_467d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond,
layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue,
layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse,
layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output);

-- layer2_node4_MUX_bit_math_h_l1130_c3_0f95
layer2_node4_MUX_bit_math_h_l1130_c3_0f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond,
layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue,
layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse,
layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output);

-- layer2_node5_MUX_bit_math_h_l1141_c3_433e
layer2_node5_MUX_bit_math_h_l1141_c3_433e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond,
layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue,
layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse,
layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output);

-- layer2_node6_MUX_bit_math_h_l1152_c3_2fc3
layer2_node6_MUX_bit_math_h_l1152_c3_2fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond,
layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue,
layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse,
layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output);

-- layer2_node7_MUX_bit_math_h_l1163_c3_7278
layer2_node7_MUX_bit_math_h_l1163_c3_7278 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond,
layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue,
layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse,
layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output);

-- layer2_node8_MUX_bit_math_h_l1174_c3_371b
layer2_node8_MUX_bit_math_h_l1174_c3_371b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond,
layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue,
layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse,
layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output);

-- layer2_node9_MUX_bit_math_h_l1185_c3_28c1
layer2_node9_MUX_bit_math_h_l1185_c3_28c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond,
layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue,
layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse,
layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output);

-- layer2_node10_MUX_bit_math_h_l1196_c3_ceef
layer2_node10_MUX_bit_math_h_l1196_c3_ceef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond,
layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue,
layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse,
layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output);

-- layer2_node11_MUX_bit_math_h_l1207_c3_ca74
layer2_node11_MUX_bit_math_h_l1207_c3_ca74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond,
layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue,
layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse,
layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output);

-- layer2_node12_MUX_bit_math_h_l1218_c3_fb46
layer2_node12_MUX_bit_math_h_l1218_c3_fb46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond,
layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue,
layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse,
layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output);

-- layer2_node13_MUX_bit_math_h_l1229_c3_2a2d
layer2_node13_MUX_bit_math_h_l1229_c3_2a2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond,
layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue,
layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse,
layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output);

-- layer2_node14_MUX_bit_math_h_l1240_c3_cff6
layer2_node14_MUX_bit_math_h_l1240_c3_cff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond,
layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue,
layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse,
layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output);

-- layer2_node15_MUX_bit_math_h_l1251_c3_99bc
layer2_node15_MUX_bit_math_h_l1251_c3_99bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond,
layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue,
layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse,
layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output);

-- layer3_node0_MUX_bit_math_h_l1268_c3_6dff
layer3_node0_MUX_bit_math_h_l1268_c3_6dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond,
layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue,
layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse,
layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output);

-- layer3_node1_MUX_bit_math_h_l1279_c3_fcdc
layer3_node1_MUX_bit_math_h_l1279_c3_fcdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond,
layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue,
layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse,
layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output);

-- layer3_node2_MUX_bit_math_h_l1290_c3_680f
layer3_node2_MUX_bit_math_h_l1290_c3_680f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond,
layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue,
layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse,
layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output);

-- layer3_node3_MUX_bit_math_h_l1301_c3_fe30
layer3_node3_MUX_bit_math_h_l1301_c3_fe30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond,
layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue,
layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse,
layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output);

-- layer3_node4_MUX_bit_math_h_l1312_c3_8b1f
layer3_node4_MUX_bit_math_h_l1312_c3_8b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond,
layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue,
layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse,
layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output);

-- layer3_node5_MUX_bit_math_h_l1323_c3_5438
layer3_node5_MUX_bit_math_h_l1323_c3_5438 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond,
layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue,
layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse,
layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output);

-- layer3_node6_MUX_bit_math_h_l1334_c3_6997
layer3_node6_MUX_bit_math_h_l1334_c3_6997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond,
layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue,
layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse,
layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output);

-- layer3_node7_MUX_bit_math_h_l1345_c3_b2c6
layer3_node7_MUX_bit_math_h_l1345_c3_b2c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond,
layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue,
layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse,
layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output);

-- layer4_node0_MUX_bit_math_h_l1362_c3_ecb1
layer4_node0_MUX_bit_math_h_l1362_c3_ecb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond,
layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue,
layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse,
layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output);

-- layer4_node1_MUX_bit_math_h_l1373_c3_f134
layer4_node1_MUX_bit_math_h_l1373_c3_f134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond,
layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue,
layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse,
layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output);

-- layer4_node2_MUX_bit_math_h_l1384_c3_a513
layer4_node2_MUX_bit_math_h_l1384_c3_a513 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond,
layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue,
layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse,
layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output);

-- layer4_node3_MUX_bit_math_h_l1395_c3_7633
layer4_node3_MUX_bit_math_h_l1395_c3_7633 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond,
layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue,
layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse,
layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output);

-- layer5_node0_MUX_bit_math_h_l1412_c3_277a
layer5_node0_MUX_bit_math_h_l1412_c3_277a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond,
layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue,
layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse,
layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output);

-- layer5_node1_MUX_bit_math_h_l1423_c3_98a8
layer5_node1_MUX_bit_math_h_l1423_c3_98a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond,
layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue,
layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse,
layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output);

-- layer6_node0_MUX_bit_math_h_l1440_c3_c512
layer6_node0_MUX_bit_math_h_l1440_c3_c512 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond,
layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue,
layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse,
layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output);



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
 in64,
 in65,
 in66,
 in67,
 in68,
 in69,
 in70,
 in71,
 in72,
 in73,
 in74,
 in75,
 in76,
 in77,
 in78,
 in79,
 in80,
 in81,
 in82,
 in83,
 in84,
 in85,
 in86,
 in87,
 in88,
 in89,
 in90,
 in91,
 in92,
 in93,
 in94,
 in95,
 in96,
 in97,
 in98,
 in99,
 in100,
 in101,
 in102,
 in103,
 in104,
 in105,
 in106,
 in107,
 in108,
 in109,
 in110,
 in111,
 in112,
 in113,
 in114,
 in115,
 in116,
 in117,
 in118,
 in119,
 in120,
 in121,
 in122,
 in123,
 in124,
 in125,
 in126,
 in127,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output,
 layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output,
 layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output,
 layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output,
 layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output,
 layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output,
 layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output,
 layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output,
 layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output,
 layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output,
 layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output,
 layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output,
 layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output,
 layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output,
 layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output,
 layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output,
 layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output,
 layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output,
 layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output,
 layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output,
 layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output,
 layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output,
 layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output,
 layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output,
 layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output,
 layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output,
 layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output,
 layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output,
 layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output,
 layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output,
 layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output,
 layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output,
 layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output,
 layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output,
 layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output,
 layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output,
 layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output,
 layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output,
 layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output,
 layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output,
 layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output,
 layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output,
 layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output,
 layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output,
 layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output,
 layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output,
 layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output,
 layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output,
 layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output,
 layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output,
 layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output,
 layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output,
 layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output,
 layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output,
 layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output,
 layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output,
 layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output,
 layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output,
 layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output,
 layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output,
 layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output,
 layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output,
 layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output,
 layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output,
 layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output,
 layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output,
 layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output,
 layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output,
 layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output,
 layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output,
 layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output,
 layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output,
 layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output,
 layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output,
 layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output,
 layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output,
 layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output,
 layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output,
 layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output,
 layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output,
 layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output,
 layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output,
 layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output,
 layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output,
 layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output,
 layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output,
 layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output,
 layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output,
 layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output,
 layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output,
 layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output,
 layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output,
 layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output,
 layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output,
 layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output,
 layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_sel : unsigned(6 downto 0);
 variable VAR_in0 : unsigned(7 downto 0);
 variable VAR_in1 : unsigned(7 downto 0);
 variable VAR_in2 : unsigned(7 downto 0);
 variable VAR_in3 : unsigned(7 downto 0);
 variable VAR_in4 : unsigned(7 downto 0);
 variable VAR_in5 : unsigned(7 downto 0);
 variable VAR_in6 : unsigned(7 downto 0);
 variable VAR_in7 : unsigned(7 downto 0);
 variable VAR_in8 : unsigned(7 downto 0);
 variable VAR_in9 : unsigned(7 downto 0);
 variable VAR_in10 : unsigned(7 downto 0);
 variable VAR_in11 : unsigned(7 downto 0);
 variable VAR_in12 : unsigned(7 downto 0);
 variable VAR_in13 : unsigned(7 downto 0);
 variable VAR_in14 : unsigned(7 downto 0);
 variable VAR_in15 : unsigned(7 downto 0);
 variable VAR_in16 : unsigned(7 downto 0);
 variable VAR_in17 : unsigned(7 downto 0);
 variable VAR_in18 : unsigned(7 downto 0);
 variable VAR_in19 : unsigned(7 downto 0);
 variable VAR_in20 : unsigned(7 downto 0);
 variable VAR_in21 : unsigned(7 downto 0);
 variable VAR_in22 : unsigned(7 downto 0);
 variable VAR_in23 : unsigned(7 downto 0);
 variable VAR_in24 : unsigned(7 downto 0);
 variable VAR_in25 : unsigned(7 downto 0);
 variable VAR_in26 : unsigned(7 downto 0);
 variable VAR_in27 : unsigned(7 downto 0);
 variable VAR_in28 : unsigned(7 downto 0);
 variable VAR_in29 : unsigned(7 downto 0);
 variable VAR_in30 : unsigned(7 downto 0);
 variable VAR_in31 : unsigned(7 downto 0);
 variable VAR_in32 : unsigned(7 downto 0);
 variable VAR_in33 : unsigned(7 downto 0);
 variable VAR_in34 : unsigned(7 downto 0);
 variable VAR_in35 : unsigned(7 downto 0);
 variable VAR_in36 : unsigned(7 downto 0);
 variable VAR_in37 : unsigned(7 downto 0);
 variable VAR_in38 : unsigned(7 downto 0);
 variable VAR_in39 : unsigned(7 downto 0);
 variable VAR_in40 : unsigned(7 downto 0);
 variable VAR_in41 : unsigned(7 downto 0);
 variable VAR_in42 : unsigned(7 downto 0);
 variable VAR_in43 : unsigned(7 downto 0);
 variable VAR_in44 : unsigned(7 downto 0);
 variable VAR_in45 : unsigned(7 downto 0);
 variable VAR_in46 : unsigned(7 downto 0);
 variable VAR_in47 : unsigned(7 downto 0);
 variable VAR_in48 : unsigned(7 downto 0);
 variable VAR_in49 : unsigned(7 downto 0);
 variable VAR_in50 : unsigned(7 downto 0);
 variable VAR_in51 : unsigned(7 downto 0);
 variable VAR_in52 : unsigned(7 downto 0);
 variable VAR_in53 : unsigned(7 downto 0);
 variable VAR_in54 : unsigned(7 downto 0);
 variable VAR_in55 : unsigned(7 downto 0);
 variable VAR_in56 : unsigned(7 downto 0);
 variable VAR_in57 : unsigned(7 downto 0);
 variable VAR_in58 : unsigned(7 downto 0);
 variable VAR_in59 : unsigned(7 downto 0);
 variable VAR_in60 : unsigned(7 downto 0);
 variable VAR_in61 : unsigned(7 downto 0);
 variable VAR_in62 : unsigned(7 downto 0);
 variable VAR_in63 : unsigned(7 downto 0);
 variable VAR_in64 : unsigned(7 downto 0);
 variable VAR_in65 : unsigned(7 downto 0);
 variable VAR_in66 : unsigned(7 downto 0);
 variable VAR_in67 : unsigned(7 downto 0);
 variable VAR_in68 : unsigned(7 downto 0);
 variable VAR_in69 : unsigned(7 downto 0);
 variable VAR_in70 : unsigned(7 downto 0);
 variable VAR_in71 : unsigned(7 downto 0);
 variable VAR_in72 : unsigned(7 downto 0);
 variable VAR_in73 : unsigned(7 downto 0);
 variable VAR_in74 : unsigned(7 downto 0);
 variable VAR_in75 : unsigned(7 downto 0);
 variable VAR_in76 : unsigned(7 downto 0);
 variable VAR_in77 : unsigned(7 downto 0);
 variable VAR_in78 : unsigned(7 downto 0);
 variable VAR_in79 : unsigned(7 downto 0);
 variable VAR_in80 : unsigned(7 downto 0);
 variable VAR_in81 : unsigned(7 downto 0);
 variable VAR_in82 : unsigned(7 downto 0);
 variable VAR_in83 : unsigned(7 downto 0);
 variable VAR_in84 : unsigned(7 downto 0);
 variable VAR_in85 : unsigned(7 downto 0);
 variable VAR_in86 : unsigned(7 downto 0);
 variable VAR_in87 : unsigned(7 downto 0);
 variable VAR_in88 : unsigned(7 downto 0);
 variable VAR_in89 : unsigned(7 downto 0);
 variable VAR_in90 : unsigned(7 downto 0);
 variable VAR_in91 : unsigned(7 downto 0);
 variable VAR_in92 : unsigned(7 downto 0);
 variable VAR_in93 : unsigned(7 downto 0);
 variable VAR_in94 : unsigned(7 downto 0);
 variable VAR_in95 : unsigned(7 downto 0);
 variable VAR_in96 : unsigned(7 downto 0);
 variable VAR_in97 : unsigned(7 downto 0);
 variable VAR_in98 : unsigned(7 downto 0);
 variable VAR_in99 : unsigned(7 downto 0);
 variable VAR_in100 : unsigned(7 downto 0);
 variable VAR_in101 : unsigned(7 downto 0);
 variable VAR_in102 : unsigned(7 downto 0);
 variable VAR_in103 : unsigned(7 downto 0);
 variable VAR_in104 : unsigned(7 downto 0);
 variable VAR_in105 : unsigned(7 downto 0);
 variable VAR_in106 : unsigned(7 downto 0);
 variable VAR_in107 : unsigned(7 downto 0);
 variable VAR_in108 : unsigned(7 downto 0);
 variable VAR_in109 : unsigned(7 downto 0);
 variable VAR_in110 : unsigned(7 downto 0);
 variable VAR_in111 : unsigned(7 downto 0);
 variable VAR_in112 : unsigned(7 downto 0);
 variable VAR_in113 : unsigned(7 downto 0);
 variable VAR_in114 : unsigned(7 downto 0);
 variable VAR_in115 : unsigned(7 downto 0);
 variable VAR_in116 : unsigned(7 downto 0);
 variable VAR_in117 : unsigned(7 downto 0);
 variable VAR_in118 : unsigned(7 downto 0);
 variable VAR_in119 : unsigned(7 downto 0);
 variable VAR_in120 : unsigned(7 downto 0);
 variable VAR_in121 : unsigned(7 downto 0);
 variable VAR_in122 : unsigned(7 downto 0);
 variable VAR_in123 : unsigned(7 downto 0);
 variable VAR_in124 : unsigned(7 downto 0);
 variable VAR_in125 : unsigned(7 downto 0);
 variable VAR_in126 : unsigned(7 downto 0);
 variable VAR_in127 : unsigned(7 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(7 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(7 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(7 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(7 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(7 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(7 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(7 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(7 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(7 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(7 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(7 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(7 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(7 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(7 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(7 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(7 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(7 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(7 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(7 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(7 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(7 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(7 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(7 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(7 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node32 : unsigned(7 downto 0);
 variable VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond : unsigned(0 downto 0);
 variable VAR_layer0_node33 : unsigned(7 downto 0);
 variable VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node34 : unsigned(7 downto 0);
 variable VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_cond : unsigned(0 downto 0);
 variable VAR_layer0_node35 : unsigned(7 downto 0);
 variable VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_cond : unsigned(0 downto 0);
 variable VAR_layer0_node36 : unsigned(7 downto 0);
 variable VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node37 : unsigned(7 downto 0);
 variable VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_cond : unsigned(0 downto 0);
 variable VAR_layer0_node38 : unsigned(7 downto 0);
 variable VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node39 : unsigned(7 downto 0);
 variable VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_cond : unsigned(0 downto 0);
 variable VAR_layer0_node40 : unsigned(7 downto 0);
 variable VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node41 : unsigned(7 downto 0);
 variable VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node42 : unsigned(7 downto 0);
 variable VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node43 : unsigned(7 downto 0);
 variable VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_cond : unsigned(0 downto 0);
 variable VAR_layer0_node44 : unsigned(7 downto 0);
 variable VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node45 : unsigned(7 downto 0);
 variable VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node46 : unsigned(7 downto 0);
 variable VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node47 : unsigned(7 downto 0);
 variable VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_cond : unsigned(0 downto 0);
 variable VAR_layer0_node48 : unsigned(7 downto 0);
 variable VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node49 : unsigned(7 downto 0);
 variable VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node50 : unsigned(7 downto 0);
 variable VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond : unsigned(0 downto 0);
 variable VAR_layer0_node51 : unsigned(7 downto 0);
 variable VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node52 : unsigned(7 downto 0);
 variable VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_cond : unsigned(0 downto 0);
 variable VAR_layer0_node53 : unsigned(7 downto 0);
 variable VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node54 : unsigned(7 downto 0);
 variable VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node55 : unsigned(7 downto 0);
 variable VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond : unsigned(0 downto 0);
 variable VAR_layer0_node56 : unsigned(7 downto 0);
 variable VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_cond : unsigned(0 downto 0);
 variable VAR_layer0_node57 : unsigned(7 downto 0);
 variable VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond : unsigned(0 downto 0);
 variable VAR_layer0_node58 : unsigned(7 downto 0);
 variable VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node59 : unsigned(7 downto 0);
 variable VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_cond : unsigned(0 downto 0);
 variable VAR_layer0_node60 : unsigned(7 downto 0);
 variable VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_cond : unsigned(0 downto 0);
 variable VAR_layer0_node61 : unsigned(7 downto 0);
 variable VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node62 : unsigned(7 downto 0);
 variable VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node63 : unsigned(7 downto 0);
 variable VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(7 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(7 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(7 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(7 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(7 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(7 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(7 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(7 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(7 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(7 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(7 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(7 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond : unsigned(0 downto 0);
 variable VAR_layer1_node16 : unsigned(7 downto 0);
 variable VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_cond : unsigned(0 downto 0);
 variable VAR_layer1_node17 : unsigned(7 downto 0);
 variable VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_cond : unsigned(0 downto 0);
 variable VAR_layer1_node18 : unsigned(7 downto 0);
 variable VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node19 : unsigned(7 downto 0);
 variable VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node20 : unsigned(7 downto 0);
 variable VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond : unsigned(0 downto 0);
 variable VAR_layer1_node21 : unsigned(7 downto 0);
 variable VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond : unsigned(0 downto 0);
 variable VAR_layer1_node22 : unsigned(7 downto 0);
 variable VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node23 : unsigned(7 downto 0);
 variable VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond : unsigned(0 downto 0);
 variable VAR_layer1_node24 : unsigned(7 downto 0);
 variable VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node25 : unsigned(7 downto 0);
 variable VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond : unsigned(0 downto 0);
 variable VAR_layer1_node26 : unsigned(7 downto 0);
 variable VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node27 : unsigned(7 downto 0);
 variable VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond : unsigned(0 downto 0);
 variable VAR_layer1_node28 : unsigned(7 downto 0);
 variable VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond : unsigned(0 downto 0);
 variable VAR_layer1_node29 : unsigned(7 downto 0);
 variable VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond : unsigned(0 downto 0);
 variable VAR_layer1_node30 : unsigned(7 downto 0);
 variable VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond : unsigned(0 downto 0);
 variable VAR_layer1_node31 : unsigned(7 downto 0);
 variable VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(7 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(7 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(7 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(7 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(7 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(7 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond : unsigned(0 downto 0);
 variable VAR_layer2_node8 : unsigned(7 downto 0);
 variable VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node9 : unsigned(7 downto 0);
 variable VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond : unsigned(0 downto 0);
 variable VAR_layer2_node10 : unsigned(7 downto 0);
 variable VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond : unsigned(0 downto 0);
 variable VAR_layer2_node11 : unsigned(7 downto 0);
 variable VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond : unsigned(0 downto 0);
 variable VAR_layer2_node12 : unsigned(7 downto 0);
 variable VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond : unsigned(0 downto 0);
 variable VAR_layer2_node13 : unsigned(7 downto 0);
 variable VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond : unsigned(0 downto 0);
 variable VAR_layer2_node14 : unsigned(7 downto 0);
 variable VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond : unsigned(0 downto 0);
 variable VAR_layer2_node15 : unsigned(7 downto 0);
 variable VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(7 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(7 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(7 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond : unsigned(0 downto 0);
 variable VAR_layer3_node4 : unsigned(7 downto 0);
 variable VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond : unsigned(0 downto 0);
 variable VAR_layer3_node5 : unsigned(7 downto 0);
 variable VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond : unsigned(0 downto 0);
 variable VAR_layer3_node6 : unsigned(7 downto 0);
 variable VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond : unsigned(0 downto 0);
 variable VAR_layer3_node7 : unsigned(7 downto 0);
 variable VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(7 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue : unsigned(7 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse : unsigned(7 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output : unsigned(7 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(7 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue : unsigned(7 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse : unsigned(7 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output : unsigned(7 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond : unsigned(0 downto 0);
 variable VAR_layer4_node2 : unsigned(7 downto 0);
 variable VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue : unsigned(7 downto 0);
 variable VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse : unsigned(7 downto 0);
 variable VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output : unsigned(7 downto 0);
 variable VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond : unsigned(0 downto 0);
 variable VAR_layer4_node3 : unsigned(7 downto 0);
 variable VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue : unsigned(7 downto 0);
 variable VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse : unsigned(7 downto 0);
 variable VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output : unsigned(7 downto 0);
 variable VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint7_5_5_bit_math_h_l1408_c10_5b08_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(7 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue : unsigned(7 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse : unsigned(7 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output : unsigned(7 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond : unsigned(0 downto 0);
 variable VAR_layer5_node1 : unsigned(7 downto 0);
 variable VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue : unsigned(7 downto 0);
 variable VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse : unsigned(7 downto 0);
 variable VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output : unsigned(7 downto 0);
 variable VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond : unsigned(0 downto 0);
 variable VAR_sel6 : unsigned(0 downto 0);
 variable VAR_uint7_6_6_bit_math_h_l1436_c10_a5b4_return_output : unsigned(0 downto 0);
 variable VAR_layer6_node0 : unsigned(7 downto 0);
 variable VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue : unsigned(7 downto 0);
 variable VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse : unsigned(7 downto 0);
 variable VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output : unsigned(7 downto 0);
 variable VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond : unsigned(0 downto 0);
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
     VAR_in64 := in64;
     VAR_in65 := in65;
     VAR_in66 := in66;
     VAR_in67 := in67;
     VAR_in68 := in68;
     VAR_in69 := in69;
     VAR_in70 := in70;
     VAR_in71 := in71;
     VAR_in72 := in72;
     VAR_in73 := in73;
     VAR_in74 := in74;
     VAR_in75 := in75;
     VAR_in76 := in76;
     VAR_in77 := in77;
     VAR_in78 := in78;
     VAR_in79 := in79;
     VAR_in80 := in80;
     VAR_in81 := in81;
     VAR_in82 := in82;
     VAR_in83 := in83;
     VAR_in84 := in84;
     VAR_in85 := in85;
     VAR_in86 := in86;
     VAR_in87 := in87;
     VAR_in88 := in88;
     VAR_in89 := in89;
     VAR_in90 := in90;
     VAR_in91 := in91;
     VAR_in92 := in92;
     VAR_in93 := in93;
     VAR_in94 := in94;
     VAR_in95 := in95;
     VAR_in96 := in96;
     VAR_in97 := in97;
     VAR_in98 := in98;
     VAR_in99 := in99;
     VAR_in100 := in100;
     VAR_in101 := in101;
     VAR_in102 := in102;
     VAR_in103 := in103;
     VAR_in104 := in104;
     VAR_in105 := in105;
     VAR_in106 := in106;
     VAR_in107 := in107;
     VAR_in108 := in108;
     VAR_in109 := in109;
     VAR_in110 := in110;
     VAR_in111 := in111;
     VAR_in112 := in112;
     VAR_in113 := in113;
     VAR_in114 := in114;
     VAR_in115 := in115;
     VAR_in116 := in116;
     VAR_in117 := in117;
     VAR_in118 := in118;
     VAR_in119 := in119;
     VAR_in120 := in120;
     VAR_in121 := in121;
     VAR_in122 := in122;
     VAR_in123 := in123;
     VAR_in124 := in124;
     VAR_in125 := in125;
     VAR_in126 := in126;
     VAR_in127 := in127;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse := VAR_in10;
     VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse := VAR_in100;
     VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue := VAR_in101;
     VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse := VAR_in102;
     VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue := VAR_in103;
     VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse := VAR_in104;
     VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue := VAR_in105;
     VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse := VAR_in106;
     VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue := VAR_in107;
     VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse := VAR_in108;
     VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue := VAR_in109;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue := VAR_in11;
     VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse := VAR_in110;
     VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue := VAR_in111;
     VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse := VAR_in112;
     VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue := VAR_in113;
     VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse := VAR_in114;
     VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue := VAR_in115;
     VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse := VAR_in116;
     VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue := VAR_in117;
     VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse := VAR_in118;
     VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue := VAR_in119;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse := VAR_in12;
     VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse := VAR_in120;
     VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue := VAR_in121;
     VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse := VAR_in122;
     VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue := VAR_in123;
     VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse := VAR_in124;
     VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue := VAR_in125;
     VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse := VAR_in126;
     VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue := VAR_in127;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue := VAR_in63;
     VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse := VAR_in64;
     VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue := VAR_in65;
     VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse := VAR_in66;
     VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue := VAR_in67;
     VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse := VAR_in68;
     VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue := VAR_in69;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue := VAR_in7;
     VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse := VAR_in70;
     VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue := VAR_in71;
     VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse := VAR_in72;
     VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue := VAR_in73;
     VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse := VAR_in74;
     VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue := VAR_in75;
     VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse := VAR_in76;
     VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue := VAR_in77;
     VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse := VAR_in78;
     VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue := VAR_in79;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse := VAR_in8;
     VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse := VAR_in80;
     VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue := VAR_in81;
     VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse := VAR_in82;
     VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue := VAR_in83;
     VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse := VAR_in84;
     VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue := VAR_in85;
     VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse := VAR_in86;
     VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue := VAR_in87;
     VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse := VAR_in88;
     VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue := VAR_in89;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue := VAR_in9;
     VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse := VAR_in90;
     VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue := VAR_in91;
     VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse := VAR_in92;
     VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue := VAR_in93;
     VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse := VAR_in94;
     VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue := VAR_in95;
     VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse := VAR_in96;
     VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue := VAR_in97;
     VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse := VAR_in98;
     VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue := VAR_in99;
     -- uint7_4_4[bit_math_h_l1358_c10_6ca7] LATENCY=0
     VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output := uint7_4_4(
     VAR_sel);

     -- uint7_6_6[bit_math_h_l1436_c10_a5b4] LATENCY=0
     VAR_uint7_6_6_bit_math_h_l1436_c10_a5b4_return_output := uint7_6_6(
     VAR_sel);

     -- uint7_1_1[bit_math_h_l724_c10_85d2] LATENCY=0
     VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output := uint7_1_1(
     VAR_sel);

     -- uint7_3_3[bit_math_h_l1264_c10_c2db] LATENCY=0
     VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output := uint7_3_3(
     VAR_sel);

     -- uint7_0_0[bit_math_h_l14_c10_bf15] LATENCY=0
     VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output := uint7_0_0(
     VAR_sel);

     -- uint7_2_2[bit_math_h_l1082_c10_1ad7] LATENCY=0
     VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output := uint7_2_2(
     VAR_sel);

     -- uint7_5_5[bit_math_h_l1408_c10_5b08] LATENCY=0
     VAR_uint7_5_5_bit_math_h_l1408_c10_5b08_return_output := uint7_5_5(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond := VAR_uint7_0_0_bit_math_h_l14_c10_bf15_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond := VAR_uint7_1_1_bit_math_h_l724_c10_85d2_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond := VAR_uint7_2_2_bit_math_h_l1082_c10_1ad7_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond := VAR_uint7_3_3_bit_math_h_l1264_c10_c2db_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond := VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond := VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output;
     VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond := VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output;
     VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond := VAR_uint7_4_4_bit_math_h_l1358_c10_6ca7_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond := VAR_uint7_5_5_bit_math_h_l1408_c10_5b08_return_output;
     VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond := VAR_uint7_5_5_bit_math_h_l1408_c10_5b08_return_output;
     VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond := VAR_uint7_6_6_bit_math_h_l1436_c10_a5b4_return_output;
     -- layer0_node49_MUX[bit_math_h_l557_c3_b62c] LATENCY=0
     -- Inputs
     layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond <= VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_cond;
     layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue <= VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iftrue;
     layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse <= VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_iffalse;
     -- Outputs
     VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output := layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_6778] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_6778_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output := layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_2fcd] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output := layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_5abe] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output := layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output;

     -- layer0_node34_MUX[bit_math_h_l392_c3_8132] LATENCY=0
     -- Inputs
     layer0_node34_MUX_bit_math_h_l392_c3_8132_cond <= VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_cond;
     layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue <= VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iftrue;
     layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse <= VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_iffalse;
     -- Outputs
     VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output := layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output;

     -- layer0_node45_MUX[bit_math_h_l513_c3_8b2f] LATENCY=0
     -- Inputs
     layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond <= VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_cond;
     layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue <= VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iftrue;
     layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse <= VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_iffalse;
     -- Outputs
     VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output := layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output;

     -- layer0_node46_MUX[bit_math_h_l524_c3_f9a9] LATENCY=0
     -- Inputs
     layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond <= VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_cond;
     layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue <= VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iftrue;
     layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse <= VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_iffalse;
     -- Outputs
     VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output := layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output;

     -- layer0_node44_MUX[bit_math_h_l502_c3_cc1f] LATENCY=0
     -- Inputs
     layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond <= VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_cond;
     layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue <= VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iftrue;
     layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse <= VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_iffalse;
     -- Outputs
     VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output := layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_aec1] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output := layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output;

     -- layer0_node50_MUX[bit_math_h_l568_c3_cc21] LATENCY=0
     -- Inputs
     layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond <= VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_cond;
     layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue <= VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iftrue;
     layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse <= VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_iffalse;
     -- Outputs
     VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output := layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_880b] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_880b_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output := layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_f68a] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output := layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output;

     -- layer0_node56_MUX[bit_math_h_l634_c3_4830] LATENCY=0
     -- Inputs
     layer0_node56_MUX_bit_math_h_l634_c3_4830_cond <= VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_cond;
     layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue <= VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iftrue;
     layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse <= VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_iffalse;
     -- Outputs
     VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output := layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_d769] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_d769_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output := layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_8af2] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output := layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output;

     -- layer0_node51_MUX[bit_math_h_l579_c3_43b2] LATENCY=0
     -- Inputs
     layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond <= VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_cond;
     layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue <= VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iftrue;
     layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse <= VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_iffalse;
     -- Outputs
     VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output := layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_70df] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_70df_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output := layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_aff2] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output := layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_18bb] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output := layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output;

     -- layer0_node38_MUX[bit_math_h_l436_c3_d6d1] LATENCY=0
     -- Inputs
     layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond <= VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_cond;
     layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue <= VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iftrue;
     layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse <= VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_iffalse;
     -- Outputs
     VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output := layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_fb2d] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output := layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output;

     -- layer0_node48_MUX[bit_math_h_l546_c3_4e2a] LATENCY=0
     -- Inputs
     layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond <= VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_cond;
     layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue <= VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iftrue;
     layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse <= VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_iffalse;
     -- Outputs
     VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output := layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_4bec] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output := layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_1323] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_1323_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output := layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_dcf0] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output := layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_4f79] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output := layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_b31a] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output := layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output;

     -- layer0_node36_MUX[bit_math_h_l414_c3_87f8] LATENCY=0
     -- Inputs
     layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond <= VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_cond;
     layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue <= VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iftrue;
     layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse <= VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_iffalse;
     -- Outputs
     VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output := layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output;

     -- layer0_node35_MUX[bit_math_h_l403_c3_f450] LATENCY=0
     -- Inputs
     layer0_node35_MUX_bit_math_h_l403_c3_f450_cond <= VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_cond;
     layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue <= VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iftrue;
     layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse <= VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_iffalse;
     -- Outputs
     VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output := layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_d627] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_d627_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output := layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_aeec] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output := layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output;

     -- layer0_node47_MUX[bit_math_h_l535_c3_9554] LATENCY=0
     -- Inputs
     layer0_node47_MUX_bit_math_h_l535_c3_9554_cond <= VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_cond;
     layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue <= VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iftrue;
     layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse <= VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_iffalse;
     -- Outputs
     VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output := layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_e26d] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output := layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output;

     -- layer0_node54_MUX[bit_math_h_l612_c3_a81a] LATENCY=0
     -- Inputs
     layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond <= VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_cond;
     layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue <= VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iftrue;
     layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse <= VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_iffalse;
     -- Outputs
     VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output := layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_4199] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_4199_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output := layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output;

     -- layer0_node60_MUX[bit_math_h_l678_c3_2749] LATENCY=0
     -- Inputs
     layer0_node60_MUX_bit_math_h_l678_c3_2749_cond <= VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_cond;
     layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue <= VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iftrue;
     layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse <= VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_iffalse;
     -- Outputs
     VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output := layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output;

     -- layer0_node58_MUX[bit_math_h_l656_c3_89a8] LATENCY=0
     -- Inputs
     layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond <= VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_cond;
     layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue <= VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iftrue;
     layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse <= VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_iffalse;
     -- Outputs
     VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output := layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output;

     -- layer0_node42_MUX[bit_math_h_l480_c3_f29c] LATENCY=0
     -- Inputs
     layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond <= VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_cond;
     layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue <= VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iftrue;
     layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse <= VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_iffalse;
     -- Outputs
     VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output := layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output;

     -- layer0_node33_MUX[bit_math_h_l381_c3_dadd] LATENCY=0
     -- Inputs
     layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond <= VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_cond;
     layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue <= VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iftrue;
     layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse <= VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_iffalse;
     -- Outputs
     VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output := layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output;

     -- layer0_node57_MUX[bit_math_h_l645_c3_4a10] LATENCY=0
     -- Inputs
     layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond <= VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_cond;
     layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue <= VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iftrue;
     layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse <= VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_iffalse;
     -- Outputs
     VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output := layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output;

     -- layer0_node43_MUX[bit_math_h_l491_c3_d993] LATENCY=0
     -- Inputs
     layer0_node43_MUX_bit_math_h_l491_c3_d993_cond <= VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_cond;
     layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue <= VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iftrue;
     layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse <= VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_iffalse;
     -- Outputs
     VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output := layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output;

     -- layer0_node53_MUX[bit_math_h_l601_c3_a6b2] LATENCY=0
     -- Inputs
     layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond <= VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_cond;
     layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue <= VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iftrue;
     layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse <= VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_iffalse;
     -- Outputs
     VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output := layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output;

     -- layer0_node40_MUX[bit_math_h_l458_c3_335b] LATENCY=0
     -- Inputs
     layer0_node40_MUX_bit_math_h_l458_c3_335b_cond <= VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_cond;
     layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue <= VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iftrue;
     layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse <= VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_iffalse;
     -- Outputs
     VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output := layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output;

     -- layer0_node59_MUX[bit_math_h_l667_c3_8361] LATENCY=0
     -- Inputs
     layer0_node59_MUX_bit_math_h_l667_c3_8361_cond <= VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_cond;
     layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue <= VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iftrue;
     layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse <= VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_iffalse;
     -- Outputs
     VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output := layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_b6a9] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output := layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output;

     -- layer0_node32_MUX[bit_math_h_l370_c3_0dec] LATENCY=0
     -- Inputs
     layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond <= VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_cond;
     layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue <= VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iftrue;
     layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse <= VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_iffalse;
     -- Outputs
     VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output := layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output;

     -- layer0_node39_MUX[bit_math_h_l447_c3_0993] LATENCY=0
     -- Inputs
     layer0_node39_MUX_bit_math_h_l447_c3_0993_cond <= VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_cond;
     layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue <= VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iftrue;
     layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse <= VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_iffalse;
     -- Outputs
     VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output := layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_47d5] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output := layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output;

     -- layer0_node62_MUX[bit_math_h_l700_c3_04cf] LATENCY=0
     -- Inputs
     layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond <= VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_cond;
     layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue <= VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iftrue;
     layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse <= VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_iffalse;
     -- Outputs
     VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output := layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output;

     -- layer0_node55_MUX[bit_math_h_l623_c3_6b04] LATENCY=0
     -- Inputs
     layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond <= VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_cond;
     layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue <= VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iftrue;
     layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse <= VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_iffalse;
     -- Outputs
     VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output := layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_121f] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_121f_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output := layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_9855] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_9855_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output := layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output;

     -- layer0_node37_MUX[bit_math_h_l425_c3_5243] LATENCY=0
     -- Inputs
     layer0_node37_MUX_bit_math_h_l425_c3_5243_cond <= VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_cond;
     layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue <= VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iftrue;
     layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse <= VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_iffalse;
     -- Outputs
     VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output := layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_f76f] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output := layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_5c30] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output := layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_acf7] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output := layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output;

     -- layer0_node41_MUX[bit_math_h_l469_c3_7fa8] LATENCY=0
     -- Inputs
     layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond <= VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_cond;
     layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue <= VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iftrue;
     layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse <= VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_iffalse;
     -- Outputs
     VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output := layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_8ef6] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output := layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output;

     -- layer0_node63_MUX[bit_math_h_l711_c3_14fe] LATENCY=0
     -- Inputs
     layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond <= VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_cond;
     layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue <= VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iftrue;
     layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse <= VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_iffalse;
     -- Outputs
     VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output := layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output;

     -- layer0_node61_MUX[bit_math_h_l689_c3_c29c] LATENCY=0
     -- Inputs
     layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond <= VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_cond;
     layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue <= VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iftrue;
     layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse <= VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_iffalse;
     -- Outputs
     VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output := layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_2070] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_2070_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output := layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_f76c] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output := layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output;

     -- layer0_node52_MUX[bit_math_h_l590_c3_e913] LATENCY=0
     -- Inputs
     layer0_node52_MUX_bit_math_h_l590_c3_e913_cond <= VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_cond;
     layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue <= VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iftrue;
     layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse <= VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_iffalse;
     -- Outputs
     VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output := layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_4f26] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output := layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_b31a_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_4bec_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_aff2_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_1323_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_f76f_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_121f_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_b6a9_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_4199_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_aeec_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_d627_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_f76c_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_6778_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_5abe_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_5c30_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_9855_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_8ef6_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_2070_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_8af2_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_d769_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_dcf0_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_4f26_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_e26d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_acf7_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_4f79_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_f68a_return_output;
     VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse := VAR_layer0_node32_MUX_bit_math_h_l370_c3_0dec_return_output;
     VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue := VAR_layer0_node33_MUX_bit_math_h_l381_c3_dadd_return_output;
     VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse := VAR_layer0_node34_MUX_bit_math_h_l392_c3_8132_return_output;
     VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue := VAR_layer0_node35_MUX_bit_math_h_l403_c3_f450_return_output;
     VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse := VAR_layer0_node36_MUX_bit_math_h_l414_c3_87f8_return_output;
     VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue := VAR_layer0_node37_MUX_bit_math_h_l425_c3_5243_return_output;
     VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse := VAR_layer0_node38_MUX_bit_math_h_l436_c3_d6d1_return_output;
     VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue := VAR_layer0_node39_MUX_bit_math_h_l447_c3_0993_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_880b_return_output;
     VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse := VAR_layer0_node40_MUX_bit_math_h_l458_c3_335b_return_output;
     VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue := VAR_layer0_node41_MUX_bit_math_h_l469_c3_7fa8_return_output;
     VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse := VAR_layer0_node42_MUX_bit_math_h_l480_c3_f29c_return_output;
     VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue := VAR_layer0_node43_MUX_bit_math_h_l491_c3_d993_return_output;
     VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse := VAR_layer0_node44_MUX_bit_math_h_l502_c3_cc1f_return_output;
     VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue := VAR_layer0_node45_MUX_bit_math_h_l513_c3_8b2f_return_output;
     VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse := VAR_layer0_node46_MUX_bit_math_h_l524_c3_f9a9_return_output;
     VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue := VAR_layer0_node47_MUX_bit_math_h_l535_c3_9554_return_output;
     VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse := VAR_layer0_node48_MUX_bit_math_h_l546_c3_4e2a_return_output;
     VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue := VAR_layer0_node49_MUX_bit_math_h_l557_c3_b62c_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_2fcd_return_output;
     VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse := VAR_layer0_node50_MUX_bit_math_h_l568_c3_cc21_return_output;
     VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue := VAR_layer0_node51_MUX_bit_math_h_l579_c3_43b2_return_output;
     VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse := VAR_layer0_node52_MUX_bit_math_h_l590_c3_e913_return_output;
     VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue := VAR_layer0_node53_MUX_bit_math_h_l601_c3_a6b2_return_output;
     VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse := VAR_layer0_node54_MUX_bit_math_h_l612_c3_a81a_return_output;
     VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue := VAR_layer0_node55_MUX_bit_math_h_l623_c3_6b04_return_output;
     VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse := VAR_layer0_node56_MUX_bit_math_h_l634_c3_4830_return_output;
     VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue := VAR_layer0_node57_MUX_bit_math_h_l645_c3_4a10_return_output;
     VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse := VAR_layer0_node58_MUX_bit_math_h_l656_c3_89a8_return_output;
     VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue := VAR_layer0_node59_MUX_bit_math_h_l667_c3_8361_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_aec1_return_output;
     VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse := VAR_layer0_node60_MUX_bit_math_h_l678_c3_2749_return_output;
     VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue := VAR_layer0_node61_MUX_bit_math_h_l689_c3_c29c_return_output;
     VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse := VAR_layer0_node62_MUX_bit_math_h_l700_c3_04cf_return_output;
     VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue := VAR_layer0_node63_MUX_bit_math_h_l711_c3_14fe_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_47d5_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_18bb_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_70df_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_fb2d_return_output;
     -- layer1_node11_MUX[bit_math_h_l849_c3_437c] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l849_c3_437c_cond <= VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_cond;
     layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iftrue;
     layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output := layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output;

     -- layer1_node8_MUX[bit_math_h_l816_c3_77a8] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond <= VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_cond;
     layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iftrue;
     layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output := layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output;

     -- layer1_node29_MUX[bit_math_h_l1047_c3_0dca] LATENCY=0
     -- Inputs
     layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond <= VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_cond;
     layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue <= VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iftrue;
     layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse <= VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_iffalse;
     -- Outputs
     VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output := layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output;

     -- layer1_node28_MUX[bit_math_h_l1036_c3_6b62] LATENCY=0
     -- Inputs
     layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond <= VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_cond;
     layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue <= VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iftrue;
     layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse <= VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_iffalse;
     -- Outputs
     VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output := layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output;

     -- layer1_node16_MUX[bit_math_h_l904_c3_f326] LATENCY=0
     -- Inputs
     layer1_node16_MUX_bit_math_h_l904_c3_f326_cond <= VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_cond;
     layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue <= VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iftrue;
     layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse <= VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_iffalse;
     -- Outputs
     VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output := layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output;

     -- layer1_node7_MUX[bit_math_h_l805_c3_efe0] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond <= VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_cond;
     layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iftrue;
     layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output := layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output;

     -- layer1_node25_MUX[bit_math_h_l1003_c3_d851] LATENCY=0
     -- Inputs
     layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond <= VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_cond;
     layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue <= VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iftrue;
     layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse <= VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_iffalse;
     -- Outputs
     VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output := layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output;

     -- layer1_node5_MUX[bit_math_h_l783_c3_13a6] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond <= VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_cond;
     layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iftrue;
     layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output := layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output;

     -- layer1_node2_MUX[bit_math_h_l750_c3_8a9d] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond <= VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_cond;
     layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iftrue;
     layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output := layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output;

     -- layer1_node20_MUX[bit_math_h_l948_c3_ea51] LATENCY=0
     -- Inputs
     layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond <= VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_cond;
     layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue <= VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iftrue;
     layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse <= VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_iffalse;
     -- Outputs
     VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output := layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output;

     -- layer1_node0_MUX[bit_math_h_l728_c3_9fc9] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond <= VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_cond;
     layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iftrue;
     layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output := layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output;

     -- layer1_node27_MUX[bit_math_h_l1025_c3_9e60] LATENCY=0
     -- Inputs
     layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond <= VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_cond;
     layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue <= VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iftrue;
     layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse <= VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_iffalse;
     -- Outputs
     VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output := layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output;

     -- layer1_node17_MUX[bit_math_h_l915_c3_2354] LATENCY=0
     -- Inputs
     layer1_node17_MUX_bit_math_h_l915_c3_2354_cond <= VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_cond;
     layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue <= VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iftrue;
     layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse <= VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_iffalse;
     -- Outputs
     VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output := layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output;

     -- layer1_node12_MUX[bit_math_h_l860_c3_6ab1] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond <= VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_cond;
     layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iftrue;
     layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output := layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output;

     -- layer1_node4_MUX[bit_math_h_l772_c3_3310] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l772_c3_3310_cond <= VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_cond;
     layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iftrue;
     layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output := layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output;

     -- layer1_node10_MUX[bit_math_h_l838_c3_4167] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l838_c3_4167_cond <= VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_cond;
     layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iftrue;
     layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output := layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output;

     -- layer1_node22_MUX[bit_math_h_l970_c3_534d] LATENCY=0
     -- Inputs
     layer1_node22_MUX_bit_math_h_l970_c3_534d_cond <= VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_cond;
     layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue <= VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iftrue;
     layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse <= VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_iffalse;
     -- Outputs
     VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output := layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output;

     -- layer1_node26_MUX[bit_math_h_l1014_c3_3ac6] LATENCY=0
     -- Inputs
     layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond <= VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_cond;
     layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue <= VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iftrue;
     layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse <= VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_iffalse;
     -- Outputs
     VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output := layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output;

     -- layer1_node1_MUX[bit_math_h_l739_c3_5120] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l739_c3_5120_cond <= VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_cond;
     layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iftrue;
     layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output := layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output;

     -- layer1_node21_MUX[bit_math_h_l959_c3_8c51] LATENCY=0
     -- Inputs
     layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond <= VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_cond;
     layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue <= VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iftrue;
     layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse <= VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_iffalse;
     -- Outputs
     VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output := layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output;

     -- layer1_node19_MUX[bit_math_h_l937_c3_a99c] LATENCY=0
     -- Inputs
     layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond <= VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_cond;
     layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue <= VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iftrue;
     layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse <= VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_iffalse;
     -- Outputs
     VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output := layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output;

     -- layer1_node6_MUX[bit_math_h_l794_c3_6881] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l794_c3_6881_cond <= VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_cond;
     layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iftrue;
     layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output := layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output;

     -- layer1_node9_MUX[bit_math_h_l827_c3_d6b2] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond <= VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_cond;
     layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iftrue;
     layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output := layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output;

     -- layer1_node15_MUX[bit_math_h_l893_c3_8bdc] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond <= VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_cond;
     layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iftrue;
     layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output := layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output;

     -- layer1_node24_MUX[bit_math_h_l992_c3_818a] LATENCY=0
     -- Inputs
     layer1_node24_MUX_bit_math_h_l992_c3_818a_cond <= VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_cond;
     layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue <= VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iftrue;
     layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse <= VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_iffalse;
     -- Outputs
     VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output := layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output;

     -- layer1_node3_MUX[bit_math_h_l761_c3_1edb] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond <= VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_cond;
     layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iftrue;
     layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output := layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output;

     -- layer1_node31_MUX[bit_math_h_l1069_c3_3247] LATENCY=0
     -- Inputs
     layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond <= VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_cond;
     layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue <= VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iftrue;
     layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse <= VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_iffalse;
     -- Outputs
     VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output := layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output;

     -- layer1_node18_MUX[bit_math_h_l926_c3_bcb9] LATENCY=0
     -- Inputs
     layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond <= VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_cond;
     layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue <= VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iftrue;
     layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse <= VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_iffalse;
     -- Outputs
     VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output := layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output;

     -- layer1_node23_MUX[bit_math_h_l981_c3_4aee] LATENCY=0
     -- Inputs
     layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond <= VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_cond;
     layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue <= VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iftrue;
     layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse <= VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_iffalse;
     -- Outputs
     VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output := layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output;

     -- layer1_node14_MUX[bit_math_h_l882_c3_9e06] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond <= VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_cond;
     layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iftrue;
     layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output := layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output;

     -- layer1_node13_MUX[bit_math_h_l871_c3_4910] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l871_c3_4910_cond <= VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_cond;
     layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iftrue;
     layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output := layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output;

     -- layer1_node30_MUX[bit_math_h_l1058_c3_b078] LATENCY=0
     -- Inputs
     layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond <= VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_cond;
     layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue <= VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iftrue;
     layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse <= VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_iffalse;
     -- Outputs
     VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output := layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse := VAR_layer1_node0_MUX_bit_math_h_l728_c3_9fc9_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse := VAR_layer1_node10_MUX_bit_math_h_l838_c3_4167_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue := VAR_layer1_node11_MUX_bit_math_h_l849_c3_437c_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse := VAR_layer1_node12_MUX_bit_math_h_l860_c3_6ab1_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue := VAR_layer1_node13_MUX_bit_math_h_l871_c3_4910_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse := VAR_layer1_node14_MUX_bit_math_h_l882_c3_9e06_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue := VAR_layer1_node15_MUX_bit_math_h_l893_c3_8bdc_return_output;
     VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse := VAR_layer1_node16_MUX_bit_math_h_l904_c3_f326_return_output;
     VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue := VAR_layer1_node17_MUX_bit_math_h_l915_c3_2354_return_output;
     VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse := VAR_layer1_node18_MUX_bit_math_h_l926_c3_bcb9_return_output;
     VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue := VAR_layer1_node19_MUX_bit_math_h_l937_c3_a99c_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue := VAR_layer1_node1_MUX_bit_math_h_l739_c3_5120_return_output;
     VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse := VAR_layer1_node20_MUX_bit_math_h_l948_c3_ea51_return_output;
     VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue := VAR_layer1_node21_MUX_bit_math_h_l959_c3_8c51_return_output;
     VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse := VAR_layer1_node22_MUX_bit_math_h_l970_c3_534d_return_output;
     VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue := VAR_layer1_node23_MUX_bit_math_h_l981_c3_4aee_return_output;
     VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse := VAR_layer1_node24_MUX_bit_math_h_l992_c3_818a_return_output;
     VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue := VAR_layer1_node25_MUX_bit_math_h_l1003_c3_d851_return_output;
     VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse := VAR_layer1_node26_MUX_bit_math_h_l1014_c3_3ac6_return_output;
     VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue := VAR_layer1_node27_MUX_bit_math_h_l1025_c3_9e60_return_output;
     VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse := VAR_layer1_node28_MUX_bit_math_h_l1036_c3_6b62_return_output;
     VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue := VAR_layer1_node29_MUX_bit_math_h_l1047_c3_0dca_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse := VAR_layer1_node2_MUX_bit_math_h_l750_c3_8a9d_return_output;
     VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse := VAR_layer1_node30_MUX_bit_math_h_l1058_c3_b078_return_output;
     VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue := VAR_layer1_node31_MUX_bit_math_h_l1069_c3_3247_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue := VAR_layer1_node3_MUX_bit_math_h_l761_c3_1edb_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse := VAR_layer1_node4_MUX_bit_math_h_l772_c3_3310_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue := VAR_layer1_node5_MUX_bit_math_h_l783_c3_13a6_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse := VAR_layer1_node6_MUX_bit_math_h_l794_c3_6881_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue := VAR_layer1_node7_MUX_bit_math_h_l805_c3_efe0_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse := VAR_layer1_node8_MUX_bit_math_h_l816_c3_77a8_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue := VAR_layer1_node9_MUX_bit_math_h_l827_c3_d6b2_return_output;
     -- layer2_node14_MUX[bit_math_h_l1240_c3_cff6] LATENCY=0
     -- Inputs
     layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond <= VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_cond;
     layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue <= VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iftrue;
     layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse <= VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_iffalse;
     -- Outputs
     VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output := layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output;

     -- layer2_node2_MUX[bit_math_h_l1108_c3_ab8d] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond <= VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_cond;
     layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iftrue;
     layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output := layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output;

     -- layer2_node0_MUX[bit_math_h_l1086_c3_4196] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond <= VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_cond;
     layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iftrue;
     layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output := layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output;

     -- layer2_node5_MUX[bit_math_h_l1141_c3_433e] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond <= VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_cond;
     layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iftrue;
     layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output := layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output;

     -- layer2_node8_MUX[bit_math_h_l1174_c3_371b] LATENCY=0
     -- Inputs
     layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond <= VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_cond;
     layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue <= VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iftrue;
     layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse <= VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_iffalse;
     -- Outputs
     VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output := layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output;

     -- layer2_node10_MUX[bit_math_h_l1196_c3_ceef] LATENCY=0
     -- Inputs
     layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond <= VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_cond;
     layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue <= VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iftrue;
     layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse <= VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_iffalse;
     -- Outputs
     VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output := layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output;

     -- layer2_node15_MUX[bit_math_h_l1251_c3_99bc] LATENCY=0
     -- Inputs
     layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond <= VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_cond;
     layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue <= VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iftrue;
     layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse <= VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_iffalse;
     -- Outputs
     VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output := layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output;

     -- layer2_node3_MUX[bit_math_h_l1119_c3_467d] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond <= VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_cond;
     layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iftrue;
     layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output := layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output;

     -- layer2_node7_MUX[bit_math_h_l1163_c3_7278] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond <= VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_cond;
     layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iftrue;
     layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output := layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output;

     -- layer2_node1_MUX[bit_math_h_l1097_c3_bc3c] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond <= VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_cond;
     layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iftrue;
     layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output := layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output;

     -- layer2_node9_MUX[bit_math_h_l1185_c3_28c1] LATENCY=0
     -- Inputs
     layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond <= VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_cond;
     layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue <= VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iftrue;
     layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse <= VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_iffalse;
     -- Outputs
     VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output := layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output;

     -- layer2_node6_MUX[bit_math_h_l1152_c3_2fc3] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond <= VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_cond;
     layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iftrue;
     layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output := layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output;

     -- layer2_node13_MUX[bit_math_h_l1229_c3_2a2d] LATENCY=0
     -- Inputs
     layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond <= VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_cond;
     layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue <= VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iftrue;
     layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse <= VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_iffalse;
     -- Outputs
     VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output := layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output;

     -- layer2_node12_MUX[bit_math_h_l1218_c3_fb46] LATENCY=0
     -- Inputs
     layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond <= VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_cond;
     layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue <= VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iftrue;
     layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse <= VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_iffalse;
     -- Outputs
     VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output := layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output;

     -- layer2_node4_MUX[bit_math_h_l1130_c3_0f95] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond <= VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_cond;
     layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iftrue;
     layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output := layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output;

     -- layer2_node11_MUX[bit_math_h_l1207_c3_ca74] LATENCY=0
     -- Inputs
     layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond <= VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_cond;
     layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue <= VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iftrue;
     layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse <= VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_iffalse;
     -- Outputs
     VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output := layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse := VAR_layer2_node0_MUX_bit_math_h_l1086_c3_4196_return_output;
     VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse := VAR_layer2_node10_MUX_bit_math_h_l1196_c3_ceef_return_output;
     VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue := VAR_layer2_node11_MUX_bit_math_h_l1207_c3_ca74_return_output;
     VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse := VAR_layer2_node12_MUX_bit_math_h_l1218_c3_fb46_return_output;
     VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue := VAR_layer2_node13_MUX_bit_math_h_l1229_c3_2a2d_return_output;
     VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse := VAR_layer2_node14_MUX_bit_math_h_l1240_c3_cff6_return_output;
     VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue := VAR_layer2_node15_MUX_bit_math_h_l1251_c3_99bc_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue := VAR_layer2_node1_MUX_bit_math_h_l1097_c3_bc3c_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse := VAR_layer2_node2_MUX_bit_math_h_l1108_c3_ab8d_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue := VAR_layer2_node3_MUX_bit_math_h_l1119_c3_467d_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse := VAR_layer2_node4_MUX_bit_math_h_l1130_c3_0f95_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue := VAR_layer2_node5_MUX_bit_math_h_l1141_c3_433e_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse := VAR_layer2_node6_MUX_bit_math_h_l1152_c3_2fc3_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue := VAR_layer2_node7_MUX_bit_math_h_l1163_c3_7278_return_output;
     VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse := VAR_layer2_node8_MUX_bit_math_h_l1174_c3_371b_return_output;
     VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue := VAR_layer2_node9_MUX_bit_math_h_l1185_c3_28c1_return_output;
     -- layer3_node7_MUX[bit_math_h_l1345_c3_b2c6] LATENCY=0
     -- Inputs
     layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond <= VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_cond;
     layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue <= VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iftrue;
     layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse <= VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_iffalse;
     -- Outputs
     VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output := layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output;

     -- layer3_node0_MUX[bit_math_h_l1268_c3_6dff] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond <= VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_cond;
     layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iftrue;
     layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output := layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output;

     -- layer3_node1_MUX[bit_math_h_l1279_c3_fcdc] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond <= VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_cond;
     layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iftrue;
     layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output := layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output;

     -- layer3_node5_MUX[bit_math_h_l1323_c3_5438] LATENCY=0
     -- Inputs
     layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond <= VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_cond;
     layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue <= VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iftrue;
     layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse <= VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_iffalse;
     -- Outputs
     VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output := layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output;

     -- layer3_node6_MUX[bit_math_h_l1334_c3_6997] LATENCY=0
     -- Inputs
     layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond <= VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_cond;
     layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue <= VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iftrue;
     layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse <= VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_iffalse;
     -- Outputs
     VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output := layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output;

     -- layer3_node3_MUX[bit_math_h_l1301_c3_fe30] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond <= VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_cond;
     layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iftrue;
     layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output := layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output;

     -- layer3_node4_MUX[bit_math_h_l1312_c3_8b1f] LATENCY=0
     -- Inputs
     layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond <= VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_cond;
     layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue <= VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iftrue;
     layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse <= VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_iffalse;
     -- Outputs
     VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output := layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output;

     -- layer3_node2_MUX[bit_math_h_l1290_c3_680f] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond <= VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_cond;
     layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iftrue;
     layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output := layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse := VAR_layer3_node0_MUX_bit_math_h_l1268_c3_6dff_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue := VAR_layer3_node1_MUX_bit_math_h_l1279_c3_fcdc_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse := VAR_layer3_node2_MUX_bit_math_h_l1290_c3_680f_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue := VAR_layer3_node3_MUX_bit_math_h_l1301_c3_fe30_return_output;
     VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse := VAR_layer3_node4_MUX_bit_math_h_l1312_c3_8b1f_return_output;
     VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue := VAR_layer3_node5_MUX_bit_math_h_l1323_c3_5438_return_output;
     VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse := VAR_layer3_node6_MUX_bit_math_h_l1334_c3_6997_return_output;
     VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue := VAR_layer3_node7_MUX_bit_math_h_l1345_c3_b2c6_return_output;
     -- layer4_node2_MUX[bit_math_h_l1384_c3_a513] LATENCY=0
     -- Inputs
     layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond <= VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_cond;
     layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue <= VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iftrue;
     layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse <= VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_iffalse;
     -- Outputs
     VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output := layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output;

     -- layer4_node1_MUX[bit_math_h_l1373_c3_f134] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond <= VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_cond;
     layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iftrue;
     layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output := layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output;

     -- layer4_node0_MUX[bit_math_h_l1362_c3_ecb1] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond <= VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_cond;
     layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iftrue;
     layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output := layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output;

     -- layer4_node3_MUX[bit_math_h_l1395_c3_7633] LATENCY=0
     -- Inputs
     layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond <= VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_cond;
     layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue <= VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iftrue;
     layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse <= VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_iffalse;
     -- Outputs
     VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output := layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse := VAR_layer4_node0_MUX_bit_math_h_l1362_c3_ecb1_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue := VAR_layer4_node1_MUX_bit_math_h_l1373_c3_f134_return_output;
     VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse := VAR_layer4_node2_MUX_bit_math_h_l1384_c3_a513_return_output;
     VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue := VAR_layer4_node3_MUX_bit_math_h_l1395_c3_7633_return_output;
     -- layer5_node0_MUX[bit_math_h_l1412_c3_277a] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond <= VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_cond;
     layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iftrue;
     layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output := layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output;

     -- layer5_node1_MUX[bit_math_h_l1423_c3_98a8] LATENCY=0
     -- Inputs
     layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond <= VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_cond;
     layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue <= VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iftrue;
     layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse <= VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_iffalse;
     -- Outputs
     VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output := layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output;

     -- Submodule level 7
     VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse := VAR_layer5_node0_MUX_bit_math_h_l1412_c3_277a_return_output;
     VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue := VAR_layer5_node1_MUX_bit_math_h_l1423_c3_98a8_return_output;
     -- layer6_node0_MUX[bit_math_h_l1440_c3_c512] LATENCY=0
     -- Inputs
     layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond <= VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_cond;
     layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue <= VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iftrue;
     layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse <= VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_iffalse;
     -- Outputs
     VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output := layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output;

     -- Submodule level 8
     VAR_return_output := VAR_layer6_node0_MUX_bit_math_h_l1440_c3_c512_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
