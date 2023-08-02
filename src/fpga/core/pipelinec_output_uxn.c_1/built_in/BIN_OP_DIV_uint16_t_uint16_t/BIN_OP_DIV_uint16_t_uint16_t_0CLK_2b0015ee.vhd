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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8bb6 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8348 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_3aaa_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_1587 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_8986_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_9454_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_06a0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_a4b4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_bc30_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_abd9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_fe33_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_20ea : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_01bc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_af27_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_4a71_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_d723 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_f1ab_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_4ae2_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_70de_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_b1d5 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_c849_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5ce7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_58b1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_0d5c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_22c2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_0af6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_1603_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3c89 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_68a0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_420b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_4bfe : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_3884_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_3cfd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_6559_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_3382 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_5d78_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_7dcf_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_078a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_1129 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_90a6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_3423_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_39c1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_6a20 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_5e18_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_fa24_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_9e1f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_b68d : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_e569_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_45ae_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_7066_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_79d3 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_fff7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_3b2a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_489f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_66f0 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_990d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_6d2c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_fcbf_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_9721 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_1767_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_7e7f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c791_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_72f6 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_4862_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_3ab8_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8bb6 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8bb6;
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8348 := resize(to_unsigned(0, 1), 16);
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_9454] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_9454_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8bb6,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_9454_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right := VAR_right;
     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_58b1] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_58b1_return_output := uint16_10_10(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c791] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c791_return_output := uint16_0_0(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_4a71] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_4a71_return_output := uint16_12_12(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_70de] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_70de_return_output := uint16_11_11(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_f3a7] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_f3a7_return_output := uint16_8_8(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_06a0] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_06a0_return_output := uint16_14_14(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_fcbf] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_fcbf_return_output := uint16_1_1(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_39c1] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_39c1_return_output := uint16_5_5(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_078a] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_078a_return_output := uint16_6_6(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_7066] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_7066_return_output := uint16_3_3(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_fe33] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_fe33_return_output := uint16_13_13(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_3aaa] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_3aaa_return_output := uint16_15_15(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_1603] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_1603_return_output := uint16_9_9(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_489f] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_489f_return_output := uint16_2_2(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_6559] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_6559_return_output := uint16_7_7(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_9e1f] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_9e1f_return_output := uint16_4_4(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_8986] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_8986_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8348,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_3aaa_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_1587 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_8986_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_1587;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_1587;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_1587;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_a47e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_eb41_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_bc30] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_bc30_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_06a0_return_output);

     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_abd9] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_abd9_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_05e3_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_a4b4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_bc30_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_abd9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_a4b4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_a4b4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_a4b4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_ca05_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c82_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_01bc] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_01bc_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_fe33_return_output);

     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_af27] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_af27_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_9be8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_20ea := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_01bc_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_af27_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_20ea;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_20ea;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_20ea;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_132e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_c81e_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_f1ab] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_f1ab_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_4a71_return_output);

     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_4ae2] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_4ae2_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_4f30_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_d723 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_f1ab_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_4ae2_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_d723;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_d723;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_d723;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_6113_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ba7d_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_c849] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_c849_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_70de_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5ce7] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5ce7_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_fdce_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_b1d5 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_c849_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5ce7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_b1d5;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_b1d5;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_b1d5;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_7fa0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_b7e5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_0af6] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_0af6_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_22c2] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_22c2_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_a119_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_58b1_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_0d5c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_22c2_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_0af6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_0d5c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_0d5c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_0d5c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_1b09_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_3ca4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_68a0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_68a0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_1603_return_output);

     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_420b] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_420b_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_14d2_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3c89 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_68a0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_420b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3c89;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3c89;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3c89;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_03fb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_a3f5_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_3cfd] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_3cfd_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_3884] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_3884_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_dd86_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_f3a7_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_4bfe := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_3884_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_3cfd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_4bfe;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_4bfe;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_4bfe;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_22fc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_2d95_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_5d78] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_5d78_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_6559_return_output);

     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_7dcf] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_7dcf_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_3b3c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_3382 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_5d78_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_7dcf_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_3382;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_3382;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_3382;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_0cca_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_0552_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_90a6] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_90a6_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_078a_return_output);

     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_3423] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_3423_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_3971_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_1129 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_90a6_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_3423_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_1129;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_1129;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_1129;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d671_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_65b0_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output;
     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_fa24] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_fa24_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_5e18] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_5e18_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_3351_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_39c1_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_6a20 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_5e18_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_fa24_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_6a20;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_6a20;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_6a20;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_edae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_eb07_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_e569] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_e569_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_9e1f_return_output);

     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_45ae] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_45ae_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8fca_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_b68d := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_e569_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_45ae_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_b68d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_b68d;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_b68d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_d482_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_f8a9_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_fff7] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_fff7_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_7066_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_3b2a] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_3b2a_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_e261_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_79d3 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_fff7_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_3b2a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_79d3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_79d3;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_79d3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_2ece_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_9e69_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_990d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_990d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_489f_return_output);

     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_6d2c] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_6d2c_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_7041_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_66f0 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_990d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_6d2c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_66f0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_66f0;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_66f0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_8b81_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_9170_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output;
     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_7e7f] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_7e7f_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_1767] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_1767_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_9684_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_fcbf_return_output);

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_9721 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_1767_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_7e7f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_9721;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_9721;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_9721;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_190d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_75cf_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_4862] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_4862_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c791_return_output);

     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_3ab8] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_3ab8_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_e3f4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_72f6 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_4862_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_3ab8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_72f6;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_1361_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_7645_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
