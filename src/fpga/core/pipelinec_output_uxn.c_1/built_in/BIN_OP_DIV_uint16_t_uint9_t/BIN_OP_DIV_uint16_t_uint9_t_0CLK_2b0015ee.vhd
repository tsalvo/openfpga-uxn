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
-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output : unsigned(15 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0]
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse : unsigned(15 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output : unsigned(15 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db]
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left : unsigned(15 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d]
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse : unsigned(15 downto 0);
signal output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616 : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse,
remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6 : entity work.BIN_OP_MINUS_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db : entity work.BIN_OP_GTE_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right,
BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output);

-- output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse,
output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output,
 remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output,
 output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_left_resized : unsigned(15 downto 0);
 variable VAR_right_resized : unsigned(15 downto 0);
 variable VAR_output : unsigned(15 downto 0);
 variable VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_7772 : unsigned(15 downto 0);
 variable VAR_remainder : unsigned(15 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_cdf4 : unsigned(15 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_d424_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_6dff : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_59ed_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f468_return_output : unsigned(15 downto 0);
 variable VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_a353_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_d9dc : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_3d6e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_8a28_return_output : unsigned(15 downto 0);
 variable VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_d5ab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_cdb0 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_4013_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_c152_return_output : unsigned(15 downto 0);
 variable VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_163f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_4f82 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_e345_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_603a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_fa93_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_2904 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_50ad_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_925a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_bc71_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_28d6 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_e8ec_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3a6b_return_output : unsigned(15 downto 0);
 variable VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_0a2b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b729 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_61d0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_2613_return_output : unsigned(15 downto 0);
 variable VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_d800_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_1851 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_3840_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_05b7_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8c0f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_aa8e : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_af17_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_7d1a_return_output : unsigned(15 downto 0);
 variable VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_734d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_6d9a : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_da46_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_c266_return_output : unsigned(15 downto 0);
 variable VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_4d91_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_72b9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_4acc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5eb8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3da1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_cda9 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_d838_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_6e8e_return_output : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_731a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_d227 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_6d8a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_8aa6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_0032_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_dc7f : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_d4f3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_fd74_return_output : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_99dc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_c74d : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_7620_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output : unsigned(15 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_f369_return_output : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_a4ea_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1f97 : unsigned(15 downto 0);
 variable VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_58e9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output : unsigned(15 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_b932_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_cdf4 := resize(to_unsigned(0, 1), 16);
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_7772 := resize(to_unsigned(0, 1), 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse := VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_7772;
     -- uint16_uint1_15[BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f468] LATENCY=0
     VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f468_return_output := uint16_uint1_15(
     VAR_output_BIN_OP_DIV_uint16_t_uint9_t_c_l16_c3_7772,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue := VAR_uint16_uint1_15_BIN_OP_DIV_uint16_t_uint9_t_c_l47_c14_f468_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right := VAR_right;
     -- uint16_12_12[BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_163f] LATENCY=0
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_163f_return_output := uint16_12_12(
     VAR_left);

     -- uint16_10_10[BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_bc71] LATENCY=0
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_bc71_return_output := uint16_10_10(
     VAR_left);

     -- uint16_13_13[BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_d5ab] LATENCY=0
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_d5ab_return_output := uint16_13_13(
     VAR_left);

     -- uint16_3_3[BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_731a] LATENCY=0
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_731a_return_output := uint16_3_3(
     VAR_left);

     -- uint16_6_6[BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_734d] LATENCY=0
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_734d_return_output := uint16_6_6(
     VAR_left);

     -- uint16_2_2[BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_0032] LATENCY=0
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_0032_return_output := uint16_2_2(
     VAR_left);

     -- uint16_1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_99dc] LATENCY=0
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_99dc_return_output := uint16_1_1(
     VAR_left);

     -- uint16_8_8[BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_d800] LATENCY=0
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_d800_return_output := uint16_8_8(
     VAR_left);

     -- uint16_14_14[BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_a353] LATENCY=0
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_a353_return_output := uint16_14_14(
     VAR_left);

     -- uint16_11_11[BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_fa93] LATENCY=0
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_fa93_return_output := uint16_11_11(
     VAR_left);

     -- uint16_4_4[BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3da1] LATENCY=0
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3da1_return_output := uint16_4_4(
     VAR_left);

     -- uint16_0_0[BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_a4ea] LATENCY=0
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_a4ea_return_output := uint16_0_0(
     VAR_left);

     -- uint16_9_9[BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_0a2b] LATENCY=0
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_0a2b_return_output := uint16_9_9(
     VAR_left);

     -- uint16_5_5[BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_4d91] LATENCY=0
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_4d91_return_output := uint16_5_5(
     VAR_left);

     -- uint16_15_15[BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_d424] LATENCY=0
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_d424_return_output := uint16_15_15(
     VAR_left);

     -- uint16_7_7[BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8c0f] LATENCY=0
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8c0f_return_output := uint16_7_7(
     VAR_left);

     -- Submodule level 1
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_59ed] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_59ed_return_output := uint16_uint1(
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l19_c3_cdf4,
     VAR_uint16_15_15_BIN_OP_DIV_uint16_t_uint9_t_c_l41_c20_d424_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_6dff := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c15_59ed_return_output, 16);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_6dff;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_6dff;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l42_c3_6dff;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c6_f56f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l45_c17_ea21_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_3d6e] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_3d6e_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output,
     VAR_uint16_14_14_BIN_OP_DIV_uint16_t_uint9_t_c_l50_c20_a353_return_output);

     -- uint16_uint1_14[BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_8a28] LATENCY=0
     VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_8a28_return_output := uint16_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l43_c3_39a0_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_d9dc := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c15_3d6e_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue := VAR_uint16_uint1_14_BIN_OP_DIV_uint16_t_uint9_t_c_l56_c14_8a28_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_d9dc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_d9dc;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l51_c3_d9dc;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c6_f0c6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l54_c17_b64b_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_4013] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_4013_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output,
     VAR_uint16_13_13_BIN_OP_DIV_uint16_t_uint9_t_c_l59_c20_d5ab_return_output);

     -- uint16_uint1_13[BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_c152] LATENCY=0
     VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_c152_return_output := uint16_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l52_c3_0942_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_cdb0 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c15_4013_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue := VAR_uint16_uint1_13_BIN_OP_DIV_uint16_t_uint9_t_c_l65_c14_c152_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_cdb0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_cdb0;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l60_c3_cdb0;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c6_3013_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l63_c17_623a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output;
     -- uint16_uint1_12[BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_603a] LATENCY=0
     VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_603a_return_output := uint16_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_e345] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_e345_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l61_c3_057a_return_output,
     VAR_uint16_12_12_BIN_OP_DIV_uint16_t_uint9_t_c_l68_c20_163f_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_4f82 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c15_e345_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue := VAR_uint16_uint1_12_BIN_OP_DIV_uint16_t_uint9_t_c_l74_c14_603a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_4f82;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_4f82;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l69_c3_4f82;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c6_26ff_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l72_c17_42ac_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output;
     -- uint16_uint1_11[BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_925a] LATENCY=0
     VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_925a_return_output := uint16_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_50ad] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_50ad_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l70_c3_b3f5_return_output,
     VAR_uint16_11_11_BIN_OP_DIV_uint16_t_uint9_t_c_l77_c20_fa93_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_2904 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c15_50ad_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue := VAR_uint16_uint1_11_BIN_OP_DIV_uint16_t_uint9_t_c_l83_c14_925a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_2904;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_2904;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l78_c3_2904;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c6_1826_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l81_c17_3886_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output;
     -- uint16_uint1_10[BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3a6b] LATENCY=0
     VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3a6b_return_output := uint16_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_e8ec] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_e8ec_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l79_c3_b441_return_output,
     VAR_uint16_10_10_BIN_OP_DIV_uint16_t_uint9_t_c_l86_c20_bc71_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_28d6 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c15_e8ec_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue := VAR_uint16_uint1_10_BIN_OP_DIV_uint16_t_uint9_t_c_l92_c14_3a6b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_28d6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_28d6;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l87_c3_28d6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c6_04d3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l90_c17_da63_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_61d0] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_61d0_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output,
     VAR_uint16_9_9_BIN_OP_DIV_uint16_t_uint9_t_c_l95_c20_0a2b_return_output);

     -- uint16_uint1_9[BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_2613] LATENCY=0
     VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_2613_return_output := uint16_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l88_c3_ab55_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b729 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c15_61d0_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue := VAR_uint16_uint1_9_BIN_OP_DIV_uint16_t_uint9_t_c_l101_c14_2613_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b729;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b729;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l96_c3_b729;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c6_97df_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l99_c17_3d45_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output;
     -- uint16_uint1_8[BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_05b7] LATENCY=0
     VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_05b7_return_output := uint16_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_3840] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_3840_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l97_c3_ab3a_return_output,
     VAR_uint16_8_8_BIN_OP_DIV_uint16_t_uint9_t_c_l104_c20_d800_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_1851 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c15_3840_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue := VAR_uint16_uint1_8_BIN_OP_DIV_uint16_t_uint9_t_c_l110_c14_05b7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_1851;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_1851;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l105_c3_1851;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c6_71ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l108_c17_96c9_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output;
     -- uint16_uint1_7[BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_7d1a] LATENCY=0
     VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_7d1a_return_output := uint16_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_af17] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_af17_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l106_c3_5577_return_output,
     VAR_uint16_7_7_BIN_OP_DIV_uint16_t_uint9_t_c_l113_c20_8c0f_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_aa8e := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c15_af17_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue := VAR_uint16_uint1_7_BIN_OP_DIV_uint16_t_uint9_t_c_l119_c14_7d1a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_aa8e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_aa8e;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l114_c3_aa8e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c6_37cc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l117_c17_499c_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output;
     -- uint16_uint1_6[BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_c266] LATENCY=0
     VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_c266_return_output := uint16_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_da46] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_da46_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l115_c3_5286_return_output,
     VAR_uint16_6_6_BIN_OP_DIV_uint16_t_uint9_t_c_l122_c20_734d_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_6d9a := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c15_da46_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue := VAR_uint16_uint1_6_BIN_OP_DIV_uint16_t_uint9_t_c_l128_c14_c266_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_6d9a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_6d9a;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l123_c3_6d9a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c6_3852_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l126_c17_47de_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_4acc] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_4acc_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output,
     VAR_uint16_5_5_BIN_OP_DIV_uint16_t_uint9_t_c_l131_c20_4d91_return_output);

     -- uint16_uint1_5[BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5eb8] LATENCY=0
     VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5eb8_return_output := uint16_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l124_c3_549b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_72b9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c15_4acc_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue := VAR_uint16_uint1_5_BIN_OP_DIV_uint16_t_uint9_t_c_l137_c14_5eb8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_72b9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_72b9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l132_c3_72b9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c6_462d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l135_c17_e529_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output;
     -- uint16_uint1_4[BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_6e8e] LATENCY=0
     VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_6e8e_return_output := uint16_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_d838] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_d838_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l133_c3_123f_return_output,
     VAR_uint16_4_4_BIN_OP_DIV_uint16_t_uint9_t_c_l140_c20_3da1_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_cda9 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c15_d838_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue := VAR_uint16_uint1_4_BIN_OP_DIV_uint16_t_uint9_t_c_l146_c14_6e8e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_cda9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_cda9;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l141_c3_cda9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c6_8ed8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l144_c17_baea_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output;
     -- uint16_uint1_3[BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_8aa6] LATENCY=0
     VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_8aa6_return_output := uint16_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_6d8a] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_6d8a_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l142_c3_6204_return_output,
     VAR_uint16_3_3_BIN_OP_DIV_uint16_t_uint9_t_c_l149_c20_731a_return_output);

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_d227 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c15_6d8a_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue := VAR_uint16_uint1_3_BIN_OP_DIV_uint16_t_uint9_t_c_l155_c14_8aa6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_d227;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_d227;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l150_c3_d227;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c6_1ed6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l153_c17_caed_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output;
     -- uint16_uint1_2[BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_fd74] LATENCY=0
     VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_fd74_return_output := uint16_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output,
     to_unsigned(1, 1));

     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_d4f3] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_d4f3_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l151_c3_e4f4_return_output,
     VAR_uint16_2_2_BIN_OP_DIV_uint16_t_uint9_t_c_l158_c20_0032_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_dc7f := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c15_d4f3_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue := VAR_uint16_uint1_2_BIN_OP_DIV_uint16_t_uint9_t_c_l164_c14_fd74_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_dc7f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_dc7f;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l159_c3_dc7f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c6_17b4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l162_c17_1167_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_7620] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_7620_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output,
     VAR_uint16_1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l167_c20_99dc_return_output);

     -- uint16_uint1_1[BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_f369] LATENCY=0
     VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_f369_return_output := uint16_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l160_c3_41c0_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_c74d := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c15_7620_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue := VAR_uint16_uint1_1_BIN_OP_DIV_uint16_t_uint9_t_c_l173_c14_f369_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_c74d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_c74d;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l168_c3_c74d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c6_d616_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint16_t_uint9_t_c_l171_c17_02a6_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output := remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output;

     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output;
     -- uint16_uint1[BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_58e9] LATENCY=0
     VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_58e9_return_output := uint16_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output,
     VAR_uint16_0_0_BIN_OP_DIV_uint16_t_uint9_t_c_l176_c20_a4ea_return_output);

     -- uint16_uint1_0[BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_b932] LATENCY=0
     VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_b932_return_output := uint16_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l169_c3_caa0_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1f97 := resize(VAR_uint16_uint1_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c15_58e9_return_output, 16);
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue := VAR_uint16_uint1_0_BIN_OP_DIV_uint16_t_uint9_t_c_l182_c14_b932_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left := VAR_remainder_BIN_OP_DIV_uint16_t_uint9_t_c_l177_c3_1f97;
     -- BIN_OP_GTE[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_left;
     BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output := BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c6_c0db_return_output;
     -- output_MUX[BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_cond;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iftrue;
     output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output := output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output;

     -- Submodule level 49
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint16_t_uint9_t_c_l178_c3_7e2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
