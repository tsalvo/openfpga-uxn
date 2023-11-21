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
-- Submodules: 110
entity BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee;
architecture arch of BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output : unsigned(15 downto 0);

function uint16_15_15( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(15- i);
      end loop;
return return_output;
end function;

function uint16_uint1( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(15 downto 0);
  --variable y : unsigned(0 downto 0);
  variable return_output : unsigned(16 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint16_uint1_15( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 15) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_14_14( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(14- i);
      end loop;
return return_output;
end function;

function uint16_uint1_14( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(14 downto 14) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_13_13( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(13- i);
      end loop;
return return_output;
end function;

function uint16_uint1_13( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(13 downto 13) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_12_12( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(12- i);
      end loop;
return return_output;
end function;

function uint16_uint1_12( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(12 downto 12) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_11_11( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(11- i);
      end loop;
return return_output;
end function;

function uint16_uint1_11( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(11 downto 11) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_10_10( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(10- i);
      end loop;
return return_output;
end function;

function uint16_uint1_10( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(10 downto 10) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_9_9( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(9- i);
      end loop;
return return_output;
end function;

function uint16_uint1_9( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(9 downto 9) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_8_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(8- i);
      end loop;
return return_output;
end function;

function uint16_uint1_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(8 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_7_7( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint16_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_6_6( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint16_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_5_5( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint16_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_4_4( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint16_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_3_3( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint16_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_2_2( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint16_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_1_1( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint16_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_0_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint16_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_eb85 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_b1c9 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_89be_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_c648 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_97d5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_916c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_0c89_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_7e18 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_5a0b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_00bd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_55a4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_6991 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_4ce2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_4c09_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3125 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_4187_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_188d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_6af7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_c03e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_3946_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_4060_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_efc9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_8c75 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_d945_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d47d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_e272_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_a76e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_8f3e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_470b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_7eae_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_b2df : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_4925_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_1012_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_c4a0 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_4565_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_5cd0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_b085_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_dba4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_4628_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_d09f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_a182_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_f66b : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_1361_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_99ae_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_2140_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_ca49 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f769_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_efa7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_2f95_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_32af : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_968c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_922c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_0ff7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_0dfd : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_61c9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_0604_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_20e6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_053f : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_c6a0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_f521_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_3581_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_6038 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_1bff_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_304e_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_eb85 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_eb85;
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_b1c9 := resize(to_unsigned(0, 1), 16);
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_916c] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_916c_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_eb85,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_916c_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right := VAR_right;
     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_efc9] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_efc9_return_output := uint16_10_10(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_3581] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_3581_return_output := uint16_0_0(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_b085] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_b085_return_output := uint16_6_6(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d7cf] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d7cf_return_output := uint16_7_7(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_20e6] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_20e6_return_output := uint16_1_1(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_2f95] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_2f95_return_output := uint16_3_3(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_2140] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_2140_return_output := uint16_4_4(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_e272] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_e272_return_output := uint16_9_9(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_0c89] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_0c89_return_output := uint16_14_14(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_d3c1] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_d3c1_return_output := uint16_12_12(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_7eae] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_7eae_return_output := uint16_8_8(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_6af7] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_6af7_return_output := uint16_11_11(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_a182] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_a182_return_output := uint16_5_5(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_55a4] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_55a4_return_output := uint16_13_13(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_89be] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_89be_return_output := uint16_15_15(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_0ff7] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_0ff7_return_output := uint16_2_2(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_97d5] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_97d5_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_b1c9,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_89be_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_c648 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_97d5_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_c648;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_c648;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_c648;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_0497_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_623b_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_00bd] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_00bd_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_5a0b] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_5a0b_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_c486_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_0c89_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_7e18 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_5a0b_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_00bd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_7e18;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_7e18;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_7e18;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_8b47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_07cc_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_4ce2] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_4ce2_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_55a4_return_output);

     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_4c09] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_4c09_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_24f1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_6991 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_4ce2_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_4c09_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_6991;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_6991;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_6991;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_89ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_23bf_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output;
     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_188d] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_188d_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_4187] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_4187_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_dffa_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_d3c1_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3125 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_4187_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_188d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3125;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3125;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3125;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_a950_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_5f8d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_3946] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_3946_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_6af7_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_4060] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_4060_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_d5c7_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_c03e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_3946_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_4060_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_c03e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_c03e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_c03e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_f509_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_93d3_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d47d] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d47d_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_d945] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_d945_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_7da1_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_efc9_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_8c75 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_d945_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d47d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_8c75;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_8c75;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_8c75;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1d96_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_a7f6_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output;
     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_470b] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_470b_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_8f3e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_8f3e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_e114_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_e272_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_a76e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_8f3e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_470b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_a76e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_a76e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_a76e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_0211_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_d1fc_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_1012] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_1012_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_4925] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_4925_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_9c26_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_7eae_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_b2df := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_4925_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_1012_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_b2df;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_b2df;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_b2df;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_96a0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_1fee_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_5cd0] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_5cd0_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_4565] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_4565_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_bd4a_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d7cf_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_c4a0 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_4565_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_5cd0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_c4a0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_c4a0;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_c4a0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_2d24_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_fc4e_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output;
     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_d09f] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_d09f_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_4628] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_4628_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_76cb_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_b085_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_dba4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_4628_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_d09f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_dba4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_dba4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_dba4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_0883_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_03f5_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output;
     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_99ae] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_99ae_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_1361] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_1361_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_abe6_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_a182_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_f66b := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_1361_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_99ae_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_f66b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_f66b;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_f66b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_04e8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_df7a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_efa7] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_efa7_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f769] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f769_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_b384_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_2140_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_ca49 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f769_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_efa7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_ca49;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_ca49;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_ca49;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9dd2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_4be3_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_968c] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_968c_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_2f95_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_922c] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_922c_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_ee4a_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_32af := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_968c_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_922c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_32af;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_32af;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_32af;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0816_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_b183_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_0604] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_0604_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_61c9] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_61c9_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_6208_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_0ff7_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_0dfd := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_61c9_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_0604_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_0dfd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_0dfd;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_0dfd;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_6c2a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_babc_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output;
     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_f521] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_f521_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_c6a0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_c6a0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_cc6b_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_20e6_return_output);

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_053f := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_c6a0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_f521_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_053f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_053f;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_053f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_3327_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_034d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output;
     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_304e] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_304e_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_1bff] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_1bff_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_3eed_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_3581_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_6038 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_1bff_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_304e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_6038;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_5b14_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_734f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
