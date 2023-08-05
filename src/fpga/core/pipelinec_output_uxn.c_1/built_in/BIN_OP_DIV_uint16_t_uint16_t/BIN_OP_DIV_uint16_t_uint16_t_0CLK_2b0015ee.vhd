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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_1598 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_4669 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_59e1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_b849 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_a122_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_21aa_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_dfe7 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_a2d8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_1bd8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_de33 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_0d20_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_ac0c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_8c50_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3d0c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_146d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_c45a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_fac5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_6663 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_84e8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_d687_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_e67b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_e885 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_795d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_77d5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_805d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3f34 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_a740_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_374e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_da0a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_2aa4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_b37d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_f4a9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_a760_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_425e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_249d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_aa51_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_3f46_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_8356 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_c08a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_e058_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_5531_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_31ea : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_284a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_b121_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_895f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_edd3 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_cd0e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_6312_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_f3e9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_f4fe : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_2fb8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_71d0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_f360_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_2a12 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_3f13_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_f28b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_faed_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_6e1e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_fea8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_2ac0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_2ab8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_afd6 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5df9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_fec4_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_4669 := resize(to_unsigned(0, 1), 16);
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_1598 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_1598;
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_21aa] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_21aa_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_1598,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_21aa_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right := VAR_right;
     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_8c50] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_8c50_return_output := uint16_12_12(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_895f] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_895f_return_output := uint16_4_4(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_fac5] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_fac5_return_output := uint16_11_11(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_e67b] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_e67b_return_output := uint16_10_10(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_5ef5] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_5ef5_return_output := uint16_14_14(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_f3e9] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_f3e9_return_output := uint16_3_3(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_da0a] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_da0a_return_output := uint16_8_8(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_805d] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_805d_return_output := uint16_9_9(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_a760] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_a760_return_output := uint16_7_7(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_f360] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_f360_return_output := uint16_2_2(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_3f46] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_3f46_return_output := uint16_6_6(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_5531] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_5531_return_output := uint16_5_5(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_1bd8] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_1bd8_return_output := uint16_13_13(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_faed] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_faed_return_output := uint16_1_1(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_2ab8] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_2ab8_return_output := uint16_0_0(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_59e1] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_59e1_return_output := uint16_15_15(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_a122] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_a122_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_4669,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_59e1_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_b849 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_a122_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_b849;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_b849;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_b849;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_de36_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_88d8_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_a2d8] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_a2d8_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_ea21_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_5ef5_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_dfe7 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_a2d8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_dfe7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_dfe7;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_dfe7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_b189_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_3c61_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_0d20] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_0d20_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_1bd8_return_output);

     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_ac0c] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_ac0c_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_f8c8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_de33 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_0d20_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_ac0c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_de33;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_de33;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_de33;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_04c2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_ffac_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_146d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_146d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_8c50_return_output);

     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_c45a] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_c45a_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_963d_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3d0c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_146d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_c45a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3d0c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3d0c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_3d0c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_3b29_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ff4e_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output;
     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_d687] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_d687_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_84e8] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_84e8_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_bbd0_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_fac5_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_6663 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_84e8_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_d687_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_6663;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_6663;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_6663;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_23ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_844e_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_77d5] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_77d5_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_795d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_795d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_b8c4_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_e67b_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_e885 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_795d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_77d5_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_e885;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_e885;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_e885;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_d41f_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_a740] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_a740_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_805d_return_output);

     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_374e] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_374e_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_6b4d_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3f34 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_a740_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_374e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3f34;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3f34;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_3f34;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_8bcc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_9f20_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_b37d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_b37d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_da0a_return_output);

     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_f4a9] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_f4a9_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_3f5f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_2aa4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_b37d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_f4a9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_2aa4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_2aa4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_2aa4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_966f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_5b53_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_249d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_249d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_a760_return_output);

     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_aa51] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_aa51_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_2cfb_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_425e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_249d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_aa51_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_425e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_425e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_425e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_693a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_93a6_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output;
     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_e058] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_e058_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_c08a] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_c08a_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_0847_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_3f46_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_8356 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_c08a_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_e058_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_8356;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_8356;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_8356;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_b39e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_afd4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output;
     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_b121] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_b121_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_284a] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_284a_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_5b37_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_5531_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_31ea := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_284a_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_b121_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_31ea;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_31ea;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_31ea;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_a0b7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_9286_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_cd0e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_cd0e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_895f_return_output);

     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_6312] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_6312_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_ce62_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_edd3 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_cd0e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_6312_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_edd3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_edd3;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_edd3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e59d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_beb4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_2fb8] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_2fb8_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_f3e9_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_71d0] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_71d0_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_6390_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_f4fe := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_2fb8_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_71d0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_f4fe;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_f4fe;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_f4fe;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0863_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_c715_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_f28b] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_f28b_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_3f13] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_3f13_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_592a_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_f360_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_2a12 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_3f13_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_f28b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_2a12;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_2a12;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_2a12;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_52a6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_7c34_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_fea8] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_fea8_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_faed_return_output);

     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_2ac0] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_2ac0_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_184c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_6e1e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_fea8_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_2ac0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_6e1e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_6e1e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_6e1e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_91b0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_6c88_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5df9] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5df9_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_2ab8_return_output);

     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_fec4] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_fec4_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_a336_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_afd6 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5df9_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_fec4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_afd6;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_6781_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_37a0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
