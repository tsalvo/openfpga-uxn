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
-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output : unsigned(31 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(31 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_left_resized : unsigned(31 downto 0);
 variable VAR_right_resized : unsigned(31 downto 0);
 variable VAR_output : unsigned(31 downto 0);
 variable VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_0cf3 : unsigned(31 downto 0);
 variable VAR_remainder : unsigned(31 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_852f : unsigned(31 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_3651_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_6fe4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_5bbb_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_46fd_return_output : unsigned(31 downto 0);
 variable VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_df2f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_5b87 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_0b63_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_94b3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_ddb5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_ce80 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_2b87_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_5fef_return_output : unsigned(31 downto 0);
 variable VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aec0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ade7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_78df_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_273d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_5494_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_2993 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_3dbe_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_009f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_2d45_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_919c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_5124_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_c6bc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_a0ea_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_9344 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_d3ba_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_bef8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_a5a8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_7873 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_9609_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_4623_return_output : unsigned(31 downto 0);
 variable VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_de72_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_62ce : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_cfa2_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_035a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_f66b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_2278 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_f4f8_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_353f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_831a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_dc5d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_ed44_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_c220_return_output : unsigned(31 downto 0);
 variable VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_8f40_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_0cec : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_042f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_b604_return_output : unsigned(31 downto 0);
 variable VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_db0e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_8d7a : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_117c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_88e7_return_output : unsigned(31 downto 0);
 variable VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_5c54_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_7103 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_d11f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_085f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_0e84_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_03e7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_51c8_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_6d16_return_output : unsigned(31 downto 0);
 variable VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_5d44_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_577b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_d905_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_b584_return_output : unsigned(31 downto 0);
 variable VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_ed70_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_e1ec : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f744_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_6546_return_output : unsigned(31 downto 0);
 variable VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_639e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_75e8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_4a8b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_56bb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_df89_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_d708 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_6295_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_cdb2_return_output : unsigned(31 downto 0);
 variable VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_29a5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_c77c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_67cf_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_2ed6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_b1a7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_43c8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_682d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6868_return_output : unsigned(31 downto 0);
 variable VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_bdab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_3f9b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_5d51_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_e9a0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_23f9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d9b6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_80a0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_33d4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_d670_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_daa4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_be13_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_fdb6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_e6c4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_7ad7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_9460_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_e907_return_output : unsigned(31 downto 0);
 variable VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_80f5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_dbf0 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_4862_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_7984_return_output : unsigned(31 downto 0);
 variable VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_ac90_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_1840 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_5b36_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_72b0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_5c2f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_2a41 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_a3bf_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_efca_return_output : unsigned(31 downto 0);
 variable VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_f677_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_744d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_700d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_7bfd_return_output : unsigned(31 downto 0);
 variable VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_40bf_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_de65 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_f6d5_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_c05f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_529c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_2fed : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4b69_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_779b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_bfd3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_0f3e : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_5658_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond : unsigned(0 downto 0);
 variable VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_47cd_return_output : unsigned(31 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_852f := resize(to_unsigned(0, 1), 32);
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_0cf3 := resize(to_unsigned(0, 1), 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse := VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_0cf3;
     -- uint32_uint1_31[BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_46fd] LATENCY=0
     VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_46fd_return_output := uint32_uint1_31(
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_0cf3,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue := VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_46fd_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right := VAR_right;
     -- uint32_16_16[BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_5d44] LATENCY=0
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_5d44_return_output := uint32_16_16(
     VAR_left);

     -- uint32_22_22[BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_f66b] LATENCY=0
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_f66b_return_output := uint32_22_22(
     VAR_left);

     -- uint32_1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_529c] LATENCY=0
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_529c_return_output := uint32_1_1(
     VAR_left);

     -- uint32_5_5[BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_ac90] LATENCY=0
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_ac90_return_output := uint32_5_5(
     VAR_left);

     -- uint32_30_30[BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_df2f] LATENCY=0
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_df2f_return_output := uint32_30_30(
     VAR_left);

     -- uint32_29_29[BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_ddb5] LATENCY=0
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_ddb5_return_output := uint32_29_29(
     VAR_left);

     -- uint32_28_28[BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aec0] LATENCY=0
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aec0_return_output := uint32_28_28(
     VAR_left);

     -- uint32_11_11[BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_b1a7] LATENCY=0
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_b1a7_return_output := uint32_11_11(
     VAR_left);

     -- uint32_7_7[BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_e6c4] LATENCY=0
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_e6c4_return_output := uint32_7_7(
     VAR_left);

     -- uint32_31_31[BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_3651] LATENCY=0
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_3651_return_output := uint32_31_31(
     VAR_left);

     -- uint32_14_14[BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_639e] LATENCY=0
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_639e_return_output := uint32_14_14(
     VAR_left);

     -- uint32_21_21[BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_831a] LATENCY=0
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_831a_return_output := uint32_21_21(
     VAR_left);

     -- uint32_17_17[BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_0e84] LATENCY=0
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_0e84_return_output := uint32_17_17(
     VAR_left);

     -- uint32_6_6[BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_80f5] LATENCY=0
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_80f5_return_output := uint32_6_6(
     VAR_left);

     -- uint32_0_0[BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_bfd3] LATENCY=0
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_bfd3_return_output := uint32_0_0(
     VAR_left);

     -- uint32_8_8[BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_d670] LATENCY=0
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_d670_return_output := uint32_8_8(
     VAR_left);

     -- uint32_24_24[BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_a5a8] LATENCY=0
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_a5a8_return_output := uint32_24_24(
     VAR_left);

     -- uint32_19_19[BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_db0e] LATENCY=0
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_db0e_return_output := uint32_19_19(
     VAR_left);

     -- uint32_9_9[BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_23f9] LATENCY=0
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_23f9_return_output := uint32_9_9(
     VAR_left);

     -- uint32_27_27[BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_5494] LATENCY=0
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_5494_return_output := uint32_27_27(
     VAR_left);

     -- uint32_23_23[BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_de72] LATENCY=0
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_de72_return_output := uint32_23_23(
     VAR_left);

     -- uint32_15_15[BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_ed70] LATENCY=0
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_ed70_return_output := uint32_15_15(
     VAR_left);

     -- uint32_13_13[BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_df89] LATENCY=0
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_df89_return_output := uint32_13_13(
     VAR_left);

     -- uint32_18_18[BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_5c54] LATENCY=0
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_5c54_return_output := uint32_18_18(
     VAR_left);

     -- uint32_25_25[BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_a0ea] LATENCY=0
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_a0ea_return_output := uint32_25_25(
     VAR_left);

     -- uint32_10_10[BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_bdab] LATENCY=0
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_bdab_return_output := uint32_10_10(
     VAR_left);

     -- uint32_20_20[BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_8f40] LATENCY=0
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_8f40_return_output := uint32_20_20(
     VAR_left);

     -- uint32_26_26[BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_2d45] LATENCY=0
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_2d45_return_output := uint32_26_26(
     VAR_left);

     -- uint32_3_3[BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_f677] LATENCY=0
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_f677_return_output := uint32_3_3(
     VAR_left);

     -- uint32_12_12[BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_29a5] LATENCY=0
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_29a5_return_output := uint32_12_12(
     VAR_left);

     -- uint32_4_4[BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_5c2f] LATENCY=0
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_5c2f_return_output := uint32_4_4(
     VAR_left);

     -- uint32_2_2[BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_40bf] LATENCY=0
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_40bf_return_output := uint32_2_2(
     VAR_left);

     -- Submodule level 1
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_5bbb] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_5bbb_return_output := uint32_uint1(
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_852f,
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_3651_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_6fe4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_5bbb_return_output, 32);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_6fe4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_6fe4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_6fe4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_a295_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_441f_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_0b63] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_0b63_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output,
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_df2f_return_output);

     -- uint32_uint1_30[BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_94b3] LATENCY=0
     VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_94b3_return_output := uint32_uint1_30(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_5088_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_5b87 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_0b63_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue := VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_94b3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_5b87;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_5b87;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_5b87;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fb1e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_e58f_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output;
     -- uint32_uint1_29[BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_5fef] LATENCY=0
     VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_5fef_return_output := uint32_uint1_29(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_2b87] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_2b87_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_61e9_return_output,
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_ddb5_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_ce80 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_2b87_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue := VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_5fef_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_ce80;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_ce80;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_ce80;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_938d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_965e_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output;
     -- uint32_uint1_28[BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_273d] LATENCY=0
     VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_273d_return_output := uint32_uint1_28(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_78df] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_78df_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_00a1_return_output,
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_aec0_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ade7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_78df_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue := VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_273d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ade7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ade7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_ade7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_0232_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_0d8a_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output;
     -- uint32_uint1_27[BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_009f] LATENCY=0
     VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_009f_return_output := uint32_uint1_27(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_3dbe] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_3dbe_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_a373_return_output,
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_5494_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_2993 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_3dbe_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue := VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_009f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_2993;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_2993;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_2993;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_693a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_4da9_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output;
     -- uint32_uint1_26[BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_c6bc] LATENCY=0
     VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_c6bc_return_output := uint32_uint1_26(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_5124] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_5124_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_4020_return_output,
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_2d45_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_919c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_5124_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue := VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_c6bc_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_919c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_919c;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_919c;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_4895_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_5648_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_d3ba] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_d3ba_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output,
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_a0ea_return_output);

     -- uint32_uint1_25[BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_bef8] LATENCY=0
     VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_bef8_return_output := uint32_uint1_25(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_8990_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_9344 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_d3ba_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue := VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_bef8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_9344;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_9344;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_9344;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_a87c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4dc1_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_9609] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_9609_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output,
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_a5a8_return_output);

     -- uint32_uint1_24[BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_4623] LATENCY=0
     VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_4623_return_output := uint32_uint1_24(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_7797_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_7873 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_9609_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue := VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_4623_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_7873;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_7873;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_7873;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_596d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_246c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_cfa2] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_cfa2_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output,
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_de72_return_output);

     -- uint32_uint1_23[BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_035a] LATENCY=0
     VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_035a_return_output := uint32_uint1_23(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f427_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_62ce := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_cfa2_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue := VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_035a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_62ce;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_62ce;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_62ce;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_0a8c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8933_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output;
     -- uint32_uint1_22[BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_353f] LATENCY=0
     VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_353f_return_output := uint32_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_f4f8] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_f4f8_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_e4ec_return_output,
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_f66b_return_output);

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_2278 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_f4f8_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue := VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_353f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_2278;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_2278;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_2278;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_0f87_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_42b0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_ed44] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_ed44_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output,
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_831a_return_output);

     -- uint32_uint1_21[BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_c220] LATENCY=0
     VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_c220_return_output := uint32_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_baa4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_dc5d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_ed44_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue := VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_c220_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_dc5d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_dc5d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_dc5d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_3058_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_2822_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_042f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_042f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output,
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_8f40_return_output);

     -- uint32_uint1_20[BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_b604] LATENCY=0
     VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_b604_return_output := uint32_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8dd1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_0cec := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_042f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue := VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_b604_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_0cec;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_0cec;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_0cec;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_b11c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_f09e_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_117c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_117c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output,
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_db0e_return_output);

     -- uint32_uint1_19[BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_88e7] LATENCY=0
     VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_88e7_return_output := uint32_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_3b96_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_8d7a := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_117c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue := VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_88e7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_8d7a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_8d7a;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_8d7a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_320c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_e5ba_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output;
     -- uint32_uint1_18[BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_085f] LATENCY=0
     VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_085f_return_output := uint32_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_d11f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_d11f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_f6a4_return_output,
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_5c54_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_7103 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_d11f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue := VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_085f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_7103;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_7103;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_7103;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_efc9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_d7e4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_51c8] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_51c8_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output,
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_0e84_return_output);

     -- uint32_uint1_17[BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_6d16] LATENCY=0
     VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_6d16_return_output := uint32_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_90be_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_03e7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_51c8_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue := VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_6d16_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_03e7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_03e7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_03e7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_07b4_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_1f40_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_d905] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_d905_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output,
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_5d44_return_output);

     -- uint32_uint1_16[BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_b584] LATENCY=0
     VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_b584_return_output := uint32_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_115f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_577b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_d905_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue := VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_b584_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_577b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_577b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_577b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_edc1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_8a2c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f744] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f744_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output,
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_ed70_return_output);

     -- uint32_uint1_15[BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_6546] LATENCY=0
     VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_6546_return_output := uint32_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_825f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_e1ec := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f744_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue := VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_6546_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_e1ec;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_e1ec;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_e1ec;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_b98f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_43dd_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output;
     -- uint32_uint1_14[BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_56bb] LATENCY=0
     VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_56bb_return_output := uint32_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_4a8b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_4a8b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_2415_return_output,
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_639e_return_output);

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_75e8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_4a8b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue := VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_56bb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_75e8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_75e8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_75e8;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_f2ba_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_5f49_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_6295] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_6295_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output,
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_df89_return_output);

     -- uint32_uint1_13[BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_cdb2] LATENCY=0
     VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_cdb2_return_output := uint32_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_1517_return_output,
     to_unsigned(1, 1));

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_d708 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_6295_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue := VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_cdb2_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_d708;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_d708;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_d708;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_df93_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_5361_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output;
     -- uint32_uint1_12[BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_2ed6] LATENCY=0
     VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_2ed6_return_output := uint32_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_67cf] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_67cf_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_a879_return_output,
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_29a5_return_output);

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_c77c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_67cf_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue := VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_2ed6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_c77c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_c77c;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_c77c;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_0876_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b8af_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output;
     -- uint32_uint1_11[BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6868] LATENCY=0
     VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6868_return_output := uint32_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_682d] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_682d_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_0c92_return_output,
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_b1a7_return_output);

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_43c8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_682d_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue := VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6868_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_43c8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_43c8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_43c8;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_183f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3726_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output;
     -- uint32_uint1_10[BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_e9a0] LATENCY=0
     VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_e9a0_return_output := uint32_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_5d51] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_5d51_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_ddf5_return_output,
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_bdab_return_output);

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_3f9b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_5d51_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue := VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_e9a0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_3f9b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_3f9b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_3f9b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_a8b0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_a0ec_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_80a0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_80a0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output,
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_23f9_return_output);

     -- uint32_uint1_9[BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_33d4] LATENCY=0
     VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_33d4_return_output := uint32_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_1a46_return_output,
     to_unsigned(1, 1));

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d9b6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_80a0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue := VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_33d4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d9b6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d9b6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d9b6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_d16c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_9d11_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output;
     -- uint32_uint1_8[BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_fdb6] LATENCY=0
     VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_fdb6_return_output := uint32_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_be13] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_be13_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_8bd4_return_output,
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_d670_return_output);

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_daa4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_be13_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue := VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_fdb6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_daa4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_daa4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_daa4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_ffa5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_50bd_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output;

     -- Submodule level 73
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_9460] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_9460_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output,
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_e6c4_return_output);

     -- uint32_uint1_7[BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_e907] LATENCY=0
     VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_e907_return_output := uint32_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_4b91_return_output,
     to_unsigned(1, 1));

     -- Submodule level 74
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_7ad7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_9460_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue := VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_e907_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_7ad7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_7ad7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_7ad7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output;

     -- Submodule level 75
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_e2f3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_0da5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output;

     -- Submodule level 76
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_4862] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_4862_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output,
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_80f5_return_output);

     -- uint32_uint1_6[BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_7984] LATENCY=0
     VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_7984_return_output := uint32_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_18af_return_output,
     to_unsigned(1, 1));

     -- Submodule level 77
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_dbf0 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_4862_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue := VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_7984_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_dbf0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_dbf0;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_dbf0;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output;

     -- Submodule level 78
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_ea19_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_64bf_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output;

     -- Submodule level 79
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output;
     -- uint32_uint1_5[BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_72b0] LATENCY=0
     VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_72b0_return_output := uint32_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_5b36] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_5b36_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_c9cc_return_output,
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_ac90_return_output);

     -- Submodule level 80
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_1840 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_5b36_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue := VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_72b0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_1840;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_1840;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_1840;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output;

     -- Submodule level 81
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4b1e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_9f57_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output;

     -- Submodule level 82
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output;
     -- uint32_uint1_4[BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_efca] LATENCY=0
     VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_efca_return_output := uint32_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_a3bf] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_a3bf_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_7eb2_return_output,
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_5c2f_return_output);

     -- Submodule level 83
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_2a41 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_a3bf_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue := VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_efca_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_2a41;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_2a41;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_2a41;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output;

     -- Submodule level 84
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_4af7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_23da_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output;

     -- Submodule level 85
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_700d] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_700d_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output,
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_f677_return_output);

     -- uint32_uint1_3[BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_7bfd] LATENCY=0
     VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_7bfd_return_output := uint32_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2b57_return_output,
     to_unsigned(1, 1));

     -- Submodule level 86
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_744d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_700d_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue := VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_7bfd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_744d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_744d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_744d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output;

     -- Submodule level 87
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_cee0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_b5a0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output;

     -- Submodule level 88
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_f6d5] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_f6d5_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output,
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_40bf_return_output);

     -- uint32_uint1_2[BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_c05f] LATENCY=0
     VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_c05f_return_output := uint32_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_8ab6_return_output,
     to_unsigned(1, 1));

     -- Submodule level 89
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_de65 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_f6d5_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue := VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_c05f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_de65;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_de65;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_de65;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output;

     -- Submodule level 90
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_350f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_e1bc_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output;

     -- Submodule level 91
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4b69] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4b69_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output,
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_529c_return_output);

     -- uint32_uint1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_779b] LATENCY=0
     VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_779b_return_output := uint32_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_19c8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 92
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_2fed := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4b69_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue := VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_779b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_2fed;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_2fed;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_2fed;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output;

     -- Submodule level 93
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_dd46_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_6617_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output;

     -- Submodule level 94
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output;
     -- uint32_uint1_0[BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_47cd] LATENCY=0
     VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_47cd_return_output := uint32_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_5658] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_5658_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_8761_return_output,
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_bfd3_return_output);

     -- Submodule level 95
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_0f3e := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_5658_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue := VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_47cd_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_0f3e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output;

     -- Submodule level 96
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_1020_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output;

     -- Submodule level 97
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_1cd6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
