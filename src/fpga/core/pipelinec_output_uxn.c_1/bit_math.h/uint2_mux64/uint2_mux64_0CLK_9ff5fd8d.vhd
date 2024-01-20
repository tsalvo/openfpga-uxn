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
-- layer0_node0_MUX[bit_math_h_l18_c3_e76d]
signal layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse : unsigned(1 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output : unsigned(1 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_11ab]
signal layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse : unsigned(1 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output : unsigned(1 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_8546]
signal layer0_node2_MUX_bit_math_h_l40_c3_8546_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse : unsigned(1 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output : unsigned(1 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_179c]
signal layer0_node3_MUX_bit_math_h_l51_c3_179c_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse : unsigned(1 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output : unsigned(1 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_42c6]
signal layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse : unsigned(1 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output : unsigned(1 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_cf62]
signal layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse : unsigned(1 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output : unsigned(1 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_26cb]
signal layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse : unsigned(1 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output : unsigned(1 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_665f]
signal layer0_node7_MUX_bit_math_h_l95_c3_665f_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse : unsigned(1 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output : unsigned(1 downto 0);

-- layer0_node8_MUX[bit_math_h_l106_c3_43f9]
signal layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond : unsigned(0 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse : unsigned(1 downto 0);
signal layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output : unsigned(1 downto 0);

-- layer0_node9_MUX[bit_math_h_l117_c3_4b1f]
signal layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond : unsigned(0 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse : unsigned(1 downto 0);
signal layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output : unsigned(1 downto 0);

-- layer0_node10_MUX[bit_math_h_l128_c3_6ff0]
signal layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond : unsigned(0 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse : unsigned(1 downto 0);
signal layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output : unsigned(1 downto 0);

-- layer0_node11_MUX[bit_math_h_l139_c3_a1dd]
signal layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond : unsigned(0 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse : unsigned(1 downto 0);
signal layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output : unsigned(1 downto 0);

-- layer0_node12_MUX[bit_math_h_l150_c3_8f05]
signal layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond : unsigned(0 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse : unsigned(1 downto 0);
signal layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output : unsigned(1 downto 0);

-- layer0_node13_MUX[bit_math_h_l161_c3_837e]
signal layer0_node13_MUX_bit_math_h_l161_c3_837e_cond : unsigned(0 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse : unsigned(1 downto 0);
signal layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output : unsigned(1 downto 0);

-- layer0_node14_MUX[bit_math_h_l172_c3_6222]
signal layer0_node14_MUX_bit_math_h_l172_c3_6222_cond : unsigned(0 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse : unsigned(1 downto 0);
signal layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output : unsigned(1 downto 0);

-- layer0_node15_MUX[bit_math_h_l183_c3_a1b5]
signal layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond : unsigned(0 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse : unsigned(1 downto 0);
signal layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output : unsigned(1 downto 0);

-- layer0_node16_MUX[bit_math_h_l194_c3_35f8]
signal layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond : unsigned(0 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse : unsigned(1 downto 0);
signal layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output : unsigned(1 downto 0);

-- layer0_node17_MUX[bit_math_h_l205_c3_bcf5]
signal layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond : unsigned(0 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse : unsigned(1 downto 0);
signal layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output : unsigned(1 downto 0);

-- layer0_node18_MUX[bit_math_h_l216_c3_a7e7]
signal layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond : unsigned(0 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse : unsigned(1 downto 0);
signal layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output : unsigned(1 downto 0);

-- layer0_node19_MUX[bit_math_h_l227_c3_bc7c]
signal layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond : unsigned(0 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse : unsigned(1 downto 0);
signal layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output : unsigned(1 downto 0);

-- layer0_node20_MUX[bit_math_h_l238_c3_e6f9]
signal layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond : unsigned(0 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse : unsigned(1 downto 0);
signal layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output : unsigned(1 downto 0);

-- layer0_node21_MUX[bit_math_h_l249_c3_2811]
signal layer0_node21_MUX_bit_math_h_l249_c3_2811_cond : unsigned(0 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse : unsigned(1 downto 0);
signal layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output : unsigned(1 downto 0);

-- layer0_node22_MUX[bit_math_h_l260_c3_10a0]
signal layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond : unsigned(0 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse : unsigned(1 downto 0);
signal layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output : unsigned(1 downto 0);

-- layer0_node23_MUX[bit_math_h_l271_c3_0434]
signal layer0_node23_MUX_bit_math_h_l271_c3_0434_cond : unsigned(0 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse : unsigned(1 downto 0);
signal layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output : unsigned(1 downto 0);

-- layer0_node24_MUX[bit_math_h_l282_c3_40fb]
signal layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond : unsigned(0 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse : unsigned(1 downto 0);
signal layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output : unsigned(1 downto 0);

-- layer0_node25_MUX[bit_math_h_l293_c3_a8db]
signal layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond : unsigned(0 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse : unsigned(1 downto 0);
signal layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output : unsigned(1 downto 0);

-- layer0_node26_MUX[bit_math_h_l304_c3_3563]
signal layer0_node26_MUX_bit_math_h_l304_c3_3563_cond : unsigned(0 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse : unsigned(1 downto 0);
signal layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output : unsigned(1 downto 0);

-- layer0_node27_MUX[bit_math_h_l315_c3_09dd]
signal layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond : unsigned(0 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse : unsigned(1 downto 0);
signal layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output : unsigned(1 downto 0);

-- layer0_node28_MUX[bit_math_h_l326_c3_f872]
signal layer0_node28_MUX_bit_math_h_l326_c3_f872_cond : unsigned(0 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse : unsigned(1 downto 0);
signal layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output : unsigned(1 downto 0);

-- layer0_node29_MUX[bit_math_h_l337_c3_b3c9]
signal layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond : unsigned(0 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse : unsigned(1 downto 0);
signal layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output : unsigned(1 downto 0);

-- layer0_node30_MUX[bit_math_h_l348_c3_7168]
signal layer0_node30_MUX_bit_math_h_l348_c3_7168_cond : unsigned(0 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse : unsigned(1 downto 0);
signal layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output : unsigned(1 downto 0);

-- layer0_node31_MUX[bit_math_h_l359_c3_6e93]
signal layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond : unsigned(0 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse : unsigned(1 downto 0);
signal layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output : unsigned(1 downto 0);

-- layer1_node0_MUX[bit_math_h_l376_c3_6f68]
signal layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse : unsigned(1 downto 0);
signal layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output : unsigned(1 downto 0);

-- layer1_node1_MUX[bit_math_h_l387_c3_11e3]
signal layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse : unsigned(1 downto 0);
signal layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output : unsigned(1 downto 0);

-- layer1_node2_MUX[bit_math_h_l398_c3_0298]
signal layer1_node2_MUX_bit_math_h_l398_c3_0298_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse : unsigned(1 downto 0);
signal layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output : unsigned(1 downto 0);

-- layer1_node3_MUX[bit_math_h_l409_c3_34bf]
signal layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse : unsigned(1 downto 0);
signal layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output : unsigned(1 downto 0);

-- layer1_node4_MUX[bit_math_h_l420_c3_6a92]
signal layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond : unsigned(0 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse : unsigned(1 downto 0);
signal layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output : unsigned(1 downto 0);

-- layer1_node5_MUX[bit_math_h_l431_c3_4d17]
signal layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond : unsigned(0 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse : unsigned(1 downto 0);
signal layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output : unsigned(1 downto 0);

-- layer1_node6_MUX[bit_math_h_l442_c3_2b21]
signal layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond : unsigned(0 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse : unsigned(1 downto 0);
signal layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output : unsigned(1 downto 0);

-- layer1_node7_MUX[bit_math_h_l453_c3_5714]
signal layer1_node7_MUX_bit_math_h_l453_c3_5714_cond : unsigned(0 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse : unsigned(1 downto 0);
signal layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output : unsigned(1 downto 0);

-- layer1_node8_MUX[bit_math_h_l464_c3_6be3]
signal layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond : unsigned(0 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse : unsigned(1 downto 0);
signal layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output : unsigned(1 downto 0);

-- layer1_node9_MUX[bit_math_h_l475_c3_73c6]
signal layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond : unsigned(0 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse : unsigned(1 downto 0);
signal layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output : unsigned(1 downto 0);

-- layer1_node10_MUX[bit_math_h_l486_c3_6e37]
signal layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond : unsigned(0 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse : unsigned(1 downto 0);
signal layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output : unsigned(1 downto 0);

-- layer1_node11_MUX[bit_math_h_l497_c3_2b4d]
signal layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond : unsigned(0 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse : unsigned(1 downto 0);
signal layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output : unsigned(1 downto 0);

-- layer1_node12_MUX[bit_math_h_l508_c3_d36b]
signal layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond : unsigned(0 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse : unsigned(1 downto 0);
signal layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output : unsigned(1 downto 0);

-- layer1_node13_MUX[bit_math_h_l519_c3_d9a8]
signal layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond : unsigned(0 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse : unsigned(1 downto 0);
signal layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output : unsigned(1 downto 0);

-- layer1_node14_MUX[bit_math_h_l530_c3_3e4e]
signal layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond : unsigned(0 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse : unsigned(1 downto 0);
signal layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output : unsigned(1 downto 0);

-- layer1_node15_MUX[bit_math_h_l541_c3_71ed]
signal layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond : unsigned(0 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse : unsigned(1 downto 0);
signal layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output : unsigned(1 downto 0);

-- layer2_node0_MUX[bit_math_h_l558_c3_1ed8]
signal layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse : unsigned(1 downto 0);
signal layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output : unsigned(1 downto 0);

-- layer2_node1_MUX[bit_math_h_l569_c3_981b]
signal layer2_node1_MUX_bit_math_h_l569_c3_981b_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse : unsigned(1 downto 0);
signal layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output : unsigned(1 downto 0);

-- layer2_node2_MUX[bit_math_h_l580_c3_8ef4]
signal layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond : unsigned(0 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse : unsigned(1 downto 0);
signal layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output : unsigned(1 downto 0);

-- layer2_node3_MUX[bit_math_h_l591_c3_46d6]
signal layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond : unsigned(0 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse : unsigned(1 downto 0);
signal layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output : unsigned(1 downto 0);

-- layer2_node4_MUX[bit_math_h_l602_c3_94c5]
signal layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond : unsigned(0 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse : unsigned(1 downto 0);
signal layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output : unsigned(1 downto 0);

-- layer2_node5_MUX[bit_math_h_l613_c3_9d7c]
signal layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond : unsigned(0 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse : unsigned(1 downto 0);
signal layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output : unsigned(1 downto 0);

-- layer2_node6_MUX[bit_math_h_l624_c3_b21c]
signal layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond : unsigned(0 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse : unsigned(1 downto 0);
signal layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output : unsigned(1 downto 0);

-- layer2_node7_MUX[bit_math_h_l635_c3_d573]
signal layer2_node7_MUX_bit_math_h_l635_c3_d573_cond : unsigned(0 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse : unsigned(1 downto 0);
signal layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output : unsigned(1 downto 0);

-- layer3_node0_MUX[bit_math_h_l652_c3_7056]
signal layer3_node0_MUX_bit_math_h_l652_c3_7056_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse : unsigned(1 downto 0);
signal layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output : unsigned(1 downto 0);

-- layer3_node1_MUX[bit_math_h_l663_c3_d7e9]
signal layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond : unsigned(0 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse : unsigned(1 downto 0);
signal layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output : unsigned(1 downto 0);

-- layer3_node2_MUX[bit_math_h_l674_c3_358e]
signal layer3_node2_MUX_bit_math_h_l674_c3_358e_cond : unsigned(0 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse : unsigned(1 downto 0);
signal layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output : unsigned(1 downto 0);

-- layer3_node3_MUX[bit_math_h_l685_c3_0bd8]
signal layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond : unsigned(0 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse : unsigned(1 downto 0);
signal layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output : unsigned(1 downto 0);

-- layer4_node0_MUX[bit_math_h_l702_c3_8860]
signal layer4_node0_MUX_bit_math_h_l702_c3_8860_cond : unsigned(0 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse : unsigned(1 downto 0);
signal layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output : unsigned(1 downto 0);

-- layer4_node1_MUX[bit_math_h_l713_c3_ff1e]
signal layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond : unsigned(0 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse : unsigned(1 downto 0);
signal layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output : unsigned(1 downto 0);

-- layer5_node0_MUX[bit_math_h_l730_c3_3a76]
signal layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond : unsigned(0 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse : unsigned(1 downto 0);
signal layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output : unsigned(1 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_e76d
layer0_node0_MUX_bit_math_h_l18_c3_e76d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond,
layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_11ab
layer0_node1_MUX_bit_math_h_l29_c3_11ab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond,
layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_8546
layer0_node2_MUX_bit_math_h_l40_c3_8546 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_8546_cond,
layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_179c
layer0_node3_MUX_bit_math_h_l51_c3_179c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_179c_cond,
layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_42c6
layer0_node4_MUX_bit_math_h_l62_c3_42c6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond,
layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_cf62
layer0_node5_MUX_bit_math_h_l73_c3_cf62 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond,
layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_26cb
layer0_node6_MUX_bit_math_h_l84_c3_26cb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond,
layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_665f
layer0_node7_MUX_bit_math_h_l95_c3_665f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_665f_cond,
layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output);

-- layer0_node8_MUX_bit_math_h_l106_c3_43f9
layer0_node8_MUX_bit_math_h_l106_c3_43f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond,
layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue,
layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse,
layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output);

-- layer0_node9_MUX_bit_math_h_l117_c3_4b1f
layer0_node9_MUX_bit_math_h_l117_c3_4b1f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond,
layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue,
layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse,
layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output);

-- layer0_node10_MUX_bit_math_h_l128_c3_6ff0
layer0_node10_MUX_bit_math_h_l128_c3_6ff0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond,
layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue,
layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse,
layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output);

-- layer0_node11_MUX_bit_math_h_l139_c3_a1dd
layer0_node11_MUX_bit_math_h_l139_c3_a1dd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond,
layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue,
layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse,
layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output);

-- layer0_node12_MUX_bit_math_h_l150_c3_8f05
layer0_node12_MUX_bit_math_h_l150_c3_8f05 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond,
layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue,
layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse,
layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output);

-- layer0_node13_MUX_bit_math_h_l161_c3_837e
layer0_node13_MUX_bit_math_h_l161_c3_837e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node13_MUX_bit_math_h_l161_c3_837e_cond,
layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue,
layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse,
layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output);

-- layer0_node14_MUX_bit_math_h_l172_c3_6222
layer0_node14_MUX_bit_math_h_l172_c3_6222 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node14_MUX_bit_math_h_l172_c3_6222_cond,
layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue,
layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse,
layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output);

-- layer0_node15_MUX_bit_math_h_l183_c3_a1b5
layer0_node15_MUX_bit_math_h_l183_c3_a1b5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond,
layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue,
layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse,
layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output);

-- layer0_node16_MUX_bit_math_h_l194_c3_35f8
layer0_node16_MUX_bit_math_h_l194_c3_35f8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond,
layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue,
layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse,
layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output);

-- layer0_node17_MUX_bit_math_h_l205_c3_bcf5
layer0_node17_MUX_bit_math_h_l205_c3_bcf5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond,
layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue,
layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse,
layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output);

-- layer0_node18_MUX_bit_math_h_l216_c3_a7e7
layer0_node18_MUX_bit_math_h_l216_c3_a7e7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond,
layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue,
layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse,
layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output);

-- layer0_node19_MUX_bit_math_h_l227_c3_bc7c
layer0_node19_MUX_bit_math_h_l227_c3_bc7c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond,
layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue,
layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse,
layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output);

-- layer0_node20_MUX_bit_math_h_l238_c3_e6f9
layer0_node20_MUX_bit_math_h_l238_c3_e6f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond,
layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue,
layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse,
layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output);

-- layer0_node21_MUX_bit_math_h_l249_c3_2811
layer0_node21_MUX_bit_math_h_l249_c3_2811 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node21_MUX_bit_math_h_l249_c3_2811_cond,
layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue,
layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse,
layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output);

-- layer0_node22_MUX_bit_math_h_l260_c3_10a0
layer0_node22_MUX_bit_math_h_l260_c3_10a0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond,
layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue,
layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse,
layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output);

-- layer0_node23_MUX_bit_math_h_l271_c3_0434
layer0_node23_MUX_bit_math_h_l271_c3_0434 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node23_MUX_bit_math_h_l271_c3_0434_cond,
layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue,
layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse,
layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output);

-- layer0_node24_MUX_bit_math_h_l282_c3_40fb
layer0_node24_MUX_bit_math_h_l282_c3_40fb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond,
layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue,
layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse,
layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output);

-- layer0_node25_MUX_bit_math_h_l293_c3_a8db
layer0_node25_MUX_bit_math_h_l293_c3_a8db : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond,
layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue,
layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse,
layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output);

-- layer0_node26_MUX_bit_math_h_l304_c3_3563
layer0_node26_MUX_bit_math_h_l304_c3_3563 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node26_MUX_bit_math_h_l304_c3_3563_cond,
layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue,
layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse,
layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output);

-- layer0_node27_MUX_bit_math_h_l315_c3_09dd
layer0_node27_MUX_bit_math_h_l315_c3_09dd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond,
layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue,
layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse,
layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output);

-- layer0_node28_MUX_bit_math_h_l326_c3_f872
layer0_node28_MUX_bit_math_h_l326_c3_f872 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node28_MUX_bit_math_h_l326_c3_f872_cond,
layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue,
layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse,
layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output);

-- layer0_node29_MUX_bit_math_h_l337_c3_b3c9
layer0_node29_MUX_bit_math_h_l337_c3_b3c9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond,
layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue,
layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse,
layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output);

-- layer0_node30_MUX_bit_math_h_l348_c3_7168
layer0_node30_MUX_bit_math_h_l348_c3_7168 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node30_MUX_bit_math_h_l348_c3_7168_cond,
layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue,
layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse,
layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output);

-- layer0_node31_MUX_bit_math_h_l359_c3_6e93
layer0_node31_MUX_bit_math_h_l359_c3_6e93 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond,
layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue,
layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse,
layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output);

-- layer1_node0_MUX_bit_math_h_l376_c3_6f68
layer1_node0_MUX_bit_math_h_l376_c3_6f68 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond,
layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue,
layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse,
layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output);

-- layer1_node1_MUX_bit_math_h_l387_c3_11e3
layer1_node1_MUX_bit_math_h_l387_c3_11e3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond,
layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue,
layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse,
layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output);

-- layer1_node2_MUX_bit_math_h_l398_c3_0298
layer1_node2_MUX_bit_math_h_l398_c3_0298 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l398_c3_0298_cond,
layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue,
layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse,
layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output);

-- layer1_node3_MUX_bit_math_h_l409_c3_34bf
layer1_node3_MUX_bit_math_h_l409_c3_34bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond,
layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue,
layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse,
layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output);

-- layer1_node4_MUX_bit_math_h_l420_c3_6a92
layer1_node4_MUX_bit_math_h_l420_c3_6a92 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond,
layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue,
layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse,
layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output);

-- layer1_node5_MUX_bit_math_h_l431_c3_4d17
layer1_node5_MUX_bit_math_h_l431_c3_4d17 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond,
layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue,
layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse,
layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output);

-- layer1_node6_MUX_bit_math_h_l442_c3_2b21
layer1_node6_MUX_bit_math_h_l442_c3_2b21 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond,
layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue,
layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse,
layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output);

-- layer1_node7_MUX_bit_math_h_l453_c3_5714
layer1_node7_MUX_bit_math_h_l453_c3_5714 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node7_MUX_bit_math_h_l453_c3_5714_cond,
layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue,
layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse,
layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output);

-- layer1_node8_MUX_bit_math_h_l464_c3_6be3
layer1_node8_MUX_bit_math_h_l464_c3_6be3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond,
layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue,
layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse,
layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output);

-- layer1_node9_MUX_bit_math_h_l475_c3_73c6
layer1_node9_MUX_bit_math_h_l475_c3_73c6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond,
layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue,
layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse,
layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output);

-- layer1_node10_MUX_bit_math_h_l486_c3_6e37
layer1_node10_MUX_bit_math_h_l486_c3_6e37 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond,
layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue,
layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse,
layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output);

-- layer1_node11_MUX_bit_math_h_l497_c3_2b4d
layer1_node11_MUX_bit_math_h_l497_c3_2b4d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond,
layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue,
layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse,
layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output);

-- layer1_node12_MUX_bit_math_h_l508_c3_d36b
layer1_node12_MUX_bit_math_h_l508_c3_d36b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond,
layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue,
layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse,
layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output);

-- layer1_node13_MUX_bit_math_h_l519_c3_d9a8
layer1_node13_MUX_bit_math_h_l519_c3_d9a8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond,
layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue,
layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse,
layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output);

-- layer1_node14_MUX_bit_math_h_l530_c3_3e4e
layer1_node14_MUX_bit_math_h_l530_c3_3e4e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond,
layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue,
layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse,
layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output);

-- layer1_node15_MUX_bit_math_h_l541_c3_71ed
layer1_node15_MUX_bit_math_h_l541_c3_71ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond,
layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue,
layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse,
layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output);

-- layer2_node0_MUX_bit_math_h_l558_c3_1ed8
layer2_node0_MUX_bit_math_h_l558_c3_1ed8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond,
layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue,
layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse,
layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output);

-- layer2_node1_MUX_bit_math_h_l569_c3_981b
layer2_node1_MUX_bit_math_h_l569_c3_981b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l569_c3_981b_cond,
layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue,
layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse,
layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output);

-- layer2_node2_MUX_bit_math_h_l580_c3_8ef4
layer2_node2_MUX_bit_math_h_l580_c3_8ef4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond,
layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue,
layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse,
layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output);

-- layer2_node3_MUX_bit_math_h_l591_c3_46d6
layer2_node3_MUX_bit_math_h_l591_c3_46d6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond,
layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue,
layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse,
layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output);

-- layer2_node4_MUX_bit_math_h_l602_c3_94c5
layer2_node4_MUX_bit_math_h_l602_c3_94c5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond,
layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue,
layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse,
layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output);

-- layer2_node5_MUX_bit_math_h_l613_c3_9d7c
layer2_node5_MUX_bit_math_h_l613_c3_9d7c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond,
layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue,
layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse,
layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output);

-- layer2_node6_MUX_bit_math_h_l624_c3_b21c
layer2_node6_MUX_bit_math_h_l624_c3_b21c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond,
layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue,
layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse,
layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output);

-- layer2_node7_MUX_bit_math_h_l635_c3_d573
layer2_node7_MUX_bit_math_h_l635_c3_d573 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer2_node7_MUX_bit_math_h_l635_c3_d573_cond,
layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue,
layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse,
layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output);

-- layer3_node0_MUX_bit_math_h_l652_c3_7056
layer3_node0_MUX_bit_math_h_l652_c3_7056 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l652_c3_7056_cond,
layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue,
layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse,
layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output);

-- layer3_node1_MUX_bit_math_h_l663_c3_d7e9
layer3_node1_MUX_bit_math_h_l663_c3_d7e9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond,
layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue,
layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse,
layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output);

-- layer3_node2_MUX_bit_math_h_l674_c3_358e
layer3_node2_MUX_bit_math_h_l674_c3_358e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node2_MUX_bit_math_h_l674_c3_358e_cond,
layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue,
layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse,
layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output);

-- layer3_node3_MUX_bit_math_h_l685_c3_0bd8
layer3_node3_MUX_bit_math_h_l685_c3_0bd8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond,
layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue,
layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse,
layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output);

-- layer4_node0_MUX_bit_math_h_l702_c3_8860
layer4_node0_MUX_bit_math_h_l702_c3_8860 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node0_MUX_bit_math_h_l702_c3_8860_cond,
layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue,
layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse,
layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output);

-- layer4_node1_MUX_bit_math_h_l713_c3_ff1e
layer4_node1_MUX_bit_math_h_l713_c3_ff1e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond,
layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue,
layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse,
layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output);

-- layer5_node0_MUX_bit_math_h_l730_c3_3a76
layer5_node0_MUX_bit_math_h_l730_c3_3a76 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond,
layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue,
layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse,
layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output,
 layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output,
 layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output,
 layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output,
 layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output,
 layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output,
 layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output,
 layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output,
 layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output,
 layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output,
 layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output,
 layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output,
 layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output,
 layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output,
 layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output,
 layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output,
 layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output,
 layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output,
 layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output,
 layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output,
 layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output,
 layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output,
 layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output,
 layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output,
 layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output,
 layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output,
 layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output,
 layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output,
 layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output,
 layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output,
 layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output,
 layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output,
 layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output,
 layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output,
 layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output,
 layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output,
 layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output,
 layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output,
 layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output,
 layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output,
 layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output,
 layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output,
 layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output,
 layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output,
 layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output,
 layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output,
 layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output,
 layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output,
 layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output,
 layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output,
 layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output,
 layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output,
 layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output,
 layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output,
 layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output,
 layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output)
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
 variable VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node8 : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node9 : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node10 : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node11 : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node12 : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond : unsigned(0 downto 0);
 variable VAR_layer0_node13 : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node14 : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_cond : unsigned(0 downto 0);
 variable VAR_layer0_node15 : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node16 : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node17 : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node18 : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node19 : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node20 : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node21 : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_cond : unsigned(0 downto 0);
 variable VAR_layer0_node22 : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node23 : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_cond : unsigned(0 downto 0);
 variable VAR_layer0_node24 : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node25 : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond : unsigned(0 downto 0);
 variable VAR_layer0_node26 : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_cond : unsigned(0 downto 0);
 variable VAR_layer0_node27 : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node28 : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_cond : unsigned(0 downto 0);
 variable VAR_layer0_node29 : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node30 : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_cond : unsigned(0 downto 0);
 variable VAR_layer0_node31 : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output : unsigned(1 downto 0);
 variable VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond : unsigned(0 downto 0);
 variable VAR_layer1_node4 : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond : unsigned(0 downto 0);
 variable VAR_layer1_node5 : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond : unsigned(0 downto 0);
 variable VAR_layer1_node6 : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond : unsigned(0 downto 0);
 variable VAR_layer1_node7 : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_cond : unsigned(0 downto 0);
 variable VAR_layer1_node8 : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond : unsigned(0 downto 0);
 variable VAR_layer1_node9 : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node10 : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond : unsigned(0 downto 0);
 variable VAR_layer1_node11 : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node12 : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node13 : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node14 : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node15 : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output : unsigned(1 downto 0);
 variable VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node2 : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node3 : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond : unsigned(0 downto 0);
 variable VAR_layer2_node4 : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond : unsigned(0 downto 0);
 variable VAR_layer2_node5 : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node6 : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node7 : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output : unsigned(1 downto 0);
 variable VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_cond : unsigned(0 downto 0);
 variable VAR_layer3_node1 : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond : unsigned(0 downto 0);
 variable VAR_layer3_node2 : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_cond : unsigned(0 downto 0);
 variable VAR_layer3_node3 : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output : unsigned(1 downto 0);
 variable VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond : unsigned(0 downto 0);
 variable VAR_sel4 : unsigned(0 downto 0);
 variable VAR_uint6_4_4_bit_math_h_l698_c10_8694_return_output : unsigned(0 downto 0);
 variable VAR_layer4_node0 : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_cond : unsigned(0 downto 0);
 variable VAR_layer4_node1 : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output : unsigned(1 downto 0);
 variable VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond : unsigned(0 downto 0);
 variable VAR_sel5 : unsigned(0 downto 0);
 variable VAR_uint6_5_5_bit_math_h_l726_c10_25e4_return_output : unsigned(0 downto 0);
 variable VAR_layer5_node0 : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output : unsigned(1 downto 0);
 variable VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue := VAR_in15;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse := VAR_in16;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue := VAR_in17;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse := VAR_in18;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue := VAR_in19;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse := VAR_in2;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse := VAR_in20;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue := VAR_in21;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse := VAR_in22;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue := VAR_in23;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse := VAR_in24;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue := VAR_in25;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse := VAR_in26;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue := VAR_in27;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse := VAR_in28;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue := VAR_in29;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue := VAR_in3;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse := VAR_in30;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue := VAR_in31;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse := VAR_in32;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue := VAR_in33;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse := VAR_in34;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue := VAR_in35;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse := VAR_in36;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue := VAR_in37;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse := VAR_in38;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue := VAR_in39;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse := VAR_in4;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse := VAR_in40;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue := VAR_in41;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse := VAR_in42;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue := VAR_in43;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse := VAR_in44;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue := VAR_in45;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse := VAR_in46;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue := VAR_in47;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse := VAR_in48;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue := VAR_in49;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue := VAR_in5;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse := VAR_in50;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue := VAR_in51;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse := VAR_in52;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue := VAR_in53;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse := VAR_in54;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue := VAR_in55;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse := VAR_in56;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue := VAR_in57;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse := VAR_in58;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue := VAR_in59;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse := VAR_in6;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse := VAR_in60;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue := VAR_in61;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse := VAR_in62;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue := VAR_in63;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue := VAR_in9;
     -- uint6_5_5[bit_math_h_l726_c10_25e4] LATENCY=0
     VAR_uint6_5_5_bit_math_h_l726_c10_25e4_return_output := uint6_5_5(
     VAR_sel);

     -- uint6_1_1[bit_math_h_l372_c10_880e] LATENCY=0
     VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output := uint6_1_1(
     VAR_sel);

     -- uint6_0_0[bit_math_h_l14_c10_ad5a] LATENCY=0
     VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output := uint6_0_0(
     VAR_sel);

     -- uint6_3_3[bit_math_h_l648_c10_c408] LATENCY=0
     VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output := uint6_3_3(
     VAR_sel);

     -- uint6_4_4[bit_math_h_l698_c10_8694] LATENCY=0
     VAR_uint6_4_4_bit_math_h_l698_c10_8694_return_output := uint6_4_4(
     VAR_sel);

     -- uint6_2_2[bit_math_h_l554_c10_d1aa] LATENCY=0
     VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output := uint6_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond := VAR_uint6_0_0_bit_math_h_l14_c10_ad5a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond := VAR_uint6_1_1_bit_math_h_l372_c10_880e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_cond := VAR_uint6_2_2_bit_math_h_l554_c10_d1aa_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond := VAR_uint6_3_3_bit_math_h_l648_c10_c408_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_cond := VAR_uint6_4_4_bit_math_h_l698_c10_8694_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond := VAR_uint6_4_4_bit_math_h_l698_c10_8694_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond := VAR_uint6_5_5_bit_math_h_l726_c10_25e4_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_26cb] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output := layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output;

     -- layer0_node19_MUX[bit_math_h_l227_c3_bc7c] LATENCY=0
     -- Inputs
     layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_cond;
     layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iftrue;
     layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse <= VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_iffalse;
     -- Outputs
     VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output := layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output;

     -- layer0_node10_MUX[bit_math_h_l128_c3_6ff0] LATENCY=0
     -- Inputs
     layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_cond;
     layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iftrue;
     layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse <= VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_iffalse;
     -- Outputs
     VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output := layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output;

     -- layer0_node9_MUX[bit_math_h_l117_c3_4b1f] LATENCY=0
     -- Inputs
     layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_cond;
     layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iftrue;
     layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse <= VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_iffalse;
     -- Outputs
     VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output := layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output;

     -- layer0_node13_MUX[bit_math_h_l161_c3_837e] LATENCY=0
     -- Inputs
     layer0_node13_MUX_bit_math_h_l161_c3_837e_cond <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_cond;
     layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iftrue;
     layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse <= VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_iffalse;
     -- Outputs
     VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output := layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output;

     -- layer0_node28_MUX[bit_math_h_l326_c3_f872] LATENCY=0
     -- Inputs
     layer0_node28_MUX_bit_math_h_l326_c3_f872_cond <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_cond;
     layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iftrue;
     layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse <= VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_iffalse;
     -- Outputs
     VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output := layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output;

     -- layer0_node8_MUX[bit_math_h_l106_c3_43f9] LATENCY=0
     -- Inputs
     layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_cond;
     layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iftrue;
     layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse <= VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_iffalse;
     -- Outputs
     VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output := layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_8546] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_8546_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output := layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output;

     -- layer0_node20_MUX[bit_math_h_l238_c3_e6f9] LATENCY=0
     -- Inputs
     layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_cond;
     layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iftrue;
     layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse <= VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_iffalse;
     -- Outputs
     VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output := layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output;

     -- layer0_node16_MUX[bit_math_h_l194_c3_35f8] LATENCY=0
     -- Inputs
     layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_cond;
     layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iftrue;
     layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse <= VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_iffalse;
     -- Outputs
     VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output := layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_11ab] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output := layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_e76d] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output := layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output;

     -- layer0_node23_MUX[bit_math_h_l271_c3_0434] LATENCY=0
     -- Inputs
     layer0_node23_MUX_bit_math_h_l271_c3_0434_cond <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_cond;
     layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iftrue;
     layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse <= VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_iffalse;
     -- Outputs
     VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output := layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_cf62] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output := layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output;

     -- layer0_node27_MUX[bit_math_h_l315_c3_09dd] LATENCY=0
     -- Inputs
     layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_cond;
     layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iftrue;
     layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse <= VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_iffalse;
     -- Outputs
     VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output := layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output;

     -- layer0_node11_MUX[bit_math_h_l139_c3_a1dd] LATENCY=0
     -- Inputs
     layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_cond;
     layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iftrue;
     layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse <= VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_iffalse;
     -- Outputs
     VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output := layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output;

     -- layer0_node18_MUX[bit_math_h_l216_c3_a7e7] LATENCY=0
     -- Inputs
     layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_cond;
     layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iftrue;
     layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse <= VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_iffalse;
     -- Outputs
     VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output := layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output;

     -- layer0_node30_MUX[bit_math_h_l348_c3_7168] LATENCY=0
     -- Inputs
     layer0_node30_MUX_bit_math_h_l348_c3_7168_cond <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_cond;
     layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iftrue;
     layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse <= VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_iffalse;
     -- Outputs
     VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output := layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output;

     -- layer0_node31_MUX[bit_math_h_l359_c3_6e93] LATENCY=0
     -- Inputs
     layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_cond;
     layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iftrue;
     layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse <= VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_iffalse;
     -- Outputs
     VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output := layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output;

     -- layer0_node12_MUX[bit_math_h_l150_c3_8f05] LATENCY=0
     -- Inputs
     layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_cond;
     layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iftrue;
     layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse <= VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_iffalse;
     -- Outputs
     VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output := layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output;

     -- layer0_node21_MUX[bit_math_h_l249_c3_2811] LATENCY=0
     -- Inputs
     layer0_node21_MUX_bit_math_h_l249_c3_2811_cond <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_cond;
     layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iftrue;
     layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse <= VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_iffalse;
     -- Outputs
     VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output := layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output;

     -- layer0_node24_MUX[bit_math_h_l282_c3_40fb] LATENCY=0
     -- Inputs
     layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_cond;
     layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iftrue;
     layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse <= VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_iffalse;
     -- Outputs
     VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output := layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output;

     -- layer0_node29_MUX[bit_math_h_l337_c3_b3c9] LATENCY=0
     -- Inputs
     layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_cond;
     layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iftrue;
     layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse <= VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_iffalse;
     -- Outputs
     VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output := layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_42c6] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output := layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output;

     -- layer0_node22_MUX[bit_math_h_l260_c3_10a0] LATENCY=0
     -- Inputs
     layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_cond;
     layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iftrue;
     layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse <= VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_iffalse;
     -- Outputs
     VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output := layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output;

     -- layer0_node15_MUX[bit_math_h_l183_c3_a1b5] LATENCY=0
     -- Inputs
     layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_cond;
     layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iftrue;
     layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse <= VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_iffalse;
     -- Outputs
     VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output := layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output;

     -- layer0_node14_MUX[bit_math_h_l172_c3_6222] LATENCY=0
     -- Inputs
     layer0_node14_MUX_bit_math_h_l172_c3_6222_cond <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_cond;
     layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iftrue;
     layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse <= VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_iffalse;
     -- Outputs
     VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output := layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output;

     -- layer0_node25_MUX[bit_math_h_l293_c3_a8db] LATENCY=0
     -- Inputs
     layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_cond;
     layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iftrue;
     layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse <= VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_iffalse;
     -- Outputs
     VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output := layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_665f] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_665f_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output := layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_179c] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_179c_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output := layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output;

     -- layer0_node17_MUX[bit_math_h_l205_c3_bcf5] LATENCY=0
     -- Inputs
     layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_cond;
     layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iftrue;
     layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse <= VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_iffalse;
     -- Outputs
     VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output := layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output;

     -- layer0_node26_MUX[bit_math_h_l304_c3_3563] LATENCY=0
     -- Inputs
     layer0_node26_MUX_bit_math_h_l304_c3_3563_cond <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_cond;
     layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iftrue;
     layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse <= VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_iffalse;
     -- Outputs
     VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output := layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_e76d_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse := VAR_layer0_node10_MUX_bit_math_h_l128_c3_6ff0_return_output;
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue := VAR_layer0_node11_MUX_bit_math_h_l139_c3_a1dd_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse := VAR_layer0_node12_MUX_bit_math_h_l150_c3_8f05_return_output;
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue := VAR_layer0_node13_MUX_bit_math_h_l161_c3_837e_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse := VAR_layer0_node14_MUX_bit_math_h_l172_c3_6222_return_output;
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue := VAR_layer0_node15_MUX_bit_math_h_l183_c3_a1b5_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse := VAR_layer0_node16_MUX_bit_math_h_l194_c3_35f8_return_output;
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue := VAR_layer0_node17_MUX_bit_math_h_l205_c3_bcf5_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse := VAR_layer0_node18_MUX_bit_math_h_l216_c3_a7e7_return_output;
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue := VAR_layer0_node19_MUX_bit_math_h_l227_c3_bc7c_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_11ab_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse := VAR_layer0_node20_MUX_bit_math_h_l238_c3_e6f9_return_output;
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue := VAR_layer0_node21_MUX_bit_math_h_l249_c3_2811_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse := VAR_layer0_node22_MUX_bit_math_h_l260_c3_10a0_return_output;
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue := VAR_layer0_node23_MUX_bit_math_h_l271_c3_0434_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse := VAR_layer0_node24_MUX_bit_math_h_l282_c3_40fb_return_output;
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue := VAR_layer0_node25_MUX_bit_math_h_l293_c3_a8db_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse := VAR_layer0_node26_MUX_bit_math_h_l304_c3_3563_return_output;
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue := VAR_layer0_node27_MUX_bit_math_h_l315_c3_09dd_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse := VAR_layer0_node28_MUX_bit_math_h_l326_c3_f872_return_output;
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue := VAR_layer0_node29_MUX_bit_math_h_l337_c3_b3c9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_8546_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse := VAR_layer0_node30_MUX_bit_math_h_l348_c3_7168_return_output;
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue := VAR_layer0_node31_MUX_bit_math_h_l359_c3_6e93_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_179c_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_42c6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_cf62_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_26cb_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_665f_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse := VAR_layer0_node8_MUX_bit_math_h_l106_c3_43f9_return_output;
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue := VAR_layer0_node9_MUX_bit_math_h_l117_c3_4b1f_return_output;
     -- layer1_node11_MUX[bit_math_h_l497_c3_2b4d] LATENCY=0
     -- Inputs
     layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_cond;
     layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iftrue;
     layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse <= VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_iffalse;
     -- Outputs
     VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output := layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output;

     -- layer1_node0_MUX[bit_math_h_l376_c3_6f68] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_cond;
     layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iftrue;
     layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output := layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output;

     -- layer1_node7_MUX[bit_math_h_l453_c3_5714] LATENCY=0
     -- Inputs
     layer1_node7_MUX_bit_math_h_l453_c3_5714_cond <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_cond;
     layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iftrue;
     layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse <= VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_iffalse;
     -- Outputs
     VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output := layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output;

     -- layer1_node3_MUX[bit_math_h_l409_c3_34bf] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_cond;
     layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iftrue;
     layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output := layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output;

     -- layer1_node15_MUX[bit_math_h_l541_c3_71ed] LATENCY=0
     -- Inputs
     layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_cond;
     layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iftrue;
     layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse <= VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_iffalse;
     -- Outputs
     VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output := layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output;

     -- layer1_node2_MUX[bit_math_h_l398_c3_0298] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l398_c3_0298_cond <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_cond;
     layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iftrue;
     layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output := layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output;

     -- layer1_node1_MUX[bit_math_h_l387_c3_11e3] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_cond;
     layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iftrue;
     layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output := layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output;

     -- layer1_node4_MUX[bit_math_h_l420_c3_6a92] LATENCY=0
     -- Inputs
     layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_cond;
     layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iftrue;
     layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse <= VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_iffalse;
     -- Outputs
     VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output := layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output;

     -- layer1_node12_MUX[bit_math_h_l508_c3_d36b] LATENCY=0
     -- Inputs
     layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_cond;
     layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iftrue;
     layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse <= VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_iffalse;
     -- Outputs
     VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output := layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output;

     -- layer1_node14_MUX[bit_math_h_l530_c3_3e4e] LATENCY=0
     -- Inputs
     layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_cond;
     layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iftrue;
     layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse <= VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_iffalse;
     -- Outputs
     VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output := layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output;

     -- layer1_node9_MUX[bit_math_h_l475_c3_73c6] LATENCY=0
     -- Inputs
     layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_cond;
     layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iftrue;
     layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse <= VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_iffalse;
     -- Outputs
     VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output := layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output;

     -- layer1_node13_MUX[bit_math_h_l519_c3_d9a8] LATENCY=0
     -- Inputs
     layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_cond;
     layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iftrue;
     layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse <= VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_iffalse;
     -- Outputs
     VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output := layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output;

     -- layer1_node10_MUX[bit_math_h_l486_c3_6e37] LATENCY=0
     -- Inputs
     layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_cond;
     layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iftrue;
     layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse <= VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_iffalse;
     -- Outputs
     VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output := layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output;

     -- layer1_node5_MUX[bit_math_h_l431_c3_4d17] LATENCY=0
     -- Inputs
     layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_cond;
     layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iftrue;
     layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse <= VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_iffalse;
     -- Outputs
     VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output := layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output;

     -- layer1_node6_MUX[bit_math_h_l442_c3_2b21] LATENCY=0
     -- Inputs
     layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_cond;
     layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iftrue;
     layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse <= VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_iffalse;
     -- Outputs
     VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output := layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output;

     -- layer1_node8_MUX[bit_math_h_l464_c3_6be3] LATENCY=0
     -- Inputs
     layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_cond;
     layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iftrue;
     layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse <= VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_iffalse;
     -- Outputs
     VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output := layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse := VAR_layer1_node0_MUX_bit_math_h_l376_c3_6f68_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse := VAR_layer1_node10_MUX_bit_math_h_l486_c3_6e37_return_output;
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue := VAR_layer1_node11_MUX_bit_math_h_l497_c3_2b4d_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse := VAR_layer1_node12_MUX_bit_math_h_l508_c3_d36b_return_output;
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue := VAR_layer1_node13_MUX_bit_math_h_l519_c3_d9a8_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse := VAR_layer1_node14_MUX_bit_math_h_l530_c3_3e4e_return_output;
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue := VAR_layer1_node15_MUX_bit_math_h_l541_c3_71ed_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue := VAR_layer1_node1_MUX_bit_math_h_l387_c3_11e3_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse := VAR_layer1_node2_MUX_bit_math_h_l398_c3_0298_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue := VAR_layer1_node3_MUX_bit_math_h_l409_c3_34bf_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse := VAR_layer1_node4_MUX_bit_math_h_l420_c3_6a92_return_output;
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue := VAR_layer1_node5_MUX_bit_math_h_l431_c3_4d17_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse := VAR_layer1_node6_MUX_bit_math_h_l442_c3_2b21_return_output;
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue := VAR_layer1_node7_MUX_bit_math_h_l453_c3_5714_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse := VAR_layer1_node8_MUX_bit_math_h_l464_c3_6be3_return_output;
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue := VAR_layer1_node9_MUX_bit_math_h_l475_c3_73c6_return_output;
     -- layer2_node4_MUX[bit_math_h_l602_c3_94c5] LATENCY=0
     -- Inputs
     layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_cond;
     layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iftrue;
     layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse <= VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_iffalse;
     -- Outputs
     VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output := layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output;

     -- layer2_node1_MUX[bit_math_h_l569_c3_981b] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l569_c3_981b_cond <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_cond;
     layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iftrue;
     layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output := layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output;

     -- layer2_node3_MUX[bit_math_h_l591_c3_46d6] LATENCY=0
     -- Inputs
     layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_cond;
     layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iftrue;
     layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse <= VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_iffalse;
     -- Outputs
     VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output := layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output;

     -- layer2_node2_MUX[bit_math_h_l580_c3_8ef4] LATENCY=0
     -- Inputs
     layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_cond;
     layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iftrue;
     layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse <= VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_iffalse;
     -- Outputs
     VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output := layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output;

     -- layer2_node6_MUX[bit_math_h_l624_c3_b21c] LATENCY=0
     -- Inputs
     layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_cond;
     layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iftrue;
     layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse <= VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_iffalse;
     -- Outputs
     VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output := layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output;

     -- layer2_node0_MUX[bit_math_h_l558_c3_1ed8] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_cond;
     layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iftrue;
     layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output := layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output;

     -- layer2_node5_MUX[bit_math_h_l613_c3_9d7c] LATENCY=0
     -- Inputs
     layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_cond;
     layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iftrue;
     layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse <= VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_iffalse;
     -- Outputs
     VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output := layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output;

     -- layer2_node7_MUX[bit_math_h_l635_c3_d573] LATENCY=0
     -- Inputs
     layer2_node7_MUX_bit_math_h_l635_c3_d573_cond <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_cond;
     layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iftrue;
     layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse <= VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_iffalse;
     -- Outputs
     VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output := layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse := VAR_layer2_node0_MUX_bit_math_h_l558_c3_1ed8_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue := VAR_layer2_node1_MUX_bit_math_h_l569_c3_981b_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse := VAR_layer2_node2_MUX_bit_math_h_l580_c3_8ef4_return_output;
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue := VAR_layer2_node3_MUX_bit_math_h_l591_c3_46d6_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse := VAR_layer2_node4_MUX_bit_math_h_l602_c3_94c5_return_output;
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue := VAR_layer2_node5_MUX_bit_math_h_l613_c3_9d7c_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse := VAR_layer2_node6_MUX_bit_math_h_l624_c3_b21c_return_output;
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue := VAR_layer2_node7_MUX_bit_math_h_l635_c3_d573_return_output;
     -- layer3_node1_MUX[bit_math_h_l663_c3_d7e9] LATENCY=0
     -- Inputs
     layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_cond;
     layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iftrue;
     layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse <= VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_iffalse;
     -- Outputs
     VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output := layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output;

     -- layer3_node2_MUX[bit_math_h_l674_c3_358e] LATENCY=0
     -- Inputs
     layer3_node2_MUX_bit_math_h_l674_c3_358e_cond <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_cond;
     layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iftrue;
     layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse <= VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_iffalse;
     -- Outputs
     VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output := layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output;

     -- layer3_node3_MUX[bit_math_h_l685_c3_0bd8] LATENCY=0
     -- Inputs
     layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_cond;
     layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iftrue;
     layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse <= VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_iffalse;
     -- Outputs
     VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output := layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output;

     -- layer3_node0_MUX[bit_math_h_l652_c3_7056] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l652_c3_7056_cond <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_cond;
     layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iftrue;
     layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output := layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output;

     -- Submodule level 5
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse := VAR_layer3_node0_MUX_bit_math_h_l652_c3_7056_return_output;
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue := VAR_layer3_node1_MUX_bit_math_h_l663_c3_d7e9_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse := VAR_layer3_node2_MUX_bit_math_h_l674_c3_358e_return_output;
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue := VAR_layer3_node3_MUX_bit_math_h_l685_c3_0bd8_return_output;
     -- layer4_node1_MUX[bit_math_h_l713_c3_ff1e] LATENCY=0
     -- Inputs
     layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_cond;
     layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iftrue;
     layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse <= VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_iffalse;
     -- Outputs
     VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output := layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output;

     -- layer4_node0_MUX[bit_math_h_l702_c3_8860] LATENCY=0
     -- Inputs
     layer4_node0_MUX_bit_math_h_l702_c3_8860_cond <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_cond;
     layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iftrue;
     layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse <= VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_iffalse;
     -- Outputs
     VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output := layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output;

     -- Submodule level 6
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse := VAR_layer4_node0_MUX_bit_math_h_l702_c3_8860_return_output;
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue := VAR_layer4_node1_MUX_bit_math_h_l713_c3_ff1e_return_output;
     -- layer5_node0_MUX[bit_math_h_l730_c3_3a76] LATENCY=0
     -- Inputs
     layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_cond;
     layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iftrue;
     layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse <= VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_iffalse;
     -- Outputs
     VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output := layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_layer5_node0_MUX_bit_math_h_l730_c3_3a76_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
