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
-- layer0_node0_MUX[bit_math_h_l18_c3_f3ed]
signal layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d8bb]
signal layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_e267]
signal layer0_node2_MUX_bit_math_h_l40_c3_e267_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_be45]
signal layer0_node3_MUX_bit_math_h_l51_c3_be45_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_c0dc]
signal layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_e5aa]
signal layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_ad85]
signal layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_b50b]
signal layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_0f1b]
signal layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_8d92]
signal layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_1f7d]
signal layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_a41d]
signal layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_2c7e]
signal layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_e70d]
signal layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_8ec7]
signal layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_09fa]
signal layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_07fe]
signal layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_48ad]
signal layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_15d8]
signal layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_9ed6]
signal layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_de4d]
signal layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_55cf]
signal layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_b840]
signal layer0_node22_MUX_bit_math_h_l260_c3_b840_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_f8f4]
signal layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_66be]
signal layer0_node24_MUX_bit_math_h_l282_c3_66be_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_05f2]
signal layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_2f62]
signal layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_2f94]
signal layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_4173]
signal layer0_node28_MUX_bit_math_h_l326_c3_4173_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_ec1a]
signal layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_f286]
signal layer0_node30_MUX_bit_math_h_l348_c3_f286_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_0437]
signal layer0_node31_MUX_bit_math_h_l359_c3_0437_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_9610]
signal layer1_node0_MUX_bit_math_h_l376_c3_9610_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_0a5c]
signal layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_c136]
signal layer1_node2_MUX_bit_math_h_l398_c3_c136_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_cf04]
signal layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_e52c]
signal layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_601a]
signal layer1_node5_MUX_bit_math_h_l431_c3_601a_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_68c5]
signal layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_6aa4]
signal layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_c93a]
signal layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_a8ed]
signal layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_c1bc]
signal layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_badb]
signal layer1_node11_MUX_bit_math_h_l497_c3_badb_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_986f]
signal layer1_node12_MUX_bit_math_h_l508_c3_986f_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_0b54]
signal layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_8065]
signal layer1_node14_MUX_bit_math_h_l530_c3_8065_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_6160]
signal layer1_node15_MUX_bit_math_h_l541_c3_6160_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_3bef]
signal layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_fd4b]
signal layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_4818]
signal layer2_node2_MUX_bit_math_h_l580_c3_4818_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_cd5e]
signal layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_d046]
signal layer2_node4_MUX_bit_math_h_l602_c3_d046_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_b995]
signal layer2_node5_MUX_bit_math_h_l613_c3_b995_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_59ca]
signal layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_27eb]
signal layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_fba9]
signal layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_ab2b]
signal layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_d6e7]
signal layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_8b38]
signal layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_5291]
signal layer4_node0_MUX_bit_math_h_l702_c3_5291_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_d949]
signal layer4_node1_MUX_bit_math_h_l713_c3_d949_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_cf5c]
signal layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_f3ed
layer0_node0_MUX_bit_math_h_l18_c3_f3ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond,
layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d8bb
layer0_node1_MUX_bit_math_h_l29_c3_d8bb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_e267
layer0_node2_MUX_bit_math_h_l40_c3_e267 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_e267_cond,
layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_be45
layer0_node3_MUX_bit_math_h_l51_c3_be45 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_be45_cond,
layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_c0dc
layer0_node4_MUX_bit_math_h_l62_c3_c0dc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond,
layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_e5aa
layer0_node5_MUX_bit_math_h_l73_c3_e5aa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond,
layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_ad85
layer0_node6_MUX_bit_math_h_l84_c3_ad85 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond,
layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_b50b
layer0_node7_MUX_bit_math_h_l95_c3_b50b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond,
layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_0f1b
layer0_node8_MUX_bit_math_h_l106_c3_0f1b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond,
layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_8d92
layer0_node9_MUX_bit_math_h_l117_c3_8d92 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond,
layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_1f7d
layer0_node10_MUX_bit_math_h_l128_c3_1f7d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond,
layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_a41d
layer0_node11_MUX_bit_math_h_l139_c3_a41d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond,
layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_2c7e
layer0_node12_MUX_bit_math_h_l150_c3_2c7e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond,
layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_e70d
layer0_node13_MUX_bit_math_h_l161_c3_e70d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond,
layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_8ec7
layer0_node14_MUX_bit_math_h_l172_c3_8ec7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond,
layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_09fa
layer0_node15_MUX_bit_math_h_l183_c3_09fa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond,
layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_07fe
layer0_node16_MUX_bit_math_h_l194_c3_07fe : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond,
layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_48ad
layer0_node17_MUX_bit_math_h_l205_c3_48ad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond,
layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_15d8
layer0_node18_MUX_bit_math_h_l216_c3_15d8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond,
layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_9ed6
layer0_node19_MUX_bit_math_h_l227_c3_9ed6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond,
layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_de4d
layer0_node20_MUX_bit_math_h_l238_c3_de4d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond,
layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_55cf
layer0_node21_MUX_bit_math_h_l249_c3_55cf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond,
layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_b840
layer0_node22_MUX_bit_math_h_l260_c3_b840 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_b840_cond,
layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_f8f4
layer0_node23_MUX_bit_math_h_l271_c3_f8f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond,
layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_66be
layer0_node24_MUX_bit_math_h_l282_c3_66be : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_66be_cond,
layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_05f2
layer0_node25_MUX_bit_math_h_l293_c3_05f2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond,
layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_2f62
layer0_node26_MUX_bit_math_h_l304_c3_2f62 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond,
layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_2f94
layer0_node27_MUX_bit_math_h_l315_c3_2f94 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond,
layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_4173
layer0_node28_MUX_bit_math_h_l326_c3_4173 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_4173_cond,
layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_ec1a
layer0_node29_MUX_bit_math_h_l337_c3_ec1a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond,
layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_f286
layer0_node30_MUX_bit_math_h_l348_c3_f286 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_f286_cond,
layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_0437
layer0_node31_MUX_bit_math_h_l359_c3_0437 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_0437_cond,
layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_9610
layer1_node0_MUX_bit_math_h_l376_c3_9610 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_9610_cond,
layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_0a5c
layer1_node1_MUX_bit_math_h_l387_c3_0a5c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond,
layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_c136
layer1_node2_MUX_bit_math_h_l398_c3_c136 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_c136_cond,
layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_cf04
layer1_node3_MUX_bit_math_h_l409_c3_cf04 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond,
layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_e52c
layer1_node4_MUX_bit_math_h_l420_c3_e52c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond,
layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_601a
layer1_node5_MUX_bit_math_h_l431_c3_601a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_601a_cond,
layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_68c5
layer1_node6_MUX_bit_math_h_l442_c3_68c5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond,
layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_6aa4
layer1_node7_MUX_bit_math_h_l453_c3_6aa4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond,
layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_c93a
layer1_node8_MUX_bit_math_h_l464_c3_c93a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond,
layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_a8ed
layer1_node9_MUX_bit_math_h_l475_c3_a8ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond,
layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_c1bc
layer1_node10_MUX_bit_math_h_l486_c3_c1bc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond,
layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_badb
layer1_node11_MUX_bit_math_h_l497_c3_badb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_badb_cond,
layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_986f
layer1_node12_MUX_bit_math_h_l508_c3_986f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_986f_cond,
layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_0b54
layer1_node13_MUX_bit_math_h_l519_c3_0b54 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond,
layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_8065
layer1_node14_MUX_bit_math_h_l530_c3_8065 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_8065_cond,
layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_6160
layer1_node15_MUX_bit_math_h_l541_c3_6160 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_6160_cond,
layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_3bef
layer2_node0_MUX_bit_math_h_l558_c3_3bef : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond,
layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_fd4b
layer2_node1_MUX_bit_math_h_l569_c3_fd4b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond,
layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_4818
layer2_node2_MUX_bit_math_h_l580_c3_4818 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_4818_cond,
layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_cd5e
layer2_node3_MUX_bit_math_h_l591_c3_cd5e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond,
layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_d046
layer2_node4_MUX_bit_math_h_l602_c3_d046 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_d046_cond,
layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_b995
layer2_node5_MUX_bit_math_h_l613_c3_b995 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_b995_cond,
layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_59ca
layer2_node6_MUX_bit_math_h_l624_c3_59ca : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond,
layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_27eb
layer2_node7_MUX_bit_math_h_l635_c3_27eb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond,
layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_fba9
layer3_node0_MUX_bit_math_h_l652_c3_fba9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond,
layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_ab2b
layer3_node1_MUX_bit_math_h_l663_c3_ab2b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond,
layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_d6e7
layer3_node2_MUX_bit_math_h_l674_c3_d6e7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond,
layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_8b38
layer3_node3_MUX_bit_math_h_l685_c3_8b38 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond,
layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_5291
layer4_node0_MUX_bit_math_h_l702_c3_5291 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_5291_cond,
layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_d949
layer4_node1_MUX_bit_math_h_l713_c3_d949 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_d949_cond,
layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_cf5c
layer5_node0_MUX_bit_math_h_l730_c3_cf5c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond,
layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_7d97_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_0b28_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue := VAR_in9;
     -- uint6_2_2[bit_math_h_l554_c10_110a] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output := uint6_2_2(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_7d97] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_7d97_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_1_1[bit_math_h_l372_c10_e868] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_43a1] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output := uint6_3_3(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_0b28] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_0b28_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_8e68] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output := uint6_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond := VAR_uint6_0_0_bit_math_h_l14_c10_8e68_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond := VAR_uint6_1_1_bit_math_h_l372_c10_e868_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond := VAR_uint6_2_2_bit_math_h_l554_c10_110a_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond := VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond := VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond := VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond := VAR_uint6_3_3_bit_math_h_l648_c10_43a1_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_cond := VAR_uint6_4_4_bit_math_h_l698_c10_7d97_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_cond := VAR_uint6_4_4_bit_math_h_l698_c10_7d97_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond := VAR_uint6_5_5_bit_math_h_l726_c10_0b28_return_output;
     -- layer0_node8_MUX[bit_math_h_l106_c3_0f1b] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output := layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_66be] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_66be_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output := layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_0437] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_0437_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output := layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_8d92] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output := layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_2f94] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output := layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_48ad] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output := layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d8bb] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_b50b] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output := layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_e5aa] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output := layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_de4d] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output := layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_55cf] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output := layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_e267] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_e267_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output := layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_05f2] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output := layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_e70d] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output := layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_8ec7] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output := layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_09fa] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output := layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_15d8] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output := layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_f8f4] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output := layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_9ed6] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output := layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_ec1a] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output := layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_c0dc] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output := layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_be45] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_be45_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output := layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_ad85] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output := layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_b840] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_b840_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output := layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_a41d] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output := layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_f3ed] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output := layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_07fe] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output := layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_2c7e] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output := layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_2f62] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output := layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_f286] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_f286_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output := layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_1f7d] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output := layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_4173] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_4173_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output := layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_f3ed_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_1f7d_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_a41d_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_2c7e_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_e70d_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_8ec7_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_09fa_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_07fe_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_48ad_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_15d8_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_9ed6_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d8bb_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_de4d_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_55cf_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_b840_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_f8f4_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_66be_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_05f2_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_2f62_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_2f94_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_4173_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_ec1a_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_e267_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_f286_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_0437_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_be45_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_c0dc_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_e5aa_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad85_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_b50b_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_0f1b_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_8d92_return_output;
     -- layer1_node6_MUX[bit_math_h_l442_c3_68c5] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output := layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_c136] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_c136_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output := layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_c1bc] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output := layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_badb] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_badb_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output := layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_0b54] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output := layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_9610] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_9610_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output := layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_986f] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_986f_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output := layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_e52c] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output := layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_a8ed] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output := layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_6aa4] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output := layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_cf04] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output := layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_8065] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_8065_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output := layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_0a5c] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output := layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_6160] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_6160_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output := layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_c93a] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output := layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_601a] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_601a_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output := layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_9610_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_c1bc_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_badb_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_986f_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_0b54_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_8065_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_6160_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_0a5c_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_c136_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_cf04_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_e52c_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_601a_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_68c5_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_6aa4_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_c93a_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_a8ed_return_output;
     -- layer2_node4_MUX[bit_math_h_l602_c3_d046] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_d046_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output := layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_3bef] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output := layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output;

     -- layer2_node6_MUX[bit_math_h_l624_c3_59ca] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output := layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_4818] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_4818_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output := layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_cd5e] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output := layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_b995] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_b995_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output := layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_fd4b] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output := layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_27eb] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output := layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_3bef_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_fd4b_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_4818_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_cd5e_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_d046_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_b995_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_59ca_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_27eb_return_output;
     -- layer3_node1_MUX[bit_math_h_l663_c3_ab2b] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output := layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_fba9] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output := layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output;

     -- layer3_node2_MUX[bit_math_h_l674_c3_d6e7] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output := layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_8b38] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output := layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_fba9_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_ab2b_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_d6e7_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_8b38_return_output;
     -- layer4_node0_MUX[bit_math_h_l702_c3_5291] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_5291_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output := layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output;

     -- layer4_node1_MUX[bit_math_h_l713_c3_d949] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_d949_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output := layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_5291_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_d949_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_cf5c] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output := layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_cf5c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
