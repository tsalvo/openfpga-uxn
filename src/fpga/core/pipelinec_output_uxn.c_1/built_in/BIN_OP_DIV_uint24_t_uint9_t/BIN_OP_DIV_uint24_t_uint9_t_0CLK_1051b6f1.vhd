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
-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536]
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse : unsigned(23 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output : unsigned(23 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left : unsigned(23 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output : unsigned(23 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635]
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left : unsigned(23 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8]
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse : unsigned(23 downto 0);
signal output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output : unsigned(23 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32 : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output);

-- remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse,
remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f : entity work.BIN_OP_MINUS_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635 : entity work.BIN_OP_GTE_uint24_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right,
BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output);

-- output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse,
output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output,
 remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output,
 output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(23 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(23 downto 0);
 variable VAR_left_resized : unsigned(23 downto 0);
 variable VAR_right_resized : unsigned(23 downto 0);
 variable VAR_output : unsigned(23 downto 0);
 variable VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_0097 : unsigned(23 downto 0);
 variable VAR_remainder : unsigned(23 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_d894 : unsigned(23 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_bd07_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_fcb3 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_259b_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_4f98_return_output : unsigned(23 downto 0);
 variable VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_79ac_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_6657 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_fb67_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_2289_return_output : unsigned(23 downto 0);
 variable VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_6c04_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_a852 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_03c0_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_88d7_return_output : unsigned(23 downto 0);
 variable VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_e7ed_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_0d9f : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_503a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_a17a_return_output : unsigned(23 downto 0);
 variable VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_96b3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_38d1 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_7607_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_5a94_return_output : unsigned(23 downto 0);
 variable VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_3a99_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_71c9 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_5d66_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_5615_return_output : unsigned(23 downto 0);
 variable VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_5e67_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_7003 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_752d_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_6303_return_output : unsigned(23 downto 0);
 variable VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_41c6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_00c2 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_ed30_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_c313_return_output : unsigned(23 downto 0);
 variable VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_dd28_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_c7dc : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_1e27_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_039f_return_output : unsigned(23 downto 0);
 variable VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_0bd4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_c7eb : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_da57_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_b7f5_return_output : unsigned(23 downto 0);
 variable VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_71f5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_2480 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_cf66_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_1eef_return_output : unsigned(23 downto 0);
 variable VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_3204_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_4870 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_e7f9_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_9c4c_return_output : unsigned(23 downto 0);
 variable VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_ad07_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_2980 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_6f66_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_490f_return_output : unsigned(23 downto 0);
 variable VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_de00_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_d198 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_71b9_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_aa6f_return_output : unsigned(23 downto 0);
 variable VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_f9dc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_fe05 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_01d5_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_5b10_return_output : unsigned(23 downto 0);
 variable VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_aee4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_5986 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5684_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_1204_return_output : unsigned(23 downto 0);
 variable VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_f70e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_857e : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_4db5_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_be7d_return_output : unsigned(23 downto 0);
 variable VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_1aab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_9951 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_88d8_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_b19b_return_output : unsigned(23 downto 0);
 variable VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_38ad_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_24f2 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_ff19_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_0a32_return_output : unsigned(23 downto 0);
 variable VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_b171 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_57f9_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_f6f9_return_output : unsigned(23 downto 0);
 variable VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_31ac_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_0958 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_382c_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_3c9c_return_output : unsigned(23 downto 0);
 variable VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_5195_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_0479 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_d2ca_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_e753_return_output : unsigned(23 downto 0);
 variable VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_4774_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_9986 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_0527_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output : unsigned(23 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_8715_return_output : unsigned(23 downto 0);
 variable VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_01cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_e4b0 : unsigned(23 downto 0);
 variable VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_7ebc_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output : unsigned(23 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond : unsigned(0 downto 0);
 variable VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_a596_return_output : unsigned(23 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_d894 := resize(to_unsigned(0, 1), 24);
     VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_0097 := resize(to_unsigned(0, 1), 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse := VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_0097;
     -- uint24_uint1_23[BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_4f98] LATENCY=0
     VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_4f98_return_output := uint24_uint1_23(
     VAR_output_BIN_OP_DIV_uint24_t_uint9_t_c_l16_c3_0097,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue := VAR_uint24_uint1_23_BIN_OP_DIV_uint24_t_uint9_t_c_l47_c14_4f98_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right := VAR_right;
     -- uint24_3_3[BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_31ac] LATENCY=0
     VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_31ac_return_output := uint24_3_3(
     VAR_left);

     -- uint24_14_14[BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_0bd4] LATENCY=0
     VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_0bd4_return_output := uint24_14_14(
     VAR_left);

     -- uint24_21_21[BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_6c04] LATENCY=0
     VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_6c04_return_output := uint24_21_21(
     VAR_left);

     -- uint24_18_18[BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_3a99] LATENCY=0
     VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_3a99_return_output := uint24_18_18(
     VAR_left);

     -- uint24_13_13[BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_71f5] LATENCY=0
     VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_71f5_return_output := uint24_13_13(
     VAR_left);

     -- uint24_1_1[BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_4774] LATENCY=0
     VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_4774_return_output := uint24_1_1(
     VAR_left);

     -- uint24_22_22[BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_79ac] LATENCY=0
     VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_79ac_return_output := uint24_22_22(
     VAR_left);

     -- uint24_11_11[BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_ad07] LATENCY=0
     VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_ad07_return_output := uint24_11_11(
     VAR_left);

     -- uint24_17_17[BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_5e67] LATENCY=0
     VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_5e67_return_output := uint24_17_17(
     VAR_left);

     -- uint24_12_12[BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_3204] LATENCY=0
     VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_3204_return_output := uint24_12_12(
     VAR_left);

     -- uint24_4_4[BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_f5f8] LATENCY=0
     VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_f5f8_return_output := uint24_4_4(
     VAR_left);

     -- uint24_8_8[BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_aee4] LATENCY=0
     VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_aee4_return_output := uint24_8_8(
     VAR_left);

     -- uint24_2_2[BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_5195] LATENCY=0
     VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_5195_return_output := uint24_2_2(
     VAR_left);

     -- uint24_5_5[BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_38ad] LATENCY=0
     VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_38ad_return_output := uint24_5_5(
     VAR_left);

     -- uint24_16_16[BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_41c6] LATENCY=0
     VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_41c6_return_output := uint24_16_16(
     VAR_left);

     -- uint24_19_19[BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_96b3] LATENCY=0
     VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_96b3_return_output := uint24_19_19(
     VAR_left);

     -- uint24_0_0[BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_01cd] LATENCY=0
     VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_01cd_return_output := uint24_0_0(
     VAR_left);

     -- uint24_15_15[BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_dd28] LATENCY=0
     VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_dd28_return_output := uint24_15_15(
     VAR_left);

     -- uint24_23_23[BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_bd07] LATENCY=0
     VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_bd07_return_output := uint24_23_23(
     VAR_left);

     -- uint24_20_20[BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_e7ed] LATENCY=0
     VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_e7ed_return_output := uint24_20_20(
     VAR_left);

     -- uint24_6_6[BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_1aab] LATENCY=0
     VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_1aab_return_output := uint24_6_6(
     VAR_left);

     -- uint24_7_7[BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_f70e] LATENCY=0
     VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_f70e_return_output := uint24_7_7(
     VAR_left);

     -- uint24_10_10[BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_de00] LATENCY=0
     VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_de00_return_output := uint24_10_10(
     VAR_left);

     -- uint24_9_9[BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_f9dc] LATENCY=0
     VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_f9dc_return_output := uint24_9_9(
     VAR_left);

     -- Submodule level 1
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_259b] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_259b_return_output := uint24_uint1(
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l19_c3_d894,
     VAR_uint24_23_23_BIN_OP_DIV_uint24_t_uint9_t_c_l41_c20_bd07_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_fcb3 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c15_259b_return_output, 24);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_fcb3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_fcb3;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l42_c3_fcb3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c6_0cce_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l45_c17_0ce0_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output;
     -- uint24_uint1_22[BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_2289] LATENCY=0
     VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_2289_return_output := uint24_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_fb67] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_fb67_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l43_c3_6531_return_output,
     VAR_uint24_22_22_BIN_OP_DIV_uint24_t_uint9_t_c_l50_c20_79ac_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_6657 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c15_fb67_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue := VAR_uint24_uint1_22_BIN_OP_DIV_uint24_t_uint9_t_c_l56_c14_2289_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_6657;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_6657;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l51_c3_6657;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c6_4bf6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l54_c17_3c59_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_03c0] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_03c0_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output,
     VAR_uint24_21_21_BIN_OP_DIV_uint24_t_uint9_t_c_l59_c20_6c04_return_output);

     -- uint24_uint1_21[BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_88d7] LATENCY=0
     VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_88d7_return_output := uint24_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l52_c3_6f67_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_a852 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c15_03c0_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue := VAR_uint24_uint1_21_BIN_OP_DIV_uint24_t_uint9_t_c_l65_c14_88d7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_a852;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_a852;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l60_c3_a852;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c6_3e61_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l63_c17_c7f1_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_503a] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_503a_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output,
     VAR_uint24_20_20_BIN_OP_DIV_uint24_t_uint9_t_c_l68_c20_e7ed_return_output);

     -- uint24_uint1_20[BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_a17a] LATENCY=0
     VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_a17a_return_output := uint24_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l61_c3_524c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_0d9f := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c15_503a_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue := VAR_uint24_uint1_20_BIN_OP_DIV_uint24_t_uint9_t_c_l74_c14_a17a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_0d9f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_0d9f;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l69_c3_0d9f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c6_aad4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l72_c17_84bf_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_7607] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_7607_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output,
     VAR_uint24_19_19_BIN_OP_DIV_uint24_t_uint9_t_c_l77_c20_96b3_return_output);

     -- uint24_uint1_19[BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_5a94] LATENCY=0
     VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_5a94_return_output := uint24_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l70_c3_07c4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_38d1 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c15_7607_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue := VAR_uint24_uint1_19_BIN_OP_DIV_uint24_t_uint9_t_c_l83_c14_5a94_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_38d1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_38d1;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l78_c3_38d1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c6_d216_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l81_c17_701b_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output;
     -- uint24_uint1_18[BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_5615] LATENCY=0
     VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_5615_return_output := uint24_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_5d66] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_5d66_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l79_c3_8fa9_return_output,
     VAR_uint24_18_18_BIN_OP_DIV_uint24_t_uint9_t_c_l86_c20_3a99_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_71c9 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c15_5d66_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue := VAR_uint24_uint1_18_BIN_OP_DIV_uint24_t_uint9_t_c_l92_c14_5615_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_71c9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_71c9;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l87_c3_71c9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c6_3a30_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l90_c17_0bd0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_752d] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_752d_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output,
     VAR_uint24_17_17_BIN_OP_DIV_uint24_t_uint9_t_c_l95_c20_5e67_return_output);

     -- uint24_uint1_17[BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_6303] LATENCY=0
     VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_6303_return_output := uint24_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l88_c3_d13b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_7003 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c15_752d_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue := VAR_uint24_uint1_17_BIN_OP_DIV_uint24_t_uint9_t_c_l101_c14_6303_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_7003;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_7003;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l96_c3_7003;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c6_4e80_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l99_c17_f6b8_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_ed30] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_ed30_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output,
     VAR_uint24_16_16_BIN_OP_DIV_uint24_t_uint9_t_c_l104_c20_41c6_return_output);

     -- uint24_uint1_16[BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_c313] LATENCY=0
     VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_c313_return_output := uint24_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l97_c3_89d8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_00c2 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c15_ed30_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue := VAR_uint24_uint1_16_BIN_OP_DIV_uint24_t_uint9_t_c_l110_c14_c313_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_00c2;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_00c2;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l105_c3_00c2;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c6_5486_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l108_c17_2c06_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_1e27] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_1e27_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output,
     VAR_uint24_15_15_BIN_OP_DIV_uint24_t_uint9_t_c_l113_c20_dd28_return_output);

     -- uint24_uint1_15[BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_039f] LATENCY=0
     VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_039f_return_output := uint24_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l106_c3_4b8b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_c7dc := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c15_1e27_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue := VAR_uint24_uint1_15_BIN_OP_DIV_uint24_t_uint9_t_c_l119_c14_039f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_c7dc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_c7dc;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l114_c3_c7dc;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c6_2d14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l117_c17_2769_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_da57] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_da57_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output,
     VAR_uint24_14_14_BIN_OP_DIV_uint24_t_uint9_t_c_l122_c20_0bd4_return_output);

     -- uint24_uint1_14[BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_b7f5] LATENCY=0
     VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_b7f5_return_output := uint24_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l115_c3_7b37_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_c7eb := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c15_da57_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue := VAR_uint24_uint1_14_BIN_OP_DIV_uint24_t_uint9_t_c_l128_c14_b7f5_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_c7eb;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_c7eb;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l123_c3_c7eb;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c6_8af4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l126_c17_22b0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output;
     -- uint24_uint1_13[BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_1eef] LATENCY=0
     VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_1eef_return_output := uint24_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_cf66] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_cf66_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l124_c3_f8a1_return_output,
     VAR_uint24_13_13_BIN_OP_DIV_uint24_t_uint9_t_c_l131_c20_71f5_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_2480 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c15_cf66_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue := VAR_uint24_uint1_13_BIN_OP_DIV_uint24_t_uint9_t_c_l137_c14_1eef_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_2480;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_2480;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l132_c3_2480;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c6_2ee1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l135_c17_c630_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_e7f9] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_e7f9_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output,
     VAR_uint24_12_12_BIN_OP_DIV_uint24_t_uint9_t_c_l140_c20_3204_return_output);

     -- uint24_uint1_12[BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_9c4c] LATENCY=0
     VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_9c4c_return_output := uint24_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l133_c3_4bb5_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_4870 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c15_e7f9_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue := VAR_uint24_uint1_12_BIN_OP_DIV_uint24_t_uint9_t_c_l146_c14_9c4c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_4870;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_4870;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l141_c3_4870;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c6_da32_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l144_c17_a5e7_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_6f66] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_6f66_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output,
     VAR_uint24_11_11_BIN_OP_DIV_uint24_t_uint9_t_c_l149_c20_ad07_return_output);

     -- uint24_uint1_11[BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_490f] LATENCY=0
     VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_490f_return_output := uint24_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l142_c3_1835_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_2980 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c15_6f66_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue := VAR_uint24_uint1_11_BIN_OP_DIV_uint24_t_uint9_t_c_l155_c14_490f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_2980;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_2980;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l150_c3_2980;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c6_df7e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l153_c17_3397_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output;
     -- uint24_uint1_10[BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_aa6f] LATENCY=0
     VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_aa6f_return_output := uint24_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_71b9] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_71b9_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l151_c3_dc26_return_output,
     VAR_uint24_10_10_BIN_OP_DIV_uint24_t_uint9_t_c_l158_c20_de00_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_d198 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c15_71b9_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue := VAR_uint24_uint1_10_BIN_OP_DIV_uint24_t_uint9_t_c_l164_c14_aa6f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_d198;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_d198;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l159_c3_d198;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c6_a2fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l162_c17_6fd2_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_01d5] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_01d5_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output,
     VAR_uint24_9_9_BIN_OP_DIV_uint24_t_uint9_t_c_l167_c20_f9dc_return_output);

     -- uint24_uint1_9[BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_5b10] LATENCY=0
     VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_5b10_return_output := uint24_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l160_c3_e0f2_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_fe05 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c15_01d5_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue := VAR_uint24_uint1_9_BIN_OP_DIV_uint24_t_uint9_t_c_l173_c14_5b10_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_fe05;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_fe05;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l168_c3_fe05;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c6_8d4b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l171_c17_709e_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output;
     -- uint24_uint1_8[BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_1204] LATENCY=0
     VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_1204_return_output := uint24_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5684] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5684_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l169_c3_89e0_return_output,
     VAR_uint24_8_8_BIN_OP_DIV_uint24_t_uint9_t_c_l176_c20_aee4_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_5986 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c15_5684_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue := VAR_uint24_uint1_8_BIN_OP_DIV_uint24_t_uint9_t_c_l182_c14_1204_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_5986;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_5986;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l177_c3_5986;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c6_982f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l180_c17_407e_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_4db5] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_4db5_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output,
     VAR_uint24_7_7_BIN_OP_DIV_uint24_t_uint9_t_c_l185_c20_f70e_return_output);

     -- uint24_uint1_7[BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_be7d] LATENCY=0
     VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_be7d_return_output := uint24_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l178_c3_0022_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_857e := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c15_4db5_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue := VAR_uint24_uint1_7_BIN_OP_DIV_uint24_t_uint9_t_c_l191_c14_be7d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_857e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_857e;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l186_c3_857e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c6_b61c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l189_c17_febd_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output;
     -- uint24_uint1_6[BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_b19b] LATENCY=0
     VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_b19b_return_output := uint24_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_88d8] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_88d8_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l187_c3_9f5e_return_output,
     VAR_uint24_6_6_BIN_OP_DIV_uint24_t_uint9_t_c_l194_c20_1aab_return_output);

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_9951 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c15_88d8_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue := VAR_uint24_uint1_6_BIN_OP_DIV_uint24_t_uint9_t_c_l200_c14_b19b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_9951;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_9951;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l195_c3_9951;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c6_54ac_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l198_c17_2899_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output;
     -- uint24_uint1_5[BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_0a32] LATENCY=0
     VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_0a32_return_output := uint24_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_ff19] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_ff19_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l196_c3_906a_return_output,
     VAR_uint24_5_5_BIN_OP_DIV_uint24_t_uint9_t_c_l203_c20_38ad_return_output);

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_24f2 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c15_ff19_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue := VAR_uint24_uint1_5_BIN_OP_DIV_uint24_t_uint9_t_c_l209_c14_0a32_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_24f2;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_24f2;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l204_c3_24f2;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c6_5d0b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l207_c17_f2d8_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output;
     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_57f9] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_57f9_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output,
     VAR_uint24_4_4_BIN_OP_DIV_uint24_t_uint9_t_c_l212_c20_f5f8_return_output);

     -- uint24_uint1_4[BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_f6f9] LATENCY=0
     VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_f6f9_return_output := uint24_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l205_c3_f4c5_return_output,
     to_unsigned(1, 1));

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_b171 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c15_57f9_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue := VAR_uint24_uint1_4_BIN_OP_DIV_uint24_t_uint9_t_c_l218_c14_f6f9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_b171;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_b171;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l213_c3_b171;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c6_72a0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l216_c17_c37c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output;
     -- uint24_uint1_3[BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_3c9c] LATENCY=0
     VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_3c9c_return_output := uint24_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_382c] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_382c_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l214_c3_1c8b_return_output,
     VAR_uint24_3_3_BIN_OP_DIV_uint24_t_uint9_t_c_l221_c20_31ac_return_output);

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_0958 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c15_382c_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue := VAR_uint24_uint1_3_BIN_OP_DIV_uint24_t_uint9_t_c_l227_c14_3c9c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_0958;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_0958;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l222_c3_0958;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c6_9cf2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l225_c17_7343_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output;
     -- uint24_uint1_2[BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_e753] LATENCY=0
     VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_e753_return_output := uint24_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_d2ca] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_d2ca_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l223_c3_6e29_return_output,
     VAR_uint24_2_2_BIN_OP_DIV_uint24_t_uint9_t_c_l230_c20_5195_return_output);

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_0479 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c15_d2ca_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue := VAR_uint24_uint1_2_BIN_OP_DIV_uint24_t_uint9_t_c_l236_c14_e753_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_0479;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_0479;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l231_c3_0479;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c6_f622_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l234_c17_db32_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output;
     -- uint24_uint1_1[BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_8715] LATENCY=0
     VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_8715_return_output := uint24_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_0527] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_0527_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l232_c3_499d_return_output,
     VAR_uint24_1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l239_c20_4774_return_output);

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_9986 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c15_0527_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue := VAR_uint24_uint1_1_BIN_OP_DIV_uint24_t_uint9_t_c_l245_c14_8715_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_9986;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_9986;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l240_c3_9986;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c6_ea49_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint24_t_uint9_t_c_l243_c17_4f9f_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue;
     remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output := remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output;

     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output;
     -- uint24_uint1_0[BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_a596] LATENCY=0
     VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_a596_return_output := uint24_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output,
     to_unsigned(1, 1));

     -- uint24_uint1[BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_7ebc] LATENCY=0
     VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_7ebc_return_output := uint24_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l241_c3_c536_return_output,
     VAR_uint24_0_0_BIN_OP_DIV_uint24_t_uint9_t_c_l248_c20_01cd_return_output);

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_e4b0 := resize(VAR_uint24_uint1_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c15_7ebc_return_output, 24);
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue := VAR_uint24_uint1_0_BIN_OP_DIV_uint24_t_uint9_t_c_l254_c14_a596_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left := VAR_remainder_BIN_OP_DIV_uint24_t_uint9_t_c_l249_c3_e4b0;
     -- BIN_OP_GTE[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_left;
     BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output := BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c6_0635_return_output;
     -- output_MUX[BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_cond;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iftrue;
     output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output := output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output;

     -- Submodule level 73
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint24_t_uint9_t_c_l250_c3_28f8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
