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
-- -- use ieee.float_pkg.all;
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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output : unsigned(15 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11]
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71 : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f : entity work.BIN_OP_GTE_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_070c : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_1b33 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_a87b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_fbe0 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_1a3b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_000b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_2d5e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_1c54 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_53f2_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_c612_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_fb5e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_fa0d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_f12e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_2ce3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_f38e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_40a0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_5a63_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_661a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_577d : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_9021_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_b81c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_c28f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_1e94 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_74b7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_475a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_44ee_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_24d9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_f23c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_3738_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_295a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_d93c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_46b9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_bafa_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d3be_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_56dc : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_3ff2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_27d9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_2dc4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_cbdf : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_63fb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_79b6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_dd3c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_3354 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_7323_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d189_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_0ae0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_0b36 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_b179_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_5e17_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_df5a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_3d46 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_e334_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_8a47_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_73ff_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_d152 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_7f5e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_3d76_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_22f9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_8863 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_97b4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_a22c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c30f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_9851 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5a9f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_2054_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_1b33 := resize(to_unsigned(0, 1), 16);
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_070c := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_070c;
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_000b] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_000b_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint16_t_c_l16_c3_070c,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint16_t_c_l47_c14_000b_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right := VAR_right;
     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_295a] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_295a_return_output := uint16_8_8(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_2ce3] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_2ce3_return_output := uint16_12_12(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_c28f] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_c28f_return_output := uint16_10_10(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_22f9] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_22f9_return_output := uint16_1_1(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c30f] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c30f_return_output := uint16_0_0(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_c612] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_c612_return_output := uint16_13_13(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_df5a] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_df5a_return_output := uint16_3_3(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_0ae0] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_0ae0_return_output := uint16_4_4(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_a87b] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_a87b_return_output := uint16_15_15(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_44ee] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_44ee_return_output := uint16_9_9(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_dd3c] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_dd3c_return_output := uint16_5_5(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d3be] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d3be_return_output := uint16_7_7(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_2dc4] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_2dc4_return_output := uint16_6_6(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_73ff] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_73ff_return_output := uint16_2_2(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_2d5e] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_2d5e_return_output := uint16_14_14(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_661a] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_661a_return_output := uint16_11_11(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_1a3b] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_1a3b_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l19_c3_1b33,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint16_t_c_l41_c20_a87b_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_fbe0 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c15_1a3b_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_fbe0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_fbe0;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l42_c3_fbe0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c6_2b5b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l45_c17_f2a3_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_53f2] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_53f2_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a8] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a8_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l43_c3_4b74_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint16_t_c_l50_c20_2d5e_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_1c54 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c15_e4a8_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint16_t_c_l56_c14_53f2_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_1c54;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_1c54;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l51_c3_1c54;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c6_f215_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l54_c17_4905_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output;
     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_f12e] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_f12e_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_fa0d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_fa0d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l52_c3_dd27_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint16_t_c_l59_c20_c612_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_fb5e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c15_fa0d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint16_t_c_l65_c14_f12e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_fb5e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_fb5e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l60_c3_fb5e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c6_8cb3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l63_c17_b07f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_40a0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_40a0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint16_t_c_l68_c20_2ce3_return_output);

     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_5a63] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_5a63_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l61_c3_5cea_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_f38e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c15_40a0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint16_t_c_l74_c14_5a63_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_f38e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_f38e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l69_c3_f38e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c6_94fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l72_c17_9da5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_9021] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_9021_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint16_t_c_l77_c20_661a_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_b81c] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_b81c_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l70_c3_8adf_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_577d := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c15_9021_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint16_t_c_l83_c14_b81c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_577d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_577d;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l78_c3_577d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c6_9946_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l81_c17_688a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_74b7] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_74b7_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint16_t_c_l86_c20_c28f_return_output);

     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_475a] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_475a_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l79_c3_5bd4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_1e94 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c15_74b7_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint16_t_c_l92_c14_475a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_1e94;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_1e94;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l87_c3_1e94;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c6_8bb0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l90_c17_4874_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output;
     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_3738] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_3738_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_f23c] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_f23c_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l88_c3_a3bb_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint16_t_c_l95_c20_44ee_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_24d9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c15_f23c_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint16_t_c_l101_c14_3738_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_24d9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_24d9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l96_c3_24d9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c6_b965_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l99_c17_f462_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_46b9] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_46b9_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint16_t_c_l104_c20_295a_return_output);

     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_bafa] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_bafa_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l97_c3_05c9_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_d93c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c15_46b9_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint16_t_c_l110_c14_bafa_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_d93c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_d93c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l105_c3_d93c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c6_011d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l108_c17_3416_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_27d9] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_27d9_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_3ff2] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_3ff2_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l106_c3_4ee2_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint16_t_c_l113_c20_d3be_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_56dc := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c15_3ff2_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint16_t_c_l119_c14_27d9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_56dc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_56dc;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l114_c3_56dc;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c6_c030_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l117_c17_f17f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output;
     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_79b6] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_79b6_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_63fb] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_63fb_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l115_c3_7db6_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint16_t_c_l122_c20_2dc4_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_cbdf := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c15_63fb_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint16_t_c_l128_c14_79b6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_cbdf;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_cbdf;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l123_c3_cbdf;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c6_d549_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l126_c17_1313_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_7323] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_7323_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint16_t_c_l131_c20_dd3c_return_output);

     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d189] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d189_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l124_c3_d85d_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_3354 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c15_7323_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint16_t_c_l137_c14_d189_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_3354;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_3354;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l132_c3_3354;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c6_c4bc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l135_c17_5c59_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_5e17] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_5e17_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_b179] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_b179_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l133_c3_8549_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint16_t_c_l140_c20_0ae0_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_0b36 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c15_b179_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint16_t_c_l146_c14_5e17_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_0b36;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_0b36;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l141_c3_0b36;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c6_9f16_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l144_c17_80a2_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_e334] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_e334_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint16_t_c_l149_c20_df5a_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_8a47] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_8a47_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l142_c3_812f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_3d46 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c15_e334_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint16_t_c_l155_c14_8a47_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_3d46;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_3d46;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l150_c3_3d46;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c6_0eda_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l153_c17_d645_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_7f5e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_7f5e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint16_t_c_l158_c20_73ff_return_output);

     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_3d76] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_3d76_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l151_c3_cf86_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_d152 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c15_7f5e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint16_t_c_l164_c14_3d76_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_d152;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_d152;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l159_c3_d152;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c6_7dde_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l162_c17_5982_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_97b4] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_97b4_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l167_c20_22f9_return_output);

     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_a22c] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_a22c_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l160_c3_46ea_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_8863 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c15_97b4_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint16_t_c_l173_c14_a22c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_8863;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_8863;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l168_c3_8863;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c6_1e71_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint16_t_c_l171_c17_335f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output;
     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_2054] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_2054_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5a9f] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5a9f_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l169_c3_216b_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint16_t_c_l176_c20_c30f_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_9851 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c15_5a9f_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint16_t_c_l182_c14_2054_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint16_t_c_l177_c3_9851;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c6_cb6f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint16_t_c_l178_c3_9c11_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
