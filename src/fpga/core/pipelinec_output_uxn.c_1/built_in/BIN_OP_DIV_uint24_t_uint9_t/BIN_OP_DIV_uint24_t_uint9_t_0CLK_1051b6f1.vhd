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
-- Submodules: 166
entity BIN_OP_DIV_uint24_t_uint9_t_0CLK_1051b6f1 is
port(
 left : in unsigned(23 downto 0);
 right : in unsigned(8 downto 0);
 return_output : out unsigned(23 downto 0));
end BIN_OP_DIV_uint24_t_uint9_t_0CLK_1051b6f1;
architecture arch of BIN_OP_DIV_uint24_t_uint9_t_0CLK_1051b6f1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output : unsigned(23 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output : unsigned(23 downto 0);

function uint24_23_23( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(23- i);
      end loop;
return return_output;
end function;

function uint24_uint1( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(23 downto 0);
  --variable y : unsigned(0 downto 0);
  variable return_output : unsigned(24 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint24_uint1_23( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(23 downto 23) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_22_22( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(22- i);
      end loop;
return return_output;
end function;

function uint24_uint1_22( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(22 downto 22) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_21_21( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(21- i);
      end loop;
return return_output;
end function;

function uint24_uint1_21( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(21 downto 21) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_20_20( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(20- i);
      end loop;
return return_output;
end function;

function uint24_uint1_20( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(20 downto 20) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_19_19( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(19- i);
      end loop;
return return_output;
end function;

function uint24_uint1_19( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(19 downto 19) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_18_18( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(18- i);
      end loop;
return return_output;
end function;

function uint24_uint1_18( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(18 downto 18) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_17_17( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(17- i);
      end loop;
return return_output;
end function;

function uint24_uint1_17( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(17 downto 17) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_16_16( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(16- i);
      end loop;
return return_output;
end function;

function uint24_uint1_16( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(16 downto 16) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_15_15( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(15- i);
      end loop;
return return_output;
end function;

function uint24_uint1_15( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(15 downto 15) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_14_14( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(14- i);
      end loop;
return return_output;
end function;

function uint24_uint1_14( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(14 downto 14) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_13_13( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(13- i);
      end loop;
return return_output;
end function;

function uint24_uint1_13( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(13 downto 13) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_12_12( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(12- i);
      end loop;
return return_output;
end function;

function uint24_uint1_12( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(12 downto 12) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_11_11( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(11- i);
      end loop;
return return_output;
end function;

function uint24_uint1_11( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(11 downto 11) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_10_10( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(10- i);
      end loop;
return return_output;
end function;

function uint24_uint1_10( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(10 downto 10) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_9_9( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(9- i);
      end loop;
return return_output;
end function;

function uint24_uint1_9( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(9 downto 9) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_8_8( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(8- i);
      end loop;
return return_output;
end function;

function uint24_uint1_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(8 downto 8) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_7_7( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint24_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_6_6( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint24_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_5_5( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint24_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_4_4( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint24_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_3_3( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint24_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_2_2( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint24_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_1_1( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint24_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_0_0( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint24_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(23 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(23 downto 0);
 variable VAR_left_resized : unsigned(23 downto 0);
 variable VAR_right_resized : unsigned(23 downto 0);
 variable VAR_output : unsigned(23 downto 0);
 variable VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_41a0 : unsigned(23 downto 0);
 variable VAR_remainder : unsigned(23 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_9e0b : unsigned(23 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_12b4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_124b : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_7b4d_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_9065_return_output : unsigned(23 downto 0);
 variable VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_2aa9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_d093 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_ea52_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_ce57_return_output : unsigned(23 downto 0);
 variable VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_7be5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_0b99 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_55b7_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_48f4_return_output : unsigned(23 downto 0);
 variable VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_d2c1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_51b5 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_337c_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_9409_return_output : unsigned(23 downto 0);
 variable VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_c5ff_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_05e7 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_333e_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_7e22_return_output : unsigned(23 downto 0);
 variable VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_ad83_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_1d16 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_4a1e_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_7b31_return_output : unsigned(23 downto 0);
 variable VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_919e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_5890 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_2f57_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_4ff4_return_output : unsigned(23 downto 0);
 variable VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_eba9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_5441 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_a493_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_2ea7_return_output : unsigned(23 downto 0);
 variable VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_5074_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_72ae : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_c729_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_38c4_return_output : unsigned(23 downto 0);
 variable VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_70f3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_546d : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_41b6_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_ee0a_return_output : unsigned(23 downto 0);
 variable VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_419f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_315c : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_00e0_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_13a8_return_output : unsigned(23 downto 0);
 variable VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_9640_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_eabe : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_32ff_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_a948_return_output : unsigned(23 downto 0);
 variable VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_6de7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_b34f : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_be1c_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_cbbf_return_output : unsigned(23 downto 0);
 variable VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_7e94_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_0bf4 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_6003_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_0a72_return_output : unsigned(23 downto 0);
 variable VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_21e2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_9d03 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_0634_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_cb39_return_output : unsigned(23 downto 0);
 variable VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_e6fc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_3936 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5b16_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_5188_return_output : unsigned(23 downto 0);
 variable VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_1fa5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_3672 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_a48b_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_9c6b_return_output : unsigned(23 downto 0);
 variable VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_082f : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_bdaa_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_495d_return_output : unsigned(23 downto 0);
 variable VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_8740_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_ed6e : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_973a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_d30d_return_output : unsigned(23 downto 0);
 variable VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_fcbb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_affe : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_6ff7_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_2102_return_output : unsigned(23 downto 0);
 variable VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_041d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_fa14 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_eb03_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_e6b4_return_output : unsigned(23 downto 0);
 variable VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_a5a1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_5779 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_8f40_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_b0ee_return_output : unsigned(23 downto 0);
 variable VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_86e6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_bdd6 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_6c38_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_5941_return_output : unsigned(23 downto 0);
 variable VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_6ea4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_fbe6 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_ac24_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond : unsigned(0 downto 0);
 variable VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_526b_return_output : unsigned(23 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_9e0b := resize(to_unsigned(0, 1), 24);
     VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_41a0 := resize(to_unsigned(0, 1), 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse := VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_41a0;
     -- uint24_uint1_23[BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_9065] LATENCY=0
     VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_9065_return_output := uint24_uint1_23(
     VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_41a0,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue := VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_9065_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right := VAR_right;
     -- uint24_14_14[BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_70f3] LATENCY=0
     VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_70f3_return_output := uint24_14_14(
     VAR_left);

     -- uint24_23_23[BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_12b4] LATENCY=0
     VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_12b4_return_output := uint24_23_23(
     VAR_left);

     -- uint24_6_6[BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_a9f7] LATENCY=0
     VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_a9f7_return_output := uint24_6_6(
     VAR_left);

     -- uint24_17_17[BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_919e] LATENCY=0
     VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_919e_return_output := uint24_17_17(
     VAR_left);

     -- uint24_21_21[BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_7be5] LATENCY=0
     VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_7be5_return_output := uint24_21_21(
     VAR_left);

     -- uint24_0_0[BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_6ea4] LATENCY=0
     VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_6ea4_return_output := uint24_0_0(
     VAR_left);

     -- uint24_22_22[BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_2aa9] LATENCY=0
     VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_2aa9_return_output := uint24_22_22(
     VAR_left);

     -- uint24_20_20[BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_d2c1] LATENCY=0
     VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_d2c1_return_output := uint24_20_20(
     VAR_left);

     -- uint24_8_8[BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_e6fc] LATENCY=0
     VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_e6fc_return_output := uint24_8_8(
     VAR_left);

     -- uint24_1_1[BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_86e6] LATENCY=0
     VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_86e6_return_output := uint24_1_1(
     VAR_left);

     -- uint24_3_3[BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_041d] LATENCY=0
     VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_041d_return_output := uint24_3_3(
     VAR_left);

     -- uint24_7_7[BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_1fa5] LATENCY=0
     VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_1fa5_return_output := uint24_7_7(
     VAR_left);

     -- uint24_18_18[BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_ad83] LATENCY=0
     VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_ad83_return_output := uint24_18_18(
     VAR_left);

     -- uint24_12_12[BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_9640] LATENCY=0
     VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_9640_return_output := uint24_12_12(
     VAR_left);

     -- uint24_5_5[BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_8740] LATENCY=0
     VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_8740_return_output := uint24_5_5(
     VAR_left);

     -- uint24_11_11[BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_6de7] LATENCY=0
     VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_6de7_return_output := uint24_11_11(
     VAR_left);

     -- uint24_16_16[BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_eba9] LATENCY=0
     VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_eba9_return_output := uint24_16_16(
     VAR_left);

     -- uint24_13_13[BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_419f] LATENCY=0
     VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_419f_return_output := uint24_13_13(
     VAR_left);

     -- uint24_2_2[BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_a5a1] LATENCY=0
     VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_a5a1_return_output := uint24_2_2(
     VAR_left);

     -- uint24_10_10[BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_7e94] LATENCY=0
     VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_7e94_return_output := uint24_10_10(
     VAR_left);

     -- uint24_4_4[BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_fcbb] LATENCY=0
     VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_fcbb_return_output := uint24_4_4(
     VAR_left);

     -- uint24_9_9[BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_21e2] LATENCY=0
     VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_21e2_return_output := uint24_9_9(
     VAR_left);

     -- uint24_19_19[BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_c5ff] LATENCY=0
     VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_c5ff_return_output := uint24_19_19(
     VAR_left);

     -- uint24_15_15[BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_5074] LATENCY=0
     VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_5074_return_output := uint24_15_15(
     VAR_left);

     -- Submodule level 1
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_7b4d] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_7b4d_return_output := uint24_uint1(
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_9e0b,
     VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_12b4_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_124b := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_7b4d_return_output, 24);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_124b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_124b;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_124b;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_c6a7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_22d8_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output;
     -- uint24_uint1_22[BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_ce57] LATENCY=0
     VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_ce57_return_output := uint24_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_ea52] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_ea52_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_9c00_return_output,
     VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_2aa9_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_d093 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_ea52_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue := VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_ce57_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_d093;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_d093;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_d093;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_f67d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_44f6_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_55b7] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_55b7_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output,
     VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_7be5_return_output);

     -- uint24_uint1_21[BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_48f4] LATENCY=0
     VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_48f4_return_output := uint24_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6bc1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_0b99 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_55b7_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue := VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_48f4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_0b99;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_0b99;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_0b99;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_132d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_e506_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output;
     -- uint24_uint1_20[BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_9409] LATENCY=0
     VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_9409_return_output := uint24_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_337c] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_337c_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_effe_return_output,
     VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_d2c1_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_51b5 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_337c_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue := VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_9409_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_51b5;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_51b5;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_51b5;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_e12c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_0d2e_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output;
     -- uint24_uint1_19[BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_7e22] LATENCY=0
     VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_7e22_return_output := uint24_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_333e] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_333e_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_1ce7_return_output,
     VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_c5ff_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_05e7 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_333e_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue := VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_7e22_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_05e7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_05e7;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_05e7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_0652_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_7a7b_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output;
     -- uint24_uint1_18[BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_7b31] LATENCY=0
     VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_7b31_return_output := uint24_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_4a1e] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_4a1e_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_b24b_return_output,
     VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_ad83_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_1d16 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_4a1e_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue := VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_7b31_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_1d16;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_1d16;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_1d16;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_e55c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_5ec3_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output;
     -- uint24_uint1_17[BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_4ff4] LATENCY=0
     VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_4ff4_return_output := uint24_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_2f57] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_2f57_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d2ab_return_output,
     VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_919e_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_5890 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_2f57_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue := VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_4ff4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_5890;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_5890;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_5890;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_5d14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_e4e0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_a493] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_a493_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output,
     VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_eba9_return_output);

     -- uint24_uint1_16[BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_2ea7] LATENCY=0
     VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_2ea7_return_output := uint24_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_e945_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_5441 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_a493_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue := VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_2ea7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_5441;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_5441;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_5441;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_16e5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_1855_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output;
     -- uint24_uint1_15[BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_38c4] LATENCY=0
     VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_38c4_return_output := uint24_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_c729] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_c729_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_fa22_return_output,
     VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_5074_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_72ae := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_c729_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue := VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_38c4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_72ae;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_72ae;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_72ae;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_96f1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_6c5a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_41b6] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_41b6_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output,
     VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_70f3_return_output);

     -- uint24_uint1_14[BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_ee0a] LATENCY=0
     VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_ee0a_return_output := uint24_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_c993_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_546d := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_41b6_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue := VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_ee0a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_546d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_546d;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_546d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_4a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_0d34_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output;
     -- uint24_uint1_13[BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_13a8] LATENCY=0
     VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_13a8_return_output := uint24_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_00e0] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_00e0_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_113c_return_output,
     VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_419f_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_315c := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_00e0_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue := VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_13a8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_315c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_315c;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_315c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_15b9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_3865_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_32ff] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_32ff_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output,
     VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_9640_return_output);

     -- uint24_uint1_12[BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_a948] LATENCY=0
     VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_a948_return_output := uint24_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_74f9_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_eabe := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_32ff_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue := VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_a948_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_eabe;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_eabe;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_eabe;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_2510_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_ab39_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_be1c] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_be1c_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output,
     VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_6de7_return_output);

     -- uint24_uint1_11[BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_cbbf] LATENCY=0
     VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_cbbf_return_output := uint24_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_5b11_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_b34f := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_be1c_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue := VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_cbbf_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_b34f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_b34f;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_b34f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_108a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_d844_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_6003] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_6003_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output,
     VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_7e94_return_output);

     -- uint24_uint1_10[BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_0a72] LATENCY=0
     VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_0a72_return_output := uint24_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_c4a1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_0bf4 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_6003_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue := VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_0a72_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_0bf4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_0bf4;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_0bf4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_055f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_388a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_0634] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_0634_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output,
     VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_21e2_return_output);

     -- uint24_uint1_9[BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_cb39] LATENCY=0
     VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_cb39_return_output := uint24_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_d532_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_9d03 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_0634_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue := VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_cb39_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_9d03;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_9d03;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_9d03;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8da9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_b287_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output;
     -- uint24_uint1_8[BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_5188] LATENCY=0
     VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_5188_return_output := uint24_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5b16] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5b16_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_9d4d_return_output,
     VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_e6fc_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_3936 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5b16_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue := VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_5188_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_3936;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_3936;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_3936;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_9656_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_ccc0_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_a48b] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_a48b_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output,
     VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_1fa5_return_output);

     -- uint24_uint1_7[BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_9c6b] LATENCY=0
     VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_9c6b_return_output := uint24_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0017_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_3672 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_a48b_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue := VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_9c6b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_3672;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_3672;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_3672;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_df02_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_b4b0_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output;
     -- uint24_uint1_6[BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_495d] LATENCY=0
     VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_495d_return_output := uint24_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_bdaa] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_bdaa_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_d70b_return_output,
     VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_a9f7_return_output);

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_082f := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_bdaa_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue := VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_495d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_082f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_082f;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_082f;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_38d2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_a71f_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output;
     -- uint24_uint1_5[BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_d30d] LATENCY=0
     VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_d30d_return_output := uint24_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_973a] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_973a_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_f0cd_return_output,
     VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_8740_return_output);

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_ed6e := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_973a_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue := VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_d30d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_ed6e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_ed6e;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_ed6e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_3b47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_91f3_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output;
     -- uint24_uint1_4[BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_2102] LATENCY=0
     VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_2102_return_output := uint24_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_6ff7] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_6ff7_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_d6fe_return_output,
     VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_fcbb_return_output);

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_affe := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_6ff7_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue := VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_2102_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_affe;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_affe;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_affe;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_2c9b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_e220_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_eb03] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_eb03_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output,
     VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_041d_return_output);

     -- uint24_uint1_3[BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_e6b4] LATENCY=0
     VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_e6b4_return_output := uint24_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_cc28_return_output,
     to_unsigned(1, 1));

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_fa14 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_eb03_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue := VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_e6b4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_fa14;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_fa14;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_fa14;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_b6a7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_c116_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output;
     -- uint24_uint1_2[BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_b0ee] LATENCY=0
     VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_b0ee_return_output := uint24_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_8f40] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_8f40_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_0937_return_output,
     VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_a5a1_return_output);

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_5779 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_8f40_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue := VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_b0ee_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_5779;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_5779;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_5779;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_3322_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_ac88_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_6c38] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_6c38_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output,
     VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_86e6_return_output);

     -- uint24_uint1_1[BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_5941] LATENCY=0
     VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_5941_return_output := uint24_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_1517_return_output,
     to_unsigned(1, 1));

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_bdd6 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_6c38_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue := VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_5941_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_bdd6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_bdd6;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_bdd6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_f0d5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_7379_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output;
     -- uint24_uint1_0[BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_526b] LATENCY=0
     VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_526b_return_output := uint24_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_ac24] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_ac24_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_f947_return_output,
     VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_6ea4_return_output);

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_fbe6 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_ac24_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue := VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_526b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_fbe6;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_8a8c_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output;

     -- Submodule level 73
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_c5c5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
