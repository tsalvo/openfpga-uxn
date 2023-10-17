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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8ecc : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8624 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_6552_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_e8e9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_4a77_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_8c46_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_793f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_abe1 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_ca24_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_81a6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_7859_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_4146 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_d6a5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_7d37_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_501f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_1b3d : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_06e0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_dad5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_a1af_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_380c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_45b0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5049_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_5ac7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_5ef9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_010d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d1da_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_4ef1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_6ce8 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_83b4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_4c0a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_e4db_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_ac3e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_93a4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_0e1e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_2f01_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_ebc7 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_f32e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_13de_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_eb20_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_f6b8 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_de3b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_63d8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_49e4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_08b1 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_0dc0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d261_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_86f2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_699e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f445_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_9279_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_24bb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_decd : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_f28e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_49ea_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_b962_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_da3c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_789e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_52c2_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_1384_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_c77a : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_22a0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_292f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_feef_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_110e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_9522_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_d8df_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8624 := resize(to_unsigned(0, 1), 16);
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8ecc := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8ecc;
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_8c46] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_8c46_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_8ecc,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_8c46_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right := VAR_right;
     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_b962] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_b962_return_output := uint16_2_2(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_2f01] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_2f01_return_output := uint16_7_7(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_86f2] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_86f2_return_output := uint16_4_4(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_6552] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_6552_return_output := uint16_15_15(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_5ac7] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_5ac7_return_output := uint16_10_10(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_eb20] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_eb20_return_output := uint16_6_6(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_4ef1] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_4ef1_return_output := uint16_9_9(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_7859] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_7859_return_output := uint16_13_13(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_49e4] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_49e4_return_output := uint16_5_5(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_feef] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_feef_return_output := uint16_0_0(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_501f] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_501f_return_output := uint16_12_12(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_793f] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_793f_return_output := uint16_14_14(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_a1af] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_a1af_return_output := uint16_11_11(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_1384] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_1384_return_output := uint16_1_1(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_e4db] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_e4db_return_output := uint16_8_8(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_24bb] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_24bb_return_output := uint16_3_3(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_4a77] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_4a77_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_8624,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_6552_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_e8e9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_4a77_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_e8e9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_e8e9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_e8e9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_e4f4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_0f31_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_81a6] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_81a6_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_ca24] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_ca24_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_2aa3_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_793f_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_abe1 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_ca24_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_81a6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_abe1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_abe1;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_abe1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_e7b6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_528f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output;
     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_7d37] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_7d37_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_d6a5] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_d6a5_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_e5b6_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_7859_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_4146 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_d6a5_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_7d37_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_4146;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_4146;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_4146;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_5a13_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_f54c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_06e0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_06e0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_501f_return_output);

     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_dad5] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_dad5_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_1f8e_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_1b3d := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_06e0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_dad5_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_1b3d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_1b3d;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_1b3d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_b57f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_ddf9_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_45b0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_45b0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_a1af_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5049] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5049_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_021e_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_380c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_45b0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_5049_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_380c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_380c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_380c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_97a3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_f292_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d1da] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d1da_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_010d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_010d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_53ec_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_5ac7_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_5ef9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_010d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_d1da_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_5ef9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_5ef9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_5ef9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_2b1d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_9ff0_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_83b4] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_83b4_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_4ef1_return_output);

     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_4c0a] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_4c0a_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_3bb0_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_6ce8 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_83b4_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_4c0a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_6ce8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_6ce8;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_6ce8;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_75db_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_e35b_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_0e1e] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_0e1e_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_93a4] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_93a4_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_b917_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_e4db_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_ac3e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_93a4_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_0e1e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_ac3e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_ac3e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_ac3e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_08e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_eb02_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_f32e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_f32e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_2f01_return_output);

     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_13de] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_13de_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_342a_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_ebc7 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_f32e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_13de_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_ebc7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_ebc7;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_ebc7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_1e31_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f615_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_de3b] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_de3b_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_eb20_return_output);

     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_63d8] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_63d8_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_b5ea_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_f6b8 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_de3b_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_63d8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_f6b8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_f6b8;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_f6b8;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_4065_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_5eea_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_0dc0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_0dc0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_49e4_return_output);

     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d261] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d261_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_856c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_08b1 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_0dc0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d261_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_08b1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_08b1;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_08b1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_2844_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_0a03_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_9279] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_9279_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f445] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f445_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_d81e_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_86f2_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_699e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_f445_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_9279_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_699e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_699e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_699e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_e413_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_5151_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output;
     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_49ea] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_49ea_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_f28e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_f28e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_31f9_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_24bb_return_output);

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_decd := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_f28e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_49ea_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_decd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_decd;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_decd;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_c184_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_eb0c_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_789e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_789e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_b962_return_output);

     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_52c2] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_52c2_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_727f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_da3c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_789e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_52c2_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_da3c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_da3c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_da3c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_71d4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_0905_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output;
     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_292f] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_292f_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_22a0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_22a0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_1ce6_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_1384_return_output);

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_c77a := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_22a0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_292f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_c77a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_c77a;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_c77a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_8624_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_d67a_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output;
     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_d8df] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_d8df_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_9522] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_9522_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_627c_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_feef_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_110e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_9522_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_d8df_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_110e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_9817_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_b7a2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
