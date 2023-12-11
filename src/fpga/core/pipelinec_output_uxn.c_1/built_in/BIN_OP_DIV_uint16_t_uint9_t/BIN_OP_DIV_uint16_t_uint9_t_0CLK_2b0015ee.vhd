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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_3479 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_3fcc : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_2706_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_118f : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_858a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f6bc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_e40b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_ff84 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_6817_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_7dbc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_983c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_efbd : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_6159_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_f296_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_7c95_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_65d7 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_6501_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_85f5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_5aab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_8286 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_32b4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_14fd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_2437_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_bff9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_1500_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3867_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_c6e2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_8bdb : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_2467_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_b9b7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e0cc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_f973 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_1705_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_d57b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_2f14 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_1d2d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_59ba_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_0414_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_bc00 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_9c80_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_a917_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_5dc5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_57e4 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_473d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_864c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_2d9a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_df9c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_7a9a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_d765_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_025d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_dd82 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_5d9f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_6b1f_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_9f8c : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_bd97_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_e1ec_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_d03a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_834e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_c93b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_fe7b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_849b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_3e2a : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_55c0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_1736_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_3479 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_3479;
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_3fcc := resize(to_unsigned(0, 1), 16);
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f6bc] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f6bc_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_3479,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f6bc_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right := VAR_right;
     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_0414] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_0414_return_output := uint16_6_6(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_025d] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_025d_return_output := uint16_3_3(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_5dc5] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_5dc5_return_output := uint16_5_5(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8ec4] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8ec4_return_output := uint16_7_7(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_983c] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_983c_return_output := uint16_13_13(
     VAR_left);

     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_7c95] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_7c95_return_output := uint16_12_12(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_5aab] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_5aab_return_output := uint16_11_11(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_2d9a] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_2d9a_return_output := uint16_4_4(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_e40b] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_e40b_return_output := uint16_14_14(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e0cc] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e0cc_return_output := uint16_8_8(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_849b] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_849b_return_output := uint16_0_0(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_2437] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_2437_return_output := uint16_10_10(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_c6e2] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_c6e2_return_output := uint16_9_9(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ab0c] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ab0c_return_output := uint16_2_2(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_d03a] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_d03a_return_output := uint16_1_1(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_2706] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_2706_return_output := uint16_15_15(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_858a] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_858a_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_3fcc,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_2706_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_118f := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_858a_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_118f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_118f;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_118f;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_0424_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_6395_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output;
     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_7dbc] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_7dbc_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_6817] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_6817_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_3bc8_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_e40b_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_ff84 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_6817_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_7dbc_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_ff84;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_ff84;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_ff84;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_ee9f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_1a62_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output;
     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_f296] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_f296_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_6159] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_6159_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_4f7f_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_983c_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_efbd := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_6159_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_f296_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_efbd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_efbd;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_efbd;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_0700_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_becd_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output;
     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_85f5] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_85f5_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_6501] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_6501_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_fc19_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_7c95_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_65d7 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_6501_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_85f5_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_65d7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_65d7;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_65d7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_101a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_65af_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_32b4] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_32b4_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_5aab_return_output);

     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_14fd] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_14fd_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_d324_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_8286 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_32b4_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_14fd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_8286;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_8286;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_8286;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_9af3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_8272_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3867] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3867_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_1500] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_1500_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_255d_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_2437_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_bff9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_1500_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3867_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_bff9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_bff9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_bff9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_fc4b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_8afd_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output;
     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_b9b7] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_b9b7_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_2467] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_2467_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_10e9_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_c6e2_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_8bdb := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_2467_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_b9b7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_8bdb;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_8bdb;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_8bdb;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_eadd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_4b07_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_1705] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_1705_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_e0cc_return_output);

     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_d57b] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_d57b_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_8f1f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_f973 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_1705_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_d57b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_f973;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_f973;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_f973;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_56ce_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_33ee_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_59ba] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_59ba_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_1d2d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_1d2d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_57d4_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8ec4_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_2f14 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_1d2d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_59ba_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_2f14;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_2f14;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_2f14;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_50b8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_54cc_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output;
     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_a917] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_a917_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_9c80] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_9c80_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_3c26_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_0414_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_bc00 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_9c80_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_a917_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_bc00;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_bc00;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_bc00;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_1047_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_5e86_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_473d] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_473d_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_5dc5_return_output);

     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_864c] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_864c_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_0699_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_57e4 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_473d_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_864c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_57e4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_57e4;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_57e4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_7216_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_cfa1_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_d765] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_d765_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_7a9a] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_7a9a_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_c0c4_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_2d9a_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_df9c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_7a9a_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_d765_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_df9c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_df9c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_df9c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_658a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_7bd6_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_5d9f] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_5d9f_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_025d_return_output);

     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_6b1f] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_6b1f_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_89d4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_dd82 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_5d9f_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_6b1f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_dd82;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_dd82;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_dd82;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_ec45_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_b6f4_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_e1ec] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_e1ec_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_bd97] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_bd97_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_1366_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_ab0c_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_9f8c := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_bd97_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_e1ec_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_9f8c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_9f8c;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_9f8c;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_5214_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_c975_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_c93b] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_c93b_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_d03a_return_output);

     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_fe7b] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_fe7b_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_9457_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_834e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_c93b_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_fe7b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_834e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_834e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_834e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_1be6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_39b5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output;
     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_1736] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_1736_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_55c0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_55c0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_3894_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_849b_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_3e2a := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_55c0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_1736_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_3e2a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_6d4f_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_724e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
