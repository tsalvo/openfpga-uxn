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
-- layer0_node0_MUX[bit_math_h_l18_c3_8c11]
signal layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_16eb]
signal layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_66fd]
signal layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_3f5a]
signal layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_d4a2]
signal layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_1b92]
signal layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_d59f]
signal layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_48f6]
signal layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_f1ce]
signal layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_efff]
signal layer0_node9_MUX_bit_math_h_l117_c3_efff_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_773a]
signal layer0_node10_MUX_bit_math_h_l128_c3_773a_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_5fa5]
signal layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_a8c2]
signal layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_5768]
signal layer0_node13_MUX_bit_math_h_l161_c3_5768_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_0ed1]
signal layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_0e79]
signal layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_9c05]
signal layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_accc]
signal layer0_node17_MUX_bit_math_h_l205_c3_accc_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_fd32]
signal layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_441c]
signal layer0_node19_MUX_bit_math_h_l227_c3_441c_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_5199]
signal layer0_node20_MUX_bit_math_h_l238_c3_5199_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_dc43]
signal layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_86b6]
signal layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_394e]
signal layer0_node23_MUX_bit_math_h_l271_c3_394e_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_0d64]
signal layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_fec4]
signal layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_cf48]
signal layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_5d7c]
signal layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_a0da]
signal layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_34fa]
signal layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_3768]
signal layer0_node30_MUX_bit_math_h_l348_c3_3768_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_eb79]
signal layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_a564]
signal layer1_node0_MUX_bit_math_h_l376_c3_a564_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_64bf]
signal layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_15be]
signal layer1_node2_MUX_bit_math_h_l398_c3_15be_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_6023]
signal layer1_node3_MUX_bit_math_h_l409_c3_6023_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_e0d8]
signal layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_aea2]
signal layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_c628]
signal layer1_node6_MUX_bit_math_h_l442_c3_c628_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_60ff]
signal layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_42b7]
signal layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_d6fa]
signal layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_e7d6]
signal layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_e27c]
signal layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_2ac1]
signal layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_7974]
signal layer1_node13_MUX_bit_math_h_l519_c3_7974_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_e43c]
signal layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_3765]
signal layer1_node15_MUX_bit_math_h_l541_c3_3765_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_6fa3]
signal layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_7cf5]
signal layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_9256]
signal layer2_node2_MUX_bit_math_h_l580_c3_9256_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_8402]
signal layer2_node3_MUX_bit_math_h_l591_c3_8402_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_0ffd]
signal layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_f0f4]
signal layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_541f]
signal layer2_node6_MUX_bit_math_h_l624_c3_541f_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_3d85]
signal layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_c9b1]
signal layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_9e31]
signal layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_8cc9]
signal layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_72f6]
signal layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_7c82]
signal layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_dcf1]
signal layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_9f26]
signal layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_8c11
layer0_node0_MUX_bit_math_h_l18_c3_8c11 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond,
layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_16eb
layer0_node1_MUX_bit_math_h_l29_c3_16eb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond,
layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_66fd
layer0_node2_MUX_bit_math_h_l40_c3_66fd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond,
layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_3f5a
layer0_node3_MUX_bit_math_h_l51_c3_3f5a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond,
layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_d4a2
layer0_node4_MUX_bit_math_h_l62_c3_d4a2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond,
layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_1b92
layer0_node5_MUX_bit_math_h_l73_c3_1b92 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond,
layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_d59f
layer0_node6_MUX_bit_math_h_l84_c3_d59f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond,
layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_48f6
layer0_node7_MUX_bit_math_h_l95_c3_48f6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond,
layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_f1ce
layer0_node8_MUX_bit_math_h_l106_c3_f1ce : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond,
layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_efff
layer0_node9_MUX_bit_math_h_l117_c3_efff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_efff_cond,
layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_773a
layer0_node10_MUX_bit_math_h_l128_c3_773a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_773a_cond,
layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_5fa5
layer0_node11_MUX_bit_math_h_l139_c3_5fa5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond,
layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_a8c2
layer0_node12_MUX_bit_math_h_l150_c3_a8c2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond,
layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_5768
layer0_node13_MUX_bit_math_h_l161_c3_5768 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_5768_cond,
layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_0ed1
layer0_node14_MUX_bit_math_h_l172_c3_0ed1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond,
layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_0e79
layer0_node15_MUX_bit_math_h_l183_c3_0e79 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond,
layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_9c05
layer0_node16_MUX_bit_math_h_l194_c3_9c05 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond,
layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_accc
layer0_node17_MUX_bit_math_h_l205_c3_accc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_accc_cond,
layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_fd32
layer0_node18_MUX_bit_math_h_l216_c3_fd32 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond,
layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_441c
layer0_node19_MUX_bit_math_h_l227_c3_441c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_441c_cond,
layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_5199
layer0_node20_MUX_bit_math_h_l238_c3_5199 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_5199_cond,
layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_dc43
layer0_node21_MUX_bit_math_h_l249_c3_dc43 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond,
layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_86b6
layer0_node22_MUX_bit_math_h_l260_c3_86b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond,
layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_394e
layer0_node23_MUX_bit_math_h_l271_c3_394e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_394e_cond,
layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_0d64
layer0_node24_MUX_bit_math_h_l282_c3_0d64 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond,
layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_fec4
layer0_node25_MUX_bit_math_h_l293_c3_fec4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond,
layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_cf48
layer0_node26_MUX_bit_math_h_l304_c3_cf48 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond,
layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_5d7c
layer0_node27_MUX_bit_math_h_l315_c3_5d7c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond,
layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_a0da
layer0_node28_MUX_bit_math_h_l326_c3_a0da : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond,
layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_34fa
layer0_node29_MUX_bit_math_h_l337_c3_34fa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond,
layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_3768
layer0_node30_MUX_bit_math_h_l348_c3_3768 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_3768_cond,
layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_eb79
layer0_node31_MUX_bit_math_h_l359_c3_eb79 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond,
layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_a564
layer1_node0_MUX_bit_math_h_l376_c3_a564 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_a564_cond,
layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_64bf
layer1_node1_MUX_bit_math_h_l387_c3_64bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond,
layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_15be
layer1_node2_MUX_bit_math_h_l398_c3_15be : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_15be_cond,
layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_6023
layer1_node3_MUX_bit_math_h_l409_c3_6023 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_6023_cond,
layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_e0d8
layer1_node4_MUX_bit_math_h_l420_c3_e0d8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond,
layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_aea2
layer1_node5_MUX_bit_math_h_l431_c3_aea2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond,
layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_c628
layer1_node6_MUX_bit_math_h_l442_c3_c628 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_c628_cond,
layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_60ff
layer1_node7_MUX_bit_math_h_l453_c3_60ff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond,
layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_42b7
layer1_node8_MUX_bit_math_h_l464_c3_42b7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond,
layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_d6fa
layer1_node9_MUX_bit_math_h_l475_c3_d6fa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond,
layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_e7d6
layer1_node10_MUX_bit_math_h_l486_c3_e7d6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond,
layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_e27c
layer1_node11_MUX_bit_math_h_l497_c3_e27c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond,
layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_2ac1
layer1_node12_MUX_bit_math_h_l508_c3_2ac1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond,
layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_7974
layer1_node13_MUX_bit_math_h_l519_c3_7974 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_7974_cond,
layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_e43c
layer1_node14_MUX_bit_math_h_l530_c3_e43c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond,
layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_3765
layer1_node15_MUX_bit_math_h_l541_c3_3765 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_3765_cond,
layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_6fa3
layer2_node0_MUX_bit_math_h_l558_c3_6fa3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond,
layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_7cf5
layer2_node1_MUX_bit_math_h_l569_c3_7cf5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond,
layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_9256
layer2_node2_MUX_bit_math_h_l580_c3_9256 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_9256_cond,
layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_8402
layer2_node3_MUX_bit_math_h_l591_c3_8402 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_8402_cond,
layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_0ffd
layer2_node4_MUX_bit_math_h_l602_c3_0ffd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond,
layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_f0f4
layer2_node5_MUX_bit_math_h_l613_c3_f0f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond,
layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_541f
layer2_node6_MUX_bit_math_h_l624_c3_541f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_541f_cond,
layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_3d85
layer2_node7_MUX_bit_math_h_l635_c3_3d85 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond,
layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_c9b1
layer3_node0_MUX_bit_math_h_l652_c3_c9b1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond,
layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_9e31
layer3_node1_MUX_bit_math_h_l663_c3_9e31 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond,
layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_8cc9
layer3_node2_MUX_bit_math_h_l674_c3_8cc9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond,
layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_72f6
layer3_node3_MUX_bit_math_h_l685_c3_72f6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond,
layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_7c82
layer4_node0_MUX_bit_math_h_l702_c3_7c82 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond,
layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_dcf1
layer4_node1_MUX_bit_math_h_l713_c3_dcf1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond,
layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_9f26
layer5_node0_MUX_bit_math_h_l730_c3_9f26 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond,
layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_0f03_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_d4c4_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue := VAR_in9;
     -- uint6_2_2[bit_math_h_l554_c10_0dd9] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output := uint6_2_2(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_c0cf] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output := uint6_3_3(
     VAR_sel);

     -- uint6_1_1[bit_math_h_l372_c10_832b] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_0f03] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_0f03_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_5_5[bit_math_h_l726_c10_d4c4] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_d4c4_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_b6c0] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output := uint6_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_cond := VAR_uint6_0_0_bit_math_h_l14_c10_b6c0_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond := VAR_uint6_1_1_bit_math_h_l372_c10_832b_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond := VAR_uint6_2_2_bit_math_h_l554_c10_0dd9_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c0cf_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond := VAR_uint6_4_4_bit_math_h_l698_c10_0f03_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond := VAR_uint6_4_4_bit_math_h_l698_c10_0f03_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond := VAR_uint6_5_5_bit_math_h_l726_c10_d4c4_return_output;
     -- layer0_node0_MUX[bit_math_h_l18_c3_8c11] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output := layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_5d7c] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output := layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_3768] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_3768_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output := layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_5199] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_5199_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output := layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_0e79] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output := layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_dc43] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output := layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_394e] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_394e_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output := layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_5fa5] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output := layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_441c] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_441c_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output := layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_0ed1] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output := layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_fec4] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output := layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_48f6] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output := layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_9c05] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output := layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_34fa] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output := layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_66fd] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output := layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_3f5a] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output := layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_16eb] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output := layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_86b6] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output := layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_efff] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_efff_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output := layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_d59f] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output := layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_a0da] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output := layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_accc] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_accc_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output := layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_a8c2] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output := layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_0d64] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output := layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_1b92] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output := layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_eb79] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output := layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_773a] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_773a_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output := layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_cf48] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output := layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_f1ce] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output := layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_fd32] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output := layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_5768] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_5768_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output := layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_d4a2] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output := layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_8c11_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_773a_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_5fa5_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_a8c2_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_5768_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_0ed1_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_0e79_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_9c05_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_accc_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_fd32_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_441c_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_16eb_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_5199_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_dc43_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_86b6_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_394e_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_0d64_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_fec4_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_cf48_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_5d7c_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_a0da_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_34fa_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_66fd_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_3768_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_eb79_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_3f5a_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_d4a2_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_1b92_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_d59f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_48f6_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_f1ce_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_efff_return_output;
     -- layer1_node9_MUX[bit_math_h_l475_c3_d6fa] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output := layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_aea2] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output := layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_64bf] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output := layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_42b7] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output := layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_60ff] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output := layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_a564] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_a564_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output := layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_7974] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_7974_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output := layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_c628] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_c628_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output := layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_e0d8] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output := layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_3765] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_3765_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output := layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_15be] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_15be_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output := layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_e7d6] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output := layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_2ac1] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output := layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output;

     -- layer1_node11_MUX[bit_math_h_l497_c3_e27c] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output := layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_e43c] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output := layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_6023] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_6023_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output := layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_a564_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_e7d6_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_e27c_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_2ac1_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_7974_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_e43c_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_3765_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_64bf_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_15be_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_6023_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_e0d8_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_aea2_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_c628_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_60ff_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_42b7_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_d6fa_return_output;
     -- layer2_node1_MUX[bit_math_h_l569_c3_7cf5] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output := layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_6fa3] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output := layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_8402] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_8402_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output := layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_9256] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_9256_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output := layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_3d85] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output := layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output;

     -- layer2_node4_MUX[bit_math_h_l602_c3_0ffd] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output := layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output;

     -- layer2_node6_MUX[bit_math_h_l624_c3_541f] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_541f_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output := layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_f0f4] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output := layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_6fa3_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_7cf5_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_9256_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_8402_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_0ffd_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_f0f4_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_541f_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_3d85_return_output;
     -- layer3_node0_MUX[bit_math_h_l652_c3_c9b1] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output := layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output;

     -- layer3_node2_MUX[bit_math_h_l674_c3_8cc9] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output := layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_72f6] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output := layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output;

     -- layer3_node1_MUX[bit_math_h_l663_c3_9e31] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output := layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_c9b1_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_9e31_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_8cc9_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_72f6_return_output;
     -- layer4_node0_MUX[bit_math_h_l702_c3_7c82] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output := layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output;

     -- layer4_node1_MUX[bit_math_h_l713_c3_dcf1] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output := layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_7c82_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_dcf1_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_9f26] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output := layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_9f26_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
