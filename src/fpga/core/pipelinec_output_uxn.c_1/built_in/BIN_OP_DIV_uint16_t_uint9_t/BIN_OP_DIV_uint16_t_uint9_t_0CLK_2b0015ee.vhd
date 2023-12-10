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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_a92a : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_fca3 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_9043_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_47f6 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_4732_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_86f1_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_9e49_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_4f7c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9a72_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_aed8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_5b69_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_a305 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_ce69_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_6628_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_bd4b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_9e41 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_f98e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_8f98_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_bbee_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_9e62 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_6391_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_1e75_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_1808_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_deb9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_f2f7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_c932_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_f8b7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_a64e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_82c0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_0d9d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_f2a1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_57ec : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_fb60_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_f25a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_7dca_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_0c5d : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_692d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_3689_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_d477_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_7dd7 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_7bfb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_45dd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_3a43_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_9e37 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_e734_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5720_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3d61_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_7123 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_6b6c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_3163_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_97d9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_fd29 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_925d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_3a2e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ed08_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_d8d4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_c2ae_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_f4d0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_6b95_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_7de4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_93f2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_7e69_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_ec00_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_fa7b : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_067e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_64cb_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_a92a := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_a92a;
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_fca3 := resize(to_unsigned(0, 1), 16);
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_86f1] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_86f1_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_a92a,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_86f1_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right := VAR_right;
     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_5b69] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_5b69_return_output := uint16_13_13(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3d61] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3d61_return_output := uint16_4_4(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_f2a1] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_f2a1_return_output := uint16_8_8(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_1808] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_1808_return_output := uint16_10_10(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_bd4b] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_bd4b_return_output := uint16_12_12(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_6b95] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_6b95_return_output := uint16_1_1(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_f8b7] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_f8b7_return_output := uint16_9_9(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_9043] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_9043_return_output := uint16_15_15(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_ec00] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_ec00_return_output := uint16_0_0(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_d477] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_d477_return_output := uint16_6_6(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_bbee] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_bbee_return_output := uint16_11_11(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_3a43] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_3a43_return_output := uint16_5_5(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ed08] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ed08_return_output := uint16_2_2(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_97d9] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_97d9_return_output := uint16_3_3(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_7dca] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_7dca_return_output := uint16_7_7(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_9e49] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_9e49_return_output := uint16_14_14(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_4732] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_4732_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_fca3,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_9043_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_47f6 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_4732_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_47f6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_47f6;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_47f6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_fd17_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_e5fc_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_aed8] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_aed8_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9a72] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9a72_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_2b33_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_9e49_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_4f7c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_9a72_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_aed8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_4f7c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_4f7c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_4f7c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_a4e1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1699_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_ce69] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_ce69_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_5b69_return_output);

     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_6628] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_6628_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_454f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_a305 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_ce69_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_6628_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_a305;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_a305;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_a305;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_2e55_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_70e2_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_f98e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_f98e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_bd4b_return_output);

     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_8f98] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_8f98_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_8e15_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_9e41 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_f98e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_8f98_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_9e41;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_9e41;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_9e41;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_0764_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_ea39_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_6391] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_6391_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_bbee_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_1e75] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_1e75_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_3cac_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_9e62 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_6391_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_1e75_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_9e62;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_9e62;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_9e62;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_a57e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_a7b4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_c932] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_c932_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_f2f7] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_f2f7_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_5683_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_1808_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_deb9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_f2f7_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_c932_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_deb9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_deb9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_deb9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_781b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_c041_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_82c0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_82c0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_f8b7_return_output);

     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_0d9d] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_0d9d_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_9566_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_a64e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_82c0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_0d9d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_a64e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_a64e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_a64e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_98d9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3217_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_f25a] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_f25a_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_fb60] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_fb60_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_b878_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_f2a1_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_57ec := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_fb60_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_f25a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_57ec;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_57ec;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_57ec;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_b396_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_c5d7_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_3689] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_3689_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_692d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_692d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_8deb_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_7dca_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_0c5d := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_692d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_3689_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_0c5d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_0c5d;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_0c5d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_b305_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_7f18_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_7bfb] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_7bfb_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_d477_return_output);

     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_45dd] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_45dd_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3504_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_7dd7 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_7bfb_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_45dd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_7dd7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_7dd7;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_7dd7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_a2f8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_3c0b_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output;
     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5720] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5720_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_e734] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_e734_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0a25_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_3a43_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_9e37 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_e734_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5720_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_9e37;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_9e37;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_9e37;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_f253_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_c717_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_3163] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_3163_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_6b6c] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_6b6c_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c806_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3d61_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_7123 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_6b6c_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_3163_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_7123;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_7123;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_7123;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_361e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_b8c4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output;
     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_3a2e] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_3a2e_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_925d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_925d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_aa1f_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_97d9_return_output);

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_fd29 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_925d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_3a2e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_fd29;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_fd29;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_fd29;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_3e72_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_4bd5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_f4d0] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_f4d0_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_c2ae] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_c2ae_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_6af8_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ed08_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_d8d4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_c2ae_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_f4d0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_d8d4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_d8d4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_d8d4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_b89c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_ba05_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output;
     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_7e69] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_7e69_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_93f2] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_93f2_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_e36b_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_6b95_return_output);

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_7de4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_93f2_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_7e69_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_7de4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_7de4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_7de4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_b7a9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_2432_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_067e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_067e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_ec00_return_output);

     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_64cb] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_64cb_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_8caa_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_fa7b := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_067e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_64cb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_fa7b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_35d4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_1723_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
