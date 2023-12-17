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
entity BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(8 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee;
architecture arch of BIN_OP_DIV_uint16_t_uint9_t_0CLK_2b0015ee is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_9726 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_14be : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_03f6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_3eaf : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_3ba5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_1cdd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_8459_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_9c9a : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9ca3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_d175_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_2115_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_080b : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_acf0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_76cd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_d558_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_229c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_85fc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_ed98_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_e97a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_6e82 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_8e45_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_2b4c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_5241_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_090f : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_15b3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_86de_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_2255_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b069 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_b8c3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_4e4e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e767_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_2497 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_13f8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_5972_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_60e0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_b517 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_f090_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_0cf7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_85ac_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_acfd : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_2555_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_ed3c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_ba24_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_1249 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_1875_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_bb2c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_fc83_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_5bf3 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_5b33_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_4060_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_b98b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_04f2 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_f615_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_835a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_08cc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_c693 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_ea95_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_4652_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_5e1c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_67df : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_ac28_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_6c58_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_e1a4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1b1e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_0aa4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_f739_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_9726 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_9726;
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_14be := resize(to_unsigned(0, 1), 16);
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_1cdd] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_1cdd_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_9726,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_1cdd_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right := VAR_right;
     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e767] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e767_return_output := uint16_8_8(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_ba24] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_ba24_return_output := uint16_5_5(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_fc83] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_fc83_return_output := uint16_4_4(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_85ac] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_85ac_return_output := uint16_6_6(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_e97a] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_e97a_return_output := uint16_11_11(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_d558] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_d558_return_output := uint16_12_12(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_08cc] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_08cc_return_output := uint16_2_2(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_60e0] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_60e0_return_output := uint16_7_7(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_b98b] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_b98b_return_output := uint16_3_3(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_2255] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_2255_return_output := uint16_9_9(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_2115] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_2115_return_output := uint16_13_13(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_03f6] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_03f6_return_output := uint16_15_15(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_5e1c] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_5e1c_return_output := uint16_1_1(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_8459] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_8459_return_output := uint16_14_14(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_5241] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_5241_return_output := uint16_10_10(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_e1a4] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_e1a4_return_output := uint16_0_0(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_3ba5] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_3ba5_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_14be,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_03f6_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_3eaf := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_3ba5_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_3eaf;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_3eaf;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_3eaf;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_ff87_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_4f3b_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9ca3] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9ca3_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_8459_return_output);

     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_d175] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_d175_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_ab2c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_9c9a := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9ca3_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_d175_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_9c9a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_9c9a;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_9c9a;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_b2bf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_48bb_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output;
     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_76cd] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_76cd_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_acf0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_acf0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_29fd_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_2115_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_080b := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_acf0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_76cd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_080b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_080b;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_080b;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_5a6a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_4771_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output;
     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_ed98] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_ed98_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_85fc] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_85fc_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_252b_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_d558_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_229c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_85fc_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_ed98_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_229c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_229c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_229c;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_7e96_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_b2d0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output;
     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_2b4c] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_2b4c_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_8e45] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_8e45_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_85a6_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_e97a_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_6e82 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_8e45_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_2b4c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_6e82;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_6e82;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_6e82;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_e3ff_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_f690_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_86de] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_86de_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_15b3] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_15b3_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5a08_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_5241_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_090f := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_15b3_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_86de_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_090f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_090f;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_090f;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_4c47_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_760c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output;
     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_4e4e] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_4e4e_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_b8c3] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_b8c3_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_e260_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_2255_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b069 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_b8c3_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_4e4e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b069;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b069;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b069;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_b932_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_e092_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_5972] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_5972_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_13f8] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_13f8_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_1f21_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e767_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_2497 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_13f8_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_5972_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_2497;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_2497;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_2497;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_a634_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_b8d5_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_0cf7] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_0cf7_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_f090] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_f090_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_6a29_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_60e0_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_b517 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_f090_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_0cf7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_b517;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_b517;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_b517;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_0def_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_ebc9_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_2555] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_2555_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_85ac_return_output);

     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_ed3c] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_ed3c_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_aa18_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_acfd := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_2555_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_ed3c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_acfd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_acfd;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_acfd;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a7d2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_92f1_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output;
     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_bb2c] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_bb2c_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_1875] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_1875_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_df03_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_ba24_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_1249 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_1875_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_bb2c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_1249;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_1249;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_1249;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_895f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_0a04_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_4060] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_4060_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_5b33] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_5b33_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_4bac_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_fc83_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_5bf3 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_5b33_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_4060_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_5bf3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_5bf3;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_5bf3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8d41_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_86a6_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_f615] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_f615_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_b98b_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_835a] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_835a_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_c534_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_04f2 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_f615_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_835a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_04f2;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_04f2;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_04f2;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_7033_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_f301_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_4652] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_4652_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_ea95] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_ea95_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_b580_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_08cc_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_c693 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_ea95_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_4652_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_c693;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_c693;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_c693;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_6258_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_3a8c_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_ac28] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_ac28_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_5e1c_return_output);

     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_6c58] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_6c58_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_54a7_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_67df := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_ac28_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_6c58_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_67df;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_67df;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_67df;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_5e58_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_60ba_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_0aa4] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_0aa4_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_e1a4_return_output);

     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_f739] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_f739_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_54b3_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1b1e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_0aa4_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_f739_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1b1e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_43dc_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_aa35_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
