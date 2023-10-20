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
-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output : unsigned(31 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(31 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_left_resized : unsigned(31 downto 0);
 variable VAR_right_resized : unsigned(31 downto 0);
 variable VAR_output : unsigned(31 downto 0);
 variable VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_cebb : unsigned(31 downto 0);
 variable VAR_remainder : unsigned(31 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_4349 : unsigned(31 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_eae6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_11d7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_d788_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_718b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_4a63_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_7864 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_d2c0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_29a3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_85e7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_82d6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_58dd_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_822e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_0643_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_4379 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_138b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_6c20_return_output : unsigned(31 downto 0);
 variable VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_4f89_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_1578 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_f897_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1ea8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_f5e8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_4c40 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_2b1c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_a338_return_output : unsigned(31 downto 0);
 variable VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_587b_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_d3d1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_596e_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_4201_return_output : unsigned(31 downto 0);
 variable VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_6905_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_130b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_eaa4_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0234_return_output : unsigned(31 downto 0);
 variable VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_27cb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_b544 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_4df6_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_319a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8845_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a245 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_e1d4_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_cc8a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ffde_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_f74c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_666f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fb0d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_da09_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e676 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_caca_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_4ac9_return_output : unsigned(31 downto 0);
 variable VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_03a8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_d1fa : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2aad_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_2d1e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_8054_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_1d99 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_f012_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_aa80_return_output : unsigned(31 downto 0);
 variable VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_6167_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6f8b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_6dd2_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_4fe5_return_output : unsigned(31 downto 0);
 variable VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8940_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_9564 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_b60a_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_e04a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_72ec_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_94a3 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_693a_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d832_return_output : unsigned(31 downto 0);
 variable VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_2407_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_c3a7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_9080_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_3f41_return_output : unsigned(31 downto 0);
 variable VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_8aa7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_05a8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_e418_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_835d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_ba21_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_ce93 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_cb92_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_48a0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_bf57_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_ef31 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_b18b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_9b01_return_output : unsigned(31 downto 0);
 variable VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3510_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_7f93 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_8885_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_10ed_return_output : unsigned(31 downto 0);
 variable VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_4053_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_1d96 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6557_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_6687_return_output : unsigned(31 downto 0);
 variable VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_f3cf_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_a7d1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_6188_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_f3e6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_2d13_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_9fb4 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_5304_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_c602_return_output : unsigned(31 downto 0);
 variable VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_77f3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_b97f : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_edf7_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5420_return_output : unsigned(31 downto 0);
 variable VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_6cb0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_6f78 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_8915_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_9286_return_output : unsigned(31 downto 0);
 variable VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0cfe_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_263c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_dd33_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_31b1_return_output : unsigned(31 downto 0);
 variable VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_bc95_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_f817 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_0416_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_241b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_c69a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_7f7f : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_4b83_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_0d0a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_bf13_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_3987 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_241c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_a920_return_output : unsigned(31 downto 0);
 variable VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_9861_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_8bab : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_fe90_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond : unsigned(0 downto 0);
 variable VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_de88_return_output : unsigned(31 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_cebb := resize(to_unsigned(0, 1), 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse := VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_cebb;
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_4349 := resize(to_unsigned(0, 1), 32);
     -- uint32_uint1_31[BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_718b] LATENCY=0
     VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_718b_return_output := uint32_uint1_31(
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_cebb,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue := VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_718b_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right := VAR_right;
     -- uint32_22_22[BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8845] LATENCY=0
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8845_return_output := uint32_22_22(
     VAR_left);

     -- uint32_12_12[BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_ba21] LATENCY=0
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_ba21_return_output := uint32_12_12(
     VAR_left);

     -- uint32_13_13[BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_8aa7] LATENCY=0
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_8aa7_return_output := uint32_13_13(
     VAR_left);

     -- uint32_29_29[BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_85e7] LATENCY=0
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_85e7_return_output := uint32_29_29(
     VAR_left);

     -- uint32_30_30[BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_4a63] LATENCY=0
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_4a63_return_output := uint32_30_30(
     VAR_left);

     -- uint32_25_25[BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_587b] LATENCY=0
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_587b_return_output := uint32_25_25(
     VAR_left);

     -- uint32_2_2[BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_c69a] LATENCY=0
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_c69a_return_output := uint32_2_2(
     VAR_left);

     -- uint32_4_4[BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0cfe] LATENCY=0
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0cfe_return_output := uint32_4_4(
     VAR_left);

     -- uint32_23_23[BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_27cb] LATENCY=0
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_27cb_return_output := uint32_23_23(
     VAR_left);

     -- uint32_7_7[BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_2d13] LATENCY=0
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_2d13_return_output := uint32_7_7(
     VAR_left);

     -- uint32_14_14[BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_2407] LATENCY=0
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_2407_return_output := uint32_14_14(
     VAR_left);

     -- uint32_3_3[BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_bc95] LATENCY=0
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_bc95_return_output := uint32_3_3(
     VAR_left);

     -- uint32_26_26[BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_f5e8] LATENCY=0
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_f5e8_return_output := uint32_26_26(
     VAR_left);

     -- uint32_11_11[BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_bf57] LATENCY=0
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_bf57_return_output := uint32_11_11(
     VAR_left);

     -- uint32_1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_bf13] LATENCY=0
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_bf13_return_output := uint32_1_1(
     VAR_left);

     -- uint32_9_9[BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_4053] LATENCY=0
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_4053_return_output := uint32_9_9(
     VAR_left);

     -- uint32_15_15[BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_72ec] LATENCY=0
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_72ec_return_output := uint32_15_15(
     VAR_left);

     -- uint32_17_17[BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_6167] LATENCY=0
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_6167_return_output := uint32_17_17(
     VAR_left);

     -- uint32_0_0[BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_9861] LATENCY=0
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_9861_return_output := uint32_0_0(
     VAR_left);

     -- uint32_18_18[BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_8054] LATENCY=0
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_8054_return_output := uint32_18_18(
     VAR_left);

     -- uint32_21_21[BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ffde] LATENCY=0
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ffde_return_output := uint32_21_21(
     VAR_left);

     -- uint32_16_16[BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8940] LATENCY=0
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8940_return_output := uint32_16_16(
     VAR_left);

     -- uint32_27_27[BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_4f89] LATENCY=0
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_4f89_return_output := uint32_27_27(
     VAR_left);

     -- uint32_31_31[BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_eae6] LATENCY=0
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_eae6_return_output := uint32_31_31(
     VAR_left);

     -- uint32_6_6[BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_77f3] LATENCY=0
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_77f3_return_output := uint32_6_6(
     VAR_left);

     -- uint32_24_24[BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_6905] LATENCY=0
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_6905_return_output := uint32_24_24(
     VAR_left);

     -- uint32_19_19[BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_03a8] LATENCY=0
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_03a8_return_output := uint32_19_19(
     VAR_left);

     -- uint32_10_10[BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3510] LATENCY=0
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3510_return_output := uint32_10_10(
     VAR_left);

     -- uint32_20_20[BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_da09] LATENCY=0
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_da09_return_output := uint32_20_20(
     VAR_left);

     -- uint32_5_5[BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_6cb0] LATENCY=0
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_6cb0_return_output := uint32_5_5(
     VAR_left);

     -- uint32_28_28[BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_0643] LATENCY=0
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_0643_return_output := uint32_28_28(
     VAR_left);

     -- uint32_8_8[BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_f3cf] LATENCY=0
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_f3cf_return_output := uint32_8_8(
     VAR_left);

     -- Submodule level 1
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_d788] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_d788_return_output := uint32_uint1(
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_4349,
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_eae6_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_11d7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_d788_return_output, 32);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_11d7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_11d7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_11d7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_25ae_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_156e_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output;
     -- uint32_uint1_30[BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_29a3] LATENCY=0
     VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_29a3_return_output := uint32_uint1_30(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_d2c0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_d2c0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3afa_return_output,
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_4a63_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_7864 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_d2c0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue := VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_29a3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_7864;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_7864;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_7864;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_f3ef_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_b744_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output;
     -- uint32_uint1_29[BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_822e] LATENCY=0
     VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_822e_return_output := uint32_uint1_29(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_58dd] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_58dd_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_b983_return_output,
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_85e7_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_82d6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_58dd_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue := VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_822e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_82d6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_82d6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_82d6;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_115b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_2b93_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_138b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_138b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output,
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_0643_return_output);

     -- uint32_uint1_28[BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_6c20] LATENCY=0
     VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_6c20_return_output := uint32_uint1_28(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_5e8f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_4379 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_138b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue := VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_6c20_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_4379;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_4379;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_4379;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_73c7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_6c34_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output;
     -- uint32_uint1_27[BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1ea8] LATENCY=0
     VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1ea8_return_output := uint32_uint1_27(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_f897] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_f897_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_94a6_return_output,
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_4f89_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_1578 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_f897_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue := VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_1ea8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_1578;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_1578;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_1578;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_afa5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_9d4d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_2b1c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_2b1c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output,
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_f5e8_return_output);

     -- uint32_uint1_26[BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_a338] LATENCY=0
     VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_a338_return_output := uint32_uint1_26(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_5677_return_output,
     to_unsigned(1, 1));

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_4c40 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_2b1c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue := VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_a338_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_4c40;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_4c40;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_4c40;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_ac68_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_9c7c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_596e] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_596e_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output,
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_587b_return_output);

     -- uint32_uint1_25[BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_4201] LATENCY=0
     VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_4201_return_output := uint32_uint1_25(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_4532_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_d3d1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_596e_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue := VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_4201_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_d3d1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_d3d1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_d3d1;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_5df9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_9ca0_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_eaa4] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_eaa4_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output,
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_6905_return_output);

     -- uint32_uint1_24[BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0234] LATENCY=0
     VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0234_return_output := uint32_uint1_24(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_79a5_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_130b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_eaa4_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue := VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_0234_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_130b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_130b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_130b;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_b90d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_13c3_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output;
     -- uint32_uint1_23[BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_319a] LATENCY=0
     VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_319a_return_output := uint32_uint1_23(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_4df6] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_4df6_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_bd32_return_output,
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_27cb_return_output);

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_b544 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_4df6_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue := VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_319a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_b544;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_b544;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_b544;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_4b69_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_8e5e_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_e1d4] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_e1d4_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output,
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_8845_return_output);

     -- uint32_uint1_22[BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_cc8a] LATENCY=0
     VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_cc8a_return_output := uint32_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_0974_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a245 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_e1d4_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue := VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_cc8a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a245;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a245;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_a245;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_e610_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_f1c3_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output;
     -- uint32_uint1_21[BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fb0d] LATENCY=0
     VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fb0d_return_output := uint32_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_666f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_666f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_c204_return_output,
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_ffde_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_f74c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_666f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue := VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_fb0d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_f74c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_f74c;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_f74c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_11c8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_75e8_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_caca] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_caca_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output,
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_da09_return_output);

     -- uint32_uint1_20[BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_4ac9] LATENCY=0
     VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_4ac9_return_output := uint32_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_106b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e676 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_caca_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue := VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_4ac9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e676;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e676;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_e676;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_4bfe_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_ea13_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output;
     -- uint32_uint1_19[BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_2d1e] LATENCY=0
     VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_2d1e_return_output := uint32_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2aad] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2aad_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_e238_return_output,
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_03a8_return_output);

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_d1fa := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_2aad_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue := VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_2d1e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_d1fa;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_d1fa;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_d1fa;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_663e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_22ab_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output;
     -- uint32_uint1_18[BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_aa80] LATENCY=0
     VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_aa80_return_output := uint32_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_f012] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_f012_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_ea64_return_output,
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_8054_return_output);

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_1d99 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_f012_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue := VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_aa80_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_1d99;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_1d99;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_1d99;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_3fd7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_84ef_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_6dd2] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_6dd2_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output,
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_6167_return_output);

     -- uint32_uint1_17[BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_4fe5] LATENCY=0
     VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_4fe5_return_output := uint32_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_05fa_return_output,
     to_unsigned(1, 1));

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6f8b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_6dd2_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue := VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_4fe5_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6f8b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6f8b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6f8b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_565c_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_b015_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output;
     -- uint32_uint1_16[BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_e04a] LATENCY=0
     VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_e04a_return_output := uint32_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_b60a] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_b60a_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_bb42_return_output,
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8940_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_9564 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_b60a_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue := VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_e04a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_9564;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_9564;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_9564;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_f991_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_0782_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_693a] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_693a_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output,
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_72ec_return_output);

     -- uint32_uint1_15[BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d832] LATENCY=0
     VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d832_return_output := uint32_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_f0f4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_94a3 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_693a_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue := VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_d832_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_94a3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_94a3;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_94a3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_64cd_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_acce_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_9080] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_9080_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output,
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_2407_return_output);

     -- uint32_uint1_14[BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_3f41] LATENCY=0
     VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_3f41_return_output := uint32_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_4870_return_output,
     to_unsigned(1, 1));

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_c3a7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_9080_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue := VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_3f41_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_c3a7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_c3a7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_c3a7;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_21ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_cf7b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output;
     -- uint32_uint1_13[BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_835d] LATENCY=0
     VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_835d_return_output := uint32_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_e418] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_e418_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_ad18_return_output,
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_8aa7_return_output);

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_05a8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_e418_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue := VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_835d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_05a8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_05a8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_05a8;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_922d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_c670_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_cb92] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_cb92_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output,
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_ba21_return_output);

     -- uint32_uint1_12[BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_48a0] LATENCY=0
     VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_48a0_return_output := uint32_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_1b36_return_output,
     to_unsigned(1, 1));

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_ce93 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_cb92_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue := VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_48a0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_ce93;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_ce93;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_ce93;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_8c21_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_648e_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_b18b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_b18b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output,
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_bf57_return_output);

     -- uint32_uint1_11[BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_9b01] LATENCY=0
     VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_9b01_return_output := uint32_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1d58_return_output,
     to_unsigned(1, 1));

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_ef31 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_b18b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue := VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_9b01_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_ef31;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_ef31;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_ef31;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_ee63_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_390c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_8885] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_8885_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output,
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_3510_return_output);

     -- uint32_uint1_10[BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_10ed] LATENCY=0
     VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_10ed_return_output := uint32_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_83fa_return_output,
     to_unsigned(1, 1));

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_7f93 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_8885_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue := VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_10ed_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_7f93;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_7f93;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_7f93;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_37ee_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_ed85_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output;
     -- uint32_uint1_9[BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_6687] LATENCY=0
     VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_6687_return_output := uint32_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6557] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6557_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_aaf3_return_output,
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_4053_return_output);

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_1d96 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6557_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue := VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_6687_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_1d96;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_1d96;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_1d96;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4dbf_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_3b1d_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_6188] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_6188_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output,
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_f3cf_return_output);

     -- uint32_uint1_8[BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_f3e6] LATENCY=0
     VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_f3e6_return_output := uint32_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_e27a_return_output,
     to_unsigned(1, 1));

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_a7d1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_6188_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue := VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_f3e6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_a7d1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_a7d1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_a7d1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_8fc9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_677e_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output;

     -- Submodule level 73
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_5304] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_5304_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output,
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_2d13_return_output);

     -- uint32_uint1_7[BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_c602] LATENCY=0
     VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_c602_return_output := uint32_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_18d9_return_output,
     to_unsigned(1, 1));

     -- Submodule level 74
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_9fb4 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_5304_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue := VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_c602_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_9fb4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_9fb4;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_9fb4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output;

     -- Submodule level 75
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_7f3d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_ce4c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output;

     -- Submodule level 76
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_edf7] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_edf7_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output,
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_77f3_return_output);

     -- uint32_uint1_6[BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5420] LATENCY=0
     VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5420_return_output := uint32_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_4366_return_output,
     to_unsigned(1, 1));

     -- Submodule level 77
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_b97f := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_edf7_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue := VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5420_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_b97f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_b97f;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_b97f;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output;

     -- Submodule level 78
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_d090_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_092c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output;

     -- Submodule level 79
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output;
     -- uint32_uint1_5[BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_9286] LATENCY=0
     VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_9286_return_output := uint32_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_8915] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_8915_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_6c57_return_output,
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_6cb0_return_output);

     -- Submodule level 80
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_6f78 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_8915_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue := VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_9286_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_6f78;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_6f78;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_6f78;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output;

     -- Submodule level 81
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_80ab_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_30c0_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output;

     -- Submodule level 82
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output;
     -- uint32_uint1_4[BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_31b1] LATENCY=0
     VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_31b1_return_output := uint32_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_dd33] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_dd33_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_5599_return_output,
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_0cfe_return_output);

     -- Submodule level 83
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_263c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_dd33_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue := VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_31b1_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_263c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_263c;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_263c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output;

     -- Submodule level 84
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_00a2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_6157_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output;

     -- Submodule level 85
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_0416] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_0416_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output,
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_bc95_return_output);

     -- uint32_uint1_3[BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_241b] LATENCY=0
     VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_241b_return_output := uint32_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_7a1b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 86
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_f817 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_0416_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue := VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_241b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_f817;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_f817;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_f817;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output;

     -- Submodule level 87
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_5394_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_9f30_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output;

     -- Submodule level 88
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output;
     -- uint32_uint1_2[BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_0d0a] LATENCY=0
     VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_0d0a_return_output := uint32_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_4b83] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_4b83_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_35ef_return_output,
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_c69a_return_output);

     -- Submodule level 89
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_7f7f := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_4b83_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue := VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_0d0a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_7f7f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_7f7f;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_7f7f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output;

     -- Submodule level 90
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_dbe5_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_ba7d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output;

     -- Submodule level 91
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_241c] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_241c_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output,
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_bf13_return_output);

     -- uint32_uint1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_a920] LATENCY=0
     VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_a920_return_output := uint32_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_f476_return_output,
     to_unsigned(1, 1));

     -- Submodule level 92
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_3987 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_241c_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue := VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_a920_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_3987;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_3987;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_3987;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output;

     -- Submodule level 93
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_4770_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_29c2_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output;

     -- Submodule level 94
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output;
     -- uint32_uint1_0[BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_de88] LATENCY=0
     VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_de88_return_output := uint32_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_fe90] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_fe90_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_3099_return_output,
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_9861_return_output);

     -- Submodule level 95
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_8bab := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_fe90_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue := VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_de88_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_8bab;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output;

     -- Submodule level 96
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_8be9_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output;

     -- Submodule level 97
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_df40_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
