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
-- Submodules: 222
entity BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb is
port(
 left : in unsigned(31 downto 0);
 right : in unsigned(8 downto 0);
 return_output : out unsigned(31 downto 0));
end BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb;
architecture arch of BIN_OP_DIV_uint32_t_uint9_t_0CLK_422b4ffb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output : unsigned(31 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output : unsigned(31 downto 0);

function uint32_31_31( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(31- i);
      end loop;
return return_output;
end function;

function uint32_uint1( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(31 downto 0);
  --variable y : unsigned(0 downto 0);
  variable return_output : unsigned(32 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint32_uint1_31( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(31 downto 31) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_30_30( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(30- i);
      end loop;
return return_output;
end function;

function uint32_uint1_30( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(30 downto 30) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_29_29( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(29- i);
      end loop;
return return_output;
end function;

function uint32_uint1_29( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(29 downto 29) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_28_28( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(28- i);
      end loop;
return return_output;
end function;

function uint32_uint1_28( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(28 downto 28) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_27_27( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(27- i);
      end loop;
return return_output;
end function;

function uint32_uint1_27( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(27 downto 27) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_26_26( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(26- i);
      end loop;
return return_output;
end function;

function uint32_uint1_26( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(26 downto 26) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_25_25( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(25- i);
      end loop;
return return_output;
end function;

function uint32_uint1_25( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(25 downto 25) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_24_24( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(24- i);
      end loop;
return return_output;
end function;

function uint32_uint1_24( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(24 downto 24) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_23_23( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(23- i);
      end loop;
return return_output;
end function;

function uint32_uint1_23( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(23 downto 23) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_22_22( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(22- i);
      end loop;
return return_output;
end function;

function uint32_uint1_22( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(22 downto 22) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_21_21( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(21- i);
      end loop;
return return_output;
end function;

function uint32_uint1_21( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(21 downto 21) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_20_20( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(20- i);
      end loop;
return return_output;
end function;

function uint32_uint1_20( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(20 downto 20) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_19_19( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(19- i);
      end loop;
return return_output;
end function;

function uint32_uint1_19( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(19 downto 19) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_18_18( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(18- i);
      end loop;
return return_output;
end function;

function uint32_uint1_18( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(18 downto 18) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_17_17( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(17- i);
      end loop;
return return_output;
end function;

function uint32_uint1_17( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(17 downto 17) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_16_16( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(16- i);
      end loop;
return return_output;
end function;

function uint32_uint1_16( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(16 downto 16) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_15_15( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(15- i);
      end loop;
return return_output;
end function;

function uint32_uint1_15( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(15 downto 15) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_14_14( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(14- i);
      end loop;
return return_output;
end function;

function uint32_uint1_14( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(14 downto 14) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_13_13( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(13- i);
      end loop;
return return_output;
end function;

function uint32_uint1_13( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(13 downto 13) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_12_12( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(12- i);
      end loop;
return return_output;
end function;

function uint32_uint1_12( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(12 downto 12) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_11_11( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(11- i);
      end loop;
return return_output;
end function;

function uint32_uint1_11( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(11 downto 11) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_10_10( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(10- i);
      end loop;
return return_output;
end function;

function uint32_uint1_10( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(10 downto 10) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_9_9( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(9- i);
      end loop;
return return_output;
end function;

function uint32_uint1_9( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(9 downto 9) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_8_8( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(8- i);
      end loop;
return return_output;
end function;

function uint32_uint1_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(8 downto 8) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_7_7( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint32_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_6_6( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint32_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_5_5( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint32_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_4_4( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint32_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_3_3( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint32_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_2_2( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint32_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_1_1( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint32_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_0_0( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint32_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(31 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_left_resized : unsigned(31 downto 0);
 variable VAR_right_resized : unsigned(31 downto 0);
 variable VAR_output : unsigned(31 downto 0);
 variable VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e3ba : unsigned(31 downto 0);
 variable VAR_remainder : unsigned(31 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_6d61 : unsigned(31 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_2f86_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_bc40 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_71d4_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_878a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3ba4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_0de6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_341e_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6cd3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_a2ef_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_5723 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_4747_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_58ec_return_output : unsigned(31 downto 0);
 variable VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aae1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ead2 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_2065_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_90ab_return_output : unsigned(31 downto 0);
 variable VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_a9e0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_872c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_fc9d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1962_return_output : unsigned(31 downto 0);
 variable VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_7d8a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_5926 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_436b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_70e4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_1cd4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_fb71 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_6466_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_cd26_return_output : unsigned(31 downto 0);
 variable VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_b133_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_ff18 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_87ef_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_da6a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_3057_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_fca1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_5400_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_30c6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_0bb8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a61f : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_9e14_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_08e8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ee65_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_0ce9 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_3963_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fbd3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_cf29_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_4278 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4f00_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_cf59_return_output : unsigned(31 downto 0);
 variable VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_cc6e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_2411 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2338_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_be9e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_ecf3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_5af5 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a987_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_be9d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_e5d8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_3da4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_29dd_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_3f5e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_9709_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_6d16 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_6700_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_7a44_return_output : unsigned(31 downto 0);
 variable VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_4289_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_db66 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_baa4_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_fb5b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_6816_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d990 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_ef06_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_9000_return_output : unsigned(31 downto 0);
 variable VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_75cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_1e36 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_97cb_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_36e6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_1df2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_b07a : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_b5ef_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_e9ef_return_output : unsigned(31 downto 0);
 variable VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_9819_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_c68e : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_20ab_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6e53_return_output : unsigned(31 downto 0);
 variable VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3d76_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_73c3 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_b38f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_aafb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_0d95_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_3fd4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_573a_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_ab97_return_output : unsigned(31 downto 0);
 variable VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_c97e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_8562 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_0365_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_9c29_return_output : unsigned(31 downto 0);
 variable VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_c3e8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_6be9 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_ee38_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_d5f3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_0a9c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_6d83 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_5b59_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_d569_return_output : unsigned(31 downto 0);
 variable VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_f60b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_dc7d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_41f0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_d2e1_return_output : unsigned(31 downto 0);
 variable VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0c81_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_5d49 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_1556_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_f6db_return_output : unsigned(31 downto 0);
 variable VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_0853_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_ffc6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_6aa1_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_08eb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_a4b6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_8d80 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_2422_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_4004_return_output : unsigned(31 downto 0);
 variable VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_aac0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_41a1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_2007_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_b86d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_76b8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_393c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_cd7c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond : unsigned(0 downto 0);
 variable VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5c64_return_output : unsigned(31 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_6d61 := resize(to_unsigned(0, 1), 32);
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e3ba := resize(to_unsigned(0, 1), 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse := VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e3ba;
     -- uint32_uint1_31[BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_878a] LATENCY=0
     VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_878a_return_output := uint32_uint1_31(
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e3ba,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue := VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_878a_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right := VAR_right;
     -- uint32_29_29[BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_a2ef] LATENCY=0
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_a2ef_return_output := uint32_29_29(
     VAR_left);

     -- uint32_3_3[BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_0853] LATENCY=0
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_0853_return_output := uint32_3_3(
     VAR_left);

     -- uint32_10_10[BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3d76] LATENCY=0
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3d76_return_output := uint32_10_10(
     VAR_left);

     -- uint32_0_0[BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_76b8] LATENCY=0
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_76b8_return_output := uint32_0_0(
     VAR_left);

     -- uint32_27_27[BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_a9e0] LATENCY=0
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_a9e0_return_output := uint32_27_27(
     VAR_left);

     -- uint32_26_26[BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_7d8a] LATENCY=0
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_7d8a_return_output := uint32_26_26(
     VAR_left);

     -- uint32_20_20[BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_cf29] LATENCY=0
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_cf29_return_output := uint32_20_20(
     VAR_left);

     -- uint32_25_25[BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_1cd4] LATENCY=0
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_1cd4_return_output := uint32_25_25(
     VAR_left);

     -- uint32_2_2[BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_a4b6] LATENCY=0
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_a4b6_return_output := uint32_2_2(
     VAR_left);

     -- uint32_24_24[BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_b133] LATENCY=0
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_b133_return_output := uint32_24_24(
     VAR_left);

     -- uint32_17_17[BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_e5d8] LATENCY=0
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_e5d8_return_output := uint32_17_17(
     VAR_left);

     -- uint32_4_4[BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0c81] LATENCY=0
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0c81_return_output := uint32_4_4(
     VAR_left);

     -- uint32_16_16[BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_9709] LATENCY=0
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_9709_return_output := uint32_16_16(
     VAR_left);

     -- uint32_13_13[BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_75cd] LATENCY=0
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_75cd_return_output := uint32_13_13(
     VAR_left);

     -- uint32_5_5[BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_f60b] LATENCY=0
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_f60b_return_output := uint32_5_5(
     VAR_left);

     -- uint32_12_12[BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_1df2] LATENCY=0
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_1df2_return_output := uint32_12_12(
     VAR_left);

     -- uint32_28_28[BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aae1] LATENCY=0
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aae1_return_output := uint32_28_28(
     VAR_left);

     -- uint32_23_23[BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_3057] LATENCY=0
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_3057_return_output := uint32_23_23(
     VAR_left);

     -- uint32_18_18[BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_ecf3] LATENCY=0
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_ecf3_return_output := uint32_18_18(
     VAR_left);

     -- uint32_31_31[BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_2f86] LATENCY=0
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_2f86_return_output := uint32_31_31(
     VAR_left);

     -- uint32_6_6[BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_0a9c] LATENCY=0
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_0a9c_return_output := uint32_6_6(
     VAR_left);

     -- uint32_7_7[BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_c3e8] LATENCY=0
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_c3e8_return_output := uint32_7_7(
     VAR_left);

     -- uint32_15_15[BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_4289] LATENCY=0
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_4289_return_output := uint32_15_15(
     VAR_left);

     -- uint32_1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_aac0] LATENCY=0
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_aac0_return_output := uint32_1_1(
     VAR_left);

     -- uint32_21_21[BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ee65] LATENCY=0
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ee65_return_output := uint32_21_21(
     VAR_left);

     -- uint32_9_9[BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_0d95] LATENCY=0
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_0d95_return_output := uint32_9_9(
     VAR_left);

     -- uint32_8_8[BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_c97e] LATENCY=0
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_c97e_return_output := uint32_8_8(
     VAR_left);

     -- uint32_22_22[BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_0bb8] LATENCY=0
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_0bb8_return_output := uint32_22_22(
     VAR_left);

     -- uint32_11_11[BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_9819] LATENCY=0
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_9819_return_output := uint32_11_11(
     VAR_left);

     -- uint32_19_19[BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_cc6e] LATENCY=0
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_cc6e_return_output := uint32_19_19(
     VAR_left);

     -- uint32_30_30[BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3ba4] LATENCY=0
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3ba4_return_output := uint32_30_30(
     VAR_left);

     -- uint32_14_14[BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_6816] LATENCY=0
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_6816_return_output := uint32_14_14(
     VAR_left);

     -- Submodule level 1
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_71d4] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_71d4_return_output := uint32_uint1(
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_6d61,
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_2f86_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_bc40 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_71d4_return_output, 32);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_bc40;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_bc40;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_bc40;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_f86c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_7011_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output;
     -- uint32_uint1_30[BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6cd3] LATENCY=0
     VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6cd3_return_output := uint32_uint1_30(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_341e] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_341e_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_ddfb_return_output,
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3ba4_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_0de6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_341e_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue := VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6cd3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_0de6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_0de6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_0de6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_423e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_8209_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output;
     -- uint32_uint1_29[BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_58ec] LATENCY=0
     VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_58ec_return_output := uint32_uint1_29(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_4747] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_4747_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_1404_return_output,
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_a2ef_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_5723 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_4747_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue := VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_58ec_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_5723;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_5723;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_5723;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_1400_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_da00_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output;
     -- uint32_uint1_28[BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_90ab] LATENCY=0
     VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_90ab_return_output := uint32_uint1_28(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_2065] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_2065_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_6783_return_output,
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aae1_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ead2 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_2065_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue := VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_90ab_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ead2;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ead2;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ead2;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_d106_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_ea77_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output;
     -- uint32_uint1_27[BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1962] LATENCY=0
     VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1962_return_output := uint32_uint1_27(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_fc9d] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_fc9d_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_f709_return_output,
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_a9e0_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_872c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_fc9d_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue := VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1962_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_872c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_872c;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_872c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_deb8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_013c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output;
     -- uint32_uint1_26[BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_70e4] LATENCY=0
     VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_70e4_return_output := uint32_uint1_26(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_436b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_436b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_d445_return_output,
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_7d8a_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_5926 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_436b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue := VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_70e4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_5926;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_5926;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_5926;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_7a25_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_04f1_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output;
     -- uint32_uint1_25[BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_cd26] LATENCY=0
     VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_cd26_return_output := uint32_uint1_25(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_6466] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_6466_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_5c81_return_output,
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_1cd4_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_fb71 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_6466_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue := VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_cd26_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_fb71;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_fb71;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_fb71;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a716_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_3044_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output;
     -- uint32_uint1_24[BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_da6a] LATENCY=0
     VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_da6a_return_output := uint32_uint1_24(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_87ef] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_87ef_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_ab69_return_output,
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_b133_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_ff18 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_87ef_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue := VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_da6a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_ff18;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_ff18;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_ff18;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_33bf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_884b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_5400] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_5400_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output,
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_3057_return_output);

     -- uint32_uint1_23[BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_30c6] LATENCY=0
     VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_30c6_return_output := uint32_uint1_23(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_8a75_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_fca1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_5400_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue := VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_30c6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_fca1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_fca1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_fca1;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_1744_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_5643_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_9e14] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_9e14_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output,
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_0bb8_return_output);

     -- uint32_uint1_22[BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_08e8] LATENCY=0
     VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_08e8_return_output := uint32_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_fb71_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a61f := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_9e14_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue := VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_08e8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a61f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a61f;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a61f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_7844_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_d491_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_3963] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_3963_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output,
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ee65_return_output);

     -- uint32_uint1_21[BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fbd3] LATENCY=0
     VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fbd3_return_output := uint32_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_9b8b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_0ce9 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_3963_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue := VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fbd3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_0ce9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_0ce9;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_0ce9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_8d0b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_ee21_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4f00] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4f00_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output,
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_cf29_return_output);

     -- uint32_uint1_20[BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_cf59] LATENCY=0
     VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_cf59_return_output := uint32_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_e3b2_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_4278 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4f00_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue := VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_cf59_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_4278;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_4278;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_4278;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_441a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_3681_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output;
     -- uint32_uint1_19[BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_be9e] LATENCY=0
     VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_be9e_return_output := uint32_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2338] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2338_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_473e_return_output,
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_cc6e_return_output);

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_2411 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2338_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue := VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_be9e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_2411;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_2411;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_2411;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_ddf7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_81b4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output;
     -- uint32_uint1_18[BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_be9d] LATENCY=0
     VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_be9d_return_output := uint32_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a987] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a987_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_775b_return_output,
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_ecf3_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_5af5 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a987_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue := VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_be9d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_5af5;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_5af5;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_5af5;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_c67f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_c7aa_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_29dd] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_29dd_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output,
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_e5d8_return_output);

     -- uint32_uint1_17[BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_3f5e] LATENCY=0
     VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_3f5e_return_output := uint32_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_1a9e_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_3da4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_29dd_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue := VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_3f5e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_3da4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_3da4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_3da4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_5d5a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_7f15_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output;
     -- uint32_uint1_16[BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_7a44] LATENCY=0
     VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_7a44_return_output := uint32_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_6700] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_6700_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_cc77_return_output,
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_9709_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_6d16 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_6700_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue := VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_7a44_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_6d16;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_6d16;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_6d16;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f224_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_b622_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_baa4] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_baa4_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output,
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_4289_return_output);

     -- uint32_uint1_15[BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_fb5b] LATENCY=0
     VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_fb5b_return_output := uint32_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_a454_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_db66 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_baa4_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue := VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_fb5b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_db66;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_db66;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_db66;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_4b43_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_286f_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output;
     -- uint32_uint1_14[BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_9000] LATENCY=0
     VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_9000_return_output := uint32_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_ef06] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_ef06_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_abe1_return_output,
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_6816_return_output);

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d990 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_ef06_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue := VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_9000_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d990;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d990;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d990;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_dda3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5d84_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_97cb] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_97cb_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output,
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_75cd_return_output);

     -- uint32_uint1_13[BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_36e6] LATENCY=0
     VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_36e6_return_output := uint32_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_8659_return_output,
     to_unsigned(1, 1));

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_1e36 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_97cb_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue := VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_36e6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_1e36;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_1e36;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_1e36;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_cb66_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_0938_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_b5ef] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_b5ef_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output,
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_1df2_return_output);

     -- uint32_uint1_12[BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_e9ef] LATENCY=0
     VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_e9ef_return_output := uint32_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_9a8c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_b07a := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_b5ef_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue := VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_e9ef_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_b07a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_b07a;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_b07a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_197f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_cde4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_20ab] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_20ab_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output,
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_9819_return_output);

     -- uint32_uint1_11[BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6e53] LATENCY=0
     VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6e53_return_output := uint32_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_c831_return_output,
     to_unsigned(1, 1));

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_c68e := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_20ab_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue := VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6e53_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_c68e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_c68e;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_c68e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_65e1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_5de4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output;
     -- uint32_uint1_10[BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_aafb] LATENCY=0
     VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_aafb_return_output := uint32_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_b38f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_b38f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_cd88_return_output,
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3d76_return_output);

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_73c3 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_b38f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue := VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_aafb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_73c3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_73c3;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_73c3;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_83e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_f796_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output;
     -- uint32_uint1_9[BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_ab97] LATENCY=0
     VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_ab97_return_output := uint32_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_573a] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_573a_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_053f_return_output,
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_0d95_return_output);

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_3fd4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_573a_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue := VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_ab97_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_3fd4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_3fd4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_3fd4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_529c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_4243_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_0365] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_0365_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output,
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_c97e_return_output);

     -- uint32_uint1_8[BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_9c29] LATENCY=0
     VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_9c29_return_output := uint32_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_6e5b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_8562 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_0365_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue := VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_9c29_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_8562;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_8562;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_8562;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_896e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_7141_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output;

     -- Submodule level 73
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_ee38] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_ee38_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output,
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_c3e8_return_output);

     -- uint32_uint1_7[BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_d5f3] LATENCY=0
     VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_d5f3_return_output := uint32_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_6d19_return_output,
     to_unsigned(1, 1));

     -- Submodule level 74
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_6be9 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_ee38_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue := VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_d5f3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_6be9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_6be9;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_6be9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output;

     -- Submodule level 75
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_511a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_6982_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output;

     -- Submodule level 76
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_5b59] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_5b59_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output,
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_0a9c_return_output);

     -- uint32_uint1_6[BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_d569] LATENCY=0
     VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_d569_return_output := uint32_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_c21b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 77
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_6d83 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_5b59_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue := VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_d569_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_6d83;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_6d83;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_6d83;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output;

     -- Submodule level 78
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_44f2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_80ce_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output;

     -- Submodule level 79
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output;
     -- uint32_uint1_5[BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_d2e1] LATENCY=0
     VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_d2e1_return_output := uint32_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_41f0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_41f0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_d539_return_output,
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_f60b_return_output);

     -- Submodule level 80
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_dc7d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_41f0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue := VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_d2e1_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_dc7d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_dc7d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_dc7d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output;

     -- Submodule level 81
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4ffd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_3c55_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output;

     -- Submodule level 82
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output;
     -- uint32_uint1_4[BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_f6db] LATENCY=0
     VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_f6db_return_output := uint32_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_1556] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_1556_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7b79_return_output,
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0c81_return_output);

     -- Submodule level 83
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_5d49 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_1556_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue := VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_f6db_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_5d49;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_5d49;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_5d49;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output;

     -- Submodule level 84
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_9351_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_e303_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output;

     -- Submodule level 85
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_6aa1] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_6aa1_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output,
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_0853_return_output);

     -- uint32_uint1_3[BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_08eb] LATENCY=0
     VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_08eb_return_output := uint32_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c1ae_return_output,
     to_unsigned(1, 1));

     -- Submodule level 86
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_ffc6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_6aa1_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue := VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_08eb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_ffc6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_ffc6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_ffc6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output;

     -- Submodule level 87
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_61c1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b8cb_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output;

     -- Submodule level 88
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output;
     -- uint32_uint1_2[BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_4004] LATENCY=0
     VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_4004_return_output := uint32_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_2422] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_2422_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_b0b2_return_output,
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_a4b6_return_output);

     -- Submodule level 89
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_8d80 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_2422_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue := VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_4004_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_8d80;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_8d80;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_8d80;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output;

     -- Submodule level 90
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_551e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_b168_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output;

     -- Submodule level 91
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_2007] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_2007_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output,
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_aac0_return_output);

     -- uint32_uint1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_b86d] LATENCY=0
     VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_b86d_return_output := uint32_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_7d9e_return_output,
     to_unsigned(1, 1));

     -- Submodule level 92
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_41a1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_2007_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue := VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_b86d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_41a1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_41a1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_41a1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output;

     -- Submodule level 93
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_6e27_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_24be_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output;

     -- Submodule level 94
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_cd7c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_cd7c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output,
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_76b8_return_output);

     -- uint32_uint1_0[BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5c64] LATENCY=0
     VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5c64_return_output := uint32_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_e346_return_output,
     to_unsigned(1, 1));

     -- Submodule level 95
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_393c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_cd7c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue := VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5c64_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_393c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output;

     -- Submodule level 96
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_602f_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output;

     -- Submodule level 97
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_637e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
