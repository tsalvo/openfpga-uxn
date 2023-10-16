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
-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output : unsigned(31 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(31 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_left_resized : unsigned(31 downto 0);
 variable VAR_right_resized : unsigned(31 downto 0);
 variable VAR_output : unsigned(31 downto 0);
 variable VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e2a4 : unsigned(31 downto 0);
 variable VAR_remainder : unsigned(31 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_228f : unsigned(31 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_a376_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_3d37 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_c1cf_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_1743_return_output : unsigned(31 downto 0);
 variable VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3567_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_bd59 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_7c39_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6efa_return_output : unsigned(31 downto 0);
 variable VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_f107_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_c0b0 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_e1d9_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_c8aa_return_output : unsigned(31 downto 0);
 variable VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_3a2a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_a50d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_b36b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_76b6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_c8e5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_36e4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_5135_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_d7ec_return_output : unsigned(31 downto 0);
 variable VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_c6cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_b553 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_82de_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_99e7_return_output : unsigned(31 downto 0);
 variable VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_230b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_3027 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_9d46_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_2939_return_output : unsigned(31 downto 0);
 variable VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_950d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_cb92 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_53a0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0b71_return_output : unsigned(31 downto 0);
 variable VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_8d31_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_9fa8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9bec_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_fadc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8229_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_3c87 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_3554_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_10bc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ebe4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_d201 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_6c1c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_e683_return_output : unsigned(31 downto 0);
 variable VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_2dff_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e8d8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4690_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_a4bb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_b0fb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_494d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_4420_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_5c08_return_output : unsigned(31 downto 0);
 variable VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_4829_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_946e : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_b179_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_baa7_return_output : unsigned(31 downto 0);
 variable VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_99ef_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_7c81 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_33ab_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_ccec_return_output : unsigned(31 downto 0);
 variable VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8a18_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_a815 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_f3ea_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_32c8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_d64b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_25ae : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_5ea0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d9de_return_output : unsigned(31 downto 0);
 variable VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_42f9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d6cc : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_e0c1_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_a7c3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_06d5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_a9a3 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_cd33_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_e3e3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_dc46_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_287b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_a257_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_499e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_2e66_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_9cb0 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_cea8_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_2be0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_ed12_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_4ef6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_fe16_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_3bb0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_3444_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d614 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_2e96_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_0d0e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_8290_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_b656 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_a605_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_8a78_return_output : unsigned(31 downto 0);
 variable VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_4774_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_2b60 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_594f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_cbee_return_output : unsigned(31 downto 0);
 variable VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_8e31_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_d6ce : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_121e_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_18e2_return_output : unsigned(31 downto 0);
 variable VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_da96_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_5c9b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_a102_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_e22f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_f0af_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_01f4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_4ba0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_aac3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_488c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_893a : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_378c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_48ef_return_output : unsigned(31 downto 0);
 variable VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_9aeb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_c29a : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_6b7c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_695f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_4bde_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_5df7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4c95_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_4fdf_return_output : unsigned(31 downto 0);
 variable VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_da1d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_ea9e : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_31da_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond : unsigned(0 downto 0);
 variable VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5073_return_output : unsigned(31 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_228f := resize(to_unsigned(0, 1), 32);
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e2a4 := resize(to_unsigned(0, 1), 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse := VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e2a4;
     -- uint32_uint1_31[BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_1743] LATENCY=0
     VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_1743_return_output := uint32_uint1_31(
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_e2a4,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue := VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_1743_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right := VAR_right;
     -- uint32_27_27[BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_c8e5] LATENCY=0
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_c8e5_return_output := uint32_27_27(
     VAR_left);

     -- uint32_28_28[BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_3a2a] LATENCY=0
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_3a2a_return_output := uint32_28_28(
     VAR_left);

     -- uint32_29_29[BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_f107] LATENCY=0
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_f107_return_output := uint32_29_29(
     VAR_left);

     -- uint32_10_10[BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_ed12] LATENCY=0
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_ed12_return_output := uint32_10_10(
     VAR_left);

     -- uint32_16_16[BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8a18] LATENCY=0
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8a18_return_output := uint32_16_16(
     VAR_left);

     -- uint32_8_8[BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_8290] LATENCY=0
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_8290_return_output := uint32_8_8(
     VAR_left);

     -- uint32_26_26[BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_c6cd] LATENCY=0
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_c6cd_return_output := uint32_26_26(
     VAR_left);

     -- uint32_3_3[BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_488c] LATENCY=0
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_488c_return_output := uint32_3_3(
     VAR_left);

     -- uint32_9_9[BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_3444] LATENCY=0
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_3444_return_output := uint32_9_9(
     VAR_left);

     -- uint32_4_4[BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_f0af] LATENCY=0
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_f0af_return_output := uint32_4_4(
     VAR_left);

     -- uint32_19_19[BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_b0fb] LATENCY=0
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_b0fb_return_output := uint32_19_19(
     VAR_left);

     -- uint32_24_24[BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_950d] LATENCY=0
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_950d_return_output := uint32_24_24(
     VAR_left);

     -- uint32_31_31[BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_a376] LATENCY=0
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_a376_return_output := uint32_31_31(
     VAR_left);

     -- uint32_6_6[BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_8e31] LATENCY=0
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_8e31_return_output := uint32_6_6(
     VAR_left);

     -- uint32_7_7[BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_4774] LATENCY=0
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_4774_return_output := uint32_7_7(
     VAR_left);

     -- uint32_13_13[BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_06d5] LATENCY=0
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_06d5_return_output := uint32_13_13(
     VAR_left);

     -- uint32_18_18[BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_4829] LATENCY=0
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_4829_return_output := uint32_18_18(
     VAR_left);

     -- uint32_11_11[BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_2e66] LATENCY=0
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_2e66_return_output := uint32_11_11(
     VAR_left);

     -- uint32_23_23[BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_8d31] LATENCY=0
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_8d31_return_output := uint32_23_23(
     VAR_left);

     -- uint32_12_12[BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_dc46] LATENCY=0
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_dc46_return_output := uint32_12_12(
     VAR_left);

     -- uint32_22_22[BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8229] LATENCY=0
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8229_return_output := uint32_22_22(
     VAR_left);

     -- uint32_25_25[BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_230b] LATENCY=0
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_230b_return_output := uint32_25_25(
     VAR_left);

     -- uint32_2_2[BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_9aeb] LATENCY=0
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_9aeb_return_output := uint32_2_2(
     VAR_left);

     -- uint32_0_0[BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_da1d] LATENCY=0
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_da1d_return_output := uint32_0_0(
     VAR_left);

     -- uint32_20_20[BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_2dff] LATENCY=0
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_2dff_return_output := uint32_20_20(
     VAR_left);

     -- uint32_15_15[BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_d64b] LATENCY=0
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_d64b_return_output := uint32_15_15(
     VAR_left);

     -- uint32_17_17[BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_99ef] LATENCY=0
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_99ef_return_output := uint32_17_17(
     VAR_left);

     -- uint32_1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_4bde] LATENCY=0
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_4bde_return_output := uint32_1_1(
     VAR_left);

     -- uint32_5_5[BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_da96] LATENCY=0
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_da96_return_output := uint32_5_5(
     VAR_left);

     -- uint32_14_14[BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_42f9] LATENCY=0
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_42f9_return_output := uint32_14_14(
     VAR_left);

     -- uint32_30_30[BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3567] LATENCY=0
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3567_return_output := uint32_30_30(
     VAR_left);

     -- uint32_21_21[BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ebe4] LATENCY=0
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ebe4_return_output := uint32_21_21(
     VAR_left);

     -- Submodule level 1
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_c1cf] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_c1cf_return_output := uint32_uint1(
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_228f,
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_a376_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_3d37 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_c1cf_return_output, 32);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_3d37;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_3d37;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_3d37;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_4680_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_d708_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output;
     -- uint32_uint1_30[BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6efa] LATENCY=0
     VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6efa_return_output := uint32_uint1_30(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_7c39] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_7c39_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_9e2e_return_output,
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_3567_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_bd59 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_7c39_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue := VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_6efa_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_bd59;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_bd59;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_bd59;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_fde9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_91ef_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output;
     -- uint32_uint1_29[BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_c8aa] LATENCY=0
     VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_c8aa_return_output := uint32_uint1_29(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_e1d9] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_e1d9_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b22e_return_output,
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_f107_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_c0b0 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_e1d9_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue := VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_c8aa_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_c0b0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_c0b0;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_c0b0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_607f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_a8f2_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output;
     -- uint32_uint1_28[BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_76b6] LATENCY=0
     VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_76b6_return_output := uint32_uint1_28(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_b36b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_b36b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_b96e_return_output,
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_3a2a_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_a50d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_b36b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue := VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_76b6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_a50d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_a50d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_a50d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_311e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_33e0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output;
     -- uint32_uint1_27[BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_d7ec] LATENCY=0
     VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_d7ec_return_output := uint32_uint1_27(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_5135] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_5135_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_5fa7_return_output,
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_c8e5_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_36e4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_5135_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue := VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_d7ec_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_36e4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_36e4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_36e4;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_2775_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_1e7b_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_82de] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_82de_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output,
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_c6cd_return_output);

     -- uint32_uint1_26[BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_99e7] LATENCY=0
     VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_99e7_return_output := uint32_uint1_26(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_3408_return_output,
     to_unsigned(1, 1));

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_b553 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_82de_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue := VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_99e7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_b553;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_b553;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_b553;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_34cd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_06ca_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output;
     -- uint32_uint1_25[BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_2939] LATENCY=0
     VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_2939_return_output := uint32_uint1_25(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_9d46] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_9d46_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_b8c5_return_output,
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_230b_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_3027 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_9d46_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue := VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_2939_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_3027;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_3027;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_3027;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_ca3b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_4b04_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output;
     -- uint32_uint1_24[BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0b71] LATENCY=0
     VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0b71_return_output := uint32_uint1_24(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_53a0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_53a0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_edd6_return_output,
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_950d_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_cb92 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_53a0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue := VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0b71_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_cb92;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_cb92;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_cb92;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_0921_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_e6c9_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output;
     -- uint32_uint1_23[BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_fadc] LATENCY=0
     VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_fadc_return_output := uint32_uint1_23(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9bec] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9bec_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_f573_return_output,
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_8d31_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_9fa8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9bec_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue := VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_fadc_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_9fa8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_9fa8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_9fa8;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_e048_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_ab76_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_3554] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_3554_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output,
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8229_return_output);

     -- uint32_uint1_22[BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_10bc] LATENCY=0
     VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_10bc_return_output := uint32_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_bc82_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_3c87 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_3554_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue := VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_10bc_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_3c87;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_3c87;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_3c87;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_2079_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_6b59_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_6c1c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_6c1c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output,
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ebe4_return_output);

     -- uint32_uint1_21[BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_e683] LATENCY=0
     VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_e683_return_output := uint32_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_f9a0_return_output,
     to_unsigned(1, 1));

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_d201 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_6c1c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue := VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_e683_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_d201;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_d201;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_d201;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_96c0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_3825_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4690] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4690_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output,
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_2dff_return_output);

     -- uint32_uint1_20[BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_a4bb] LATENCY=0
     VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_a4bb_return_output := uint32_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_8fa2_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e8d8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_4690_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue := VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_a4bb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e8d8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e8d8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e8d8;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_ea59_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_6348_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_4420] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_4420_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output,
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_b0fb_return_output);

     -- uint32_uint1_19[BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_5c08] LATENCY=0
     VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_5c08_return_output := uint32_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_5be8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_494d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_4420_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue := VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_5c08_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_494d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_494d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_494d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_466f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_c6d8_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_b179] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_b179_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output,
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_4829_return_output);

     -- uint32_uint1_18[BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_baa7] LATENCY=0
     VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_baa7_return_output := uint32_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_0921_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_946e := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_b179_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue := VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_baa7_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_946e;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_946e;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_946e;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_8604_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_4a50_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_33ab] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_33ab_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output,
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_99ef_return_output);

     -- uint32_uint1_17[BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_ccec] LATENCY=0
     VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_ccec_return_output := uint32_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_c0e1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_7c81 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_33ab_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue := VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_ccec_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_7c81;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_7c81;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_7c81;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_ee70_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_888a_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_f3ea] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_f3ea_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output,
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8a18_return_output);

     -- uint32_uint1_16[BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_32c8] LATENCY=0
     VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_32c8_return_output := uint32_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_a6f1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_a815 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_f3ea_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue := VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_32c8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_a815;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_a815;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_a815;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_660a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_e93c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_5ea0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_5ea0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output,
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_d64b_return_output);

     -- uint32_uint1_15[BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d9de] LATENCY=0
     VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d9de_return_output := uint32_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_aee3_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_25ae := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_5ea0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue := VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d9de_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_25ae;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_25ae;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_25ae;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_d341_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_ef4c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output;
     -- uint32_uint1_14[BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_a7c3] LATENCY=0
     VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_a7c3_return_output := uint32_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_e0c1] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_e0c1_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b666_return_output,
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_42f9_return_output);

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d6cc := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_e0c1_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue := VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_a7c3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d6cc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d6cc;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_d6cc;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_6236_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_0371_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output;
     -- uint32_uint1_13[BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_e3e3] LATENCY=0
     VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_e3e3_return_output := uint32_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_cd33] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_cd33_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_437f_return_output,
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_06d5_return_output);

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_a9a3 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_cd33_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue := VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_e3e3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_a9a3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_a9a3;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_a9a3;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_1d17_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_ce7b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_a257] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_a257_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output,
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_dc46_return_output);

     -- uint32_uint1_12[BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_499e] LATENCY=0
     VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_499e_return_output := uint32_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_3154_return_output,
     to_unsigned(1, 1));

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_287b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_a257_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue := VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_499e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_287b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_287b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_287b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_a6d1_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_c789_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output;
     -- uint32_uint1_11[BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_2be0] LATENCY=0
     VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_2be0_return_output := uint32_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_cea8] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_cea8_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_16f9_return_output,
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_2e66_return_output);

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_9cb0 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_cea8_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue := VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_2be0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_9cb0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_9cb0;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_9cb0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_e055_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_3d7c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_fe16] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_fe16_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output,
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_ed12_return_output);

     -- uint32_uint1_10[BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_3bb0] LATENCY=0
     VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_3bb0_return_output := uint32_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_669f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_4ef6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_fe16_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue := VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_3bb0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_4ef6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_4ef6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_4ef6;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_67e5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_72b6_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_2e96] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_2e96_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output,
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_3444_return_output);

     -- uint32_uint1_9[BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_0d0e] LATENCY=0
     VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_0d0e_return_output := uint32_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_dacd_return_output,
     to_unsigned(1, 1));

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d614 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_2e96_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue := VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_0d0e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d614;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d614;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_d614;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_880a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_5c85_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_a605] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_a605_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output,
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_8290_return_output);

     -- uint32_uint1_8[BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_8a78] LATENCY=0
     VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_8a78_return_output := uint32_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_2ac9_return_output,
     to_unsigned(1, 1));

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_b656 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_a605_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue := VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_8a78_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_b656;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_b656;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_b656;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_7c36_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_ced9_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output;

     -- Submodule level 73
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output;
     -- uint32_uint1_7[BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_cbee] LATENCY=0
     VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_cbee_return_output := uint32_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_594f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_594f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_c841_return_output,
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_4774_return_output);

     -- Submodule level 74
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_2b60 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_594f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue := VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_cbee_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_2b60;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_2b60;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_2b60;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output;

     -- Submodule level 75
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9a62_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_a70a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output;

     -- Submodule level 76
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output;
     -- uint32_uint1_6[BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_18e2] LATENCY=0
     VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_18e2_return_output := uint32_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_121e] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_121e_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_5f25_return_output,
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_8e31_return_output);

     -- Submodule level 77
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_d6ce := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_121e_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue := VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_18e2_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_d6ce;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_d6ce;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_d6ce;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output;

     -- Submodule level 78
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d4cb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_4d4b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output;

     -- Submodule level 79
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output;
     -- uint32_uint1_5[BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_e22f] LATENCY=0
     VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_e22f_return_output := uint32_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_a102] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_a102_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_b107_return_output,
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_da96_return_output);

     -- Submodule level 80
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_5c9b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_a102_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue := VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_e22f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_5c9b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_5c9b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_5c9b;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output;

     -- Submodule level 81
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_4888_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_b995_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output;

     -- Submodule level 82
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output;
     -- uint32_uint1_4[BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_aac3] LATENCY=0
     VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_aac3_return_output := uint32_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_4ba0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_4ba0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_b1ab_return_output,
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_f0af_return_output);

     -- Submodule level 83
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_01f4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_4ba0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue := VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_aac3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_01f4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_01f4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_01f4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output;

     -- Submodule level 84
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_5ca7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_4b3c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output;

     -- Submodule level 85
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_378c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_378c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output,
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_488c_return_output);

     -- uint32_uint1_3[BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_48ef] LATENCY=0
     VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_48ef_return_output := uint32_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_c97d_return_output,
     to_unsigned(1, 1));

     -- Submodule level 86
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_893a := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_378c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue := VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_48ef_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_893a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_893a;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_893a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output;

     -- Submodule level 87
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_506a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9b11_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output;

     -- Submodule level 88
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output;
     -- uint32_uint1_2[BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_695f] LATENCY=0
     VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_695f_return_output := uint32_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_6b7c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_6b7c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_6e4d_return_output,
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_9aeb_return_output);

     -- Submodule level 89
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_c29a := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_6b7c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue := VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_695f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_c29a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_c29a;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_c29a;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output;

     -- Submodule level 90
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_c44b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_5131_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output;

     -- Submodule level 91
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output;
     -- uint32_uint1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_4fdf] LATENCY=0
     VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_4fdf_return_output := uint32_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4c95] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4c95_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_c587_return_output,
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_4bde_return_output);

     -- Submodule level 92
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_5df7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_4c95_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue := VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_4fdf_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_5df7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_5df7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_5df7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output;

     -- Submodule level 93
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_36d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_a11d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output;

     -- Submodule level 94
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output;
     -- uint32_uint1_0[BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5073] LATENCY=0
     VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5073_return_output := uint32_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_31da] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_31da_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_4727_return_output,
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_da1d_return_output);

     -- Submodule level 95
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_ea9e := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_31da_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue := VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_5073_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_ea9e;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output;

     -- Submodule level 96
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_b64b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output;

     -- Submodule level 97
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_9767_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
