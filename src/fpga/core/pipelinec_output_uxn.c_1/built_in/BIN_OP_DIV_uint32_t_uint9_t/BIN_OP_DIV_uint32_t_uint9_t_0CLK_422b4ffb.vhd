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
-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17]
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse : unsigned(31 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output : unsigned(31 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output : unsigned(31 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3]
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left : unsigned(31 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output : unsigned(31 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec]
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left : unsigned(31 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right : unsigned(8 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021]
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse : unsigned(31 downto 0);
signal output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output : unsigned(31 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3 : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output);

-- remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse,
remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3 : entity work.BIN_OP_MINUS_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right,
BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec : entity work.BIN_OP_GTE_uint32_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right,
BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output);

-- output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse,
output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output,
 remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output,
 output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(31 downto 0);
 variable VAR_right : unsigned(8 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_left_resized : unsigned(31 downto 0);
 variable VAR_right_resized : unsigned(31 downto 0);
 variable VAR_output : unsigned(31 downto 0);
 variable VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_79a9 : unsigned(31 downto 0);
 variable VAR_remainder : unsigned(31 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_072b : unsigned(31 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_abad_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_c649 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_9fb9_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_05a5_return_output : unsigned(31 downto 0);
 variable VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_1615_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_446d : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_4c3a_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_507f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_d7d8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_f082 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_a402_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_bb46_return_output : unsigned(31 downto 0);
 variable VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_dca2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_19b9 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_ee29_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_7edb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_84bd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_d6a7 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_37fe_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_7078_return_output : unsigned(31 downto 0);
 variable VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_3c7d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_c136 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_9954_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_5ff0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_980c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_6da6 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_cf21_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_c749_return_output : unsigned(31 downto 0);
 variable VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_c86a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_1264 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_8057_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_6281_return_output : unsigned(31 downto 0);
 variable VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_ac74_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_6f95 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9dab_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_9c73_return_output : unsigned(31 downto 0);
 variable VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_95a2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_1c98 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_26e3_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_bf0f_return_output : unsigned(31 downto 0);
 variable VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_2bbd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_09bc : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_58fc_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_3402_return_output : unsigned(31 downto 0);
 variable VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_e8d6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_1243 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_89c1_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_8b29_return_output : unsigned(31 downto 0);
 variable VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_02d9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_9f81 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_0dbc_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_712d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_0cbb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_caaa : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a94b_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_c54a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_2f7e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6907 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_e8e3_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_cd89_return_output : unsigned(31 downto 0);
 variable VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8963_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_3df1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_5c0d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_2796_return_output : unsigned(31 downto 0);
 variable VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_849e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_d950 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f5c4_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_9d68_return_output : unsigned(31 downto 0);
 variable VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_fc0f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_de10 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_6d66_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_4f8a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_9f73_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_361b : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_32b5_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_ae61_return_output : unsigned(31 downto 0);
 variable VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_f4c0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_8957 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_076f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_d398_return_output : unsigned(31 downto 0);
 variable VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_4a24_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_195a : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_bf0e_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6048_return_output : unsigned(31 downto 0);
 variable VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_fd43_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_a061 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_3a71_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_7de0_return_output : unsigned(31 downto 0);
 variable VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_34cd_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_68af : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6037_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_aab3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_aae6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_1258 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_9f24_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_357a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_1f1d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_a222 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_bf73_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_1e5e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_6717_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_3e11 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_c8e0_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5c95_return_output : unsigned(31 downto 0);
 variable VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_c845_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_e476 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_df72_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_8713_return_output : unsigned(31 downto 0);
 variable VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_d8fe_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_3261 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_f930_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_097e_return_output : unsigned(31 downto 0);
 variable VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_91cb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_1494 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_8053_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_685c_return_output : unsigned(31 downto 0);
 variable VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_cbd3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_b8e8 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_fcb2_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_a8be_return_output : unsigned(31 downto 0);
 variable VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_56d8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_e5c1 : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_6acf_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output : unsigned(31 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_2939_return_output : unsigned(31 downto 0);
 variable VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_e922_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_a37c : unsigned(31 downto 0);
 variable VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_91d2_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output : unsigned(31 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond : unsigned(0 downto 0);
 variable VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_c233_return_output : unsigned(31 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_79a9 := resize(to_unsigned(0, 1), 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse := VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_79a9;
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_072b := resize(to_unsigned(0, 1), 32);
     -- uint32_uint1_31[BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_05a5] LATENCY=0
     VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_05a5_return_output := uint32_uint1_31(
     VAR_output_BIN_OP_DIV_uint32_t_uint9_t_c_l16_c3_79a9,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue := VAR_uint32_uint1_31_BIN_OP_DIV_uint32_t_uint9_t_c_l47_c14_05a5_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right := VAR_right;
     -- uint32_18_18[BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_0cbb] LATENCY=0
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_0cbb_return_output := uint32_18_18(
     VAR_left);

     -- uint32_17_17[BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_2f7e] LATENCY=0
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_2f7e_return_output := uint32_17_17(
     VAR_left);

     -- uint32_29_29[BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_d7d8] LATENCY=0
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_d7d8_return_output := uint32_29_29(
     VAR_left);

     -- uint32_25_25[BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_980c] LATENCY=0
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_980c_return_output := uint32_25_25(
     VAR_left);

     -- uint32_6_6[BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_6717] LATENCY=0
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_6717_return_output := uint32_6_6(
     VAR_left);

     -- uint32_12_12[BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_f4c0] LATENCY=0
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_f4c0_return_output := uint32_12_12(
     VAR_left);

     -- uint32_1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_56d8] LATENCY=0
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_56d8_return_output := uint32_1_1(
     VAR_left);

     -- uint32_19_19[BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_02d9] LATENCY=0
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_02d9_return_output := uint32_19_19(
     VAR_left);

     -- uint32_26_26[BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_3c7d] LATENCY=0
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_3c7d_return_output := uint32_26_26(
     VAR_left);

     -- uint32_0_0[BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_e922] LATENCY=0
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_e922_return_output := uint32_0_0(
     VAR_left);

     -- uint32_10_10[BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_fd43] LATENCY=0
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_fd43_return_output := uint32_10_10(
     VAR_left);

     -- uint32_5_5[BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_c845] LATENCY=0
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_c845_return_output := uint32_5_5(
     VAR_left);

     -- uint32_15_15[BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_849e] LATENCY=0
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_849e_return_output := uint32_15_15(
     VAR_left);

     -- uint32_27_27[BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_84bd] LATENCY=0
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_84bd_return_output := uint32_27_27(
     VAR_left);

     -- uint32_4_4[BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_d8fe] LATENCY=0
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_d8fe_return_output := uint32_4_4(
     VAR_left);

     -- uint32_22_22[BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_95a2] LATENCY=0
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_95a2_return_output := uint32_22_22(
     VAR_left);

     -- uint32_24_24[BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_c86a] LATENCY=0
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_c86a_return_output := uint32_24_24(
     VAR_left);

     -- uint32_2_2[BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_cbd3] LATENCY=0
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_cbd3_return_output := uint32_2_2(
     VAR_left);

     -- uint32_21_21[BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_2bbd] LATENCY=0
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_2bbd_return_output := uint32_21_21(
     VAR_left);

     -- uint32_9_9[BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_34cd] LATENCY=0
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_34cd_return_output := uint32_9_9(
     VAR_left);

     -- uint32_20_20[BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_e8d6] LATENCY=0
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_e8d6_return_output := uint32_20_20(
     VAR_left);

     -- uint32_16_16[BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8963] LATENCY=0
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8963_return_output := uint32_16_16(
     VAR_left);

     -- uint32_14_14[BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_fc0f] LATENCY=0
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_fc0f_return_output := uint32_14_14(
     VAR_left);

     -- uint32_30_30[BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_1615] LATENCY=0
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_1615_return_output := uint32_30_30(
     VAR_left);

     -- uint32_28_28[BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_dca2] LATENCY=0
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_dca2_return_output := uint32_28_28(
     VAR_left);

     -- uint32_31_31[BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_abad] LATENCY=0
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_abad_return_output := uint32_31_31(
     VAR_left);

     -- uint32_13_13[BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_9f73] LATENCY=0
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_9f73_return_output := uint32_13_13(
     VAR_left);

     -- uint32_11_11[BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_4a24] LATENCY=0
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_4a24_return_output := uint32_11_11(
     VAR_left);

     -- uint32_23_23[BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_ac74] LATENCY=0
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_ac74_return_output := uint32_23_23(
     VAR_left);

     -- uint32_8_8[BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_aae6] LATENCY=0
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_aae6_return_output := uint32_8_8(
     VAR_left);

     -- uint32_3_3[BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_91cb] LATENCY=0
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_91cb_return_output := uint32_3_3(
     VAR_left);

     -- uint32_7_7[BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_1f1d] LATENCY=0
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_1f1d_return_output := uint32_7_7(
     VAR_left);

     -- Submodule level 1
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_9fb9] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_9fb9_return_output := uint32_uint1(
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l19_c3_072b,
     VAR_uint32_31_31_BIN_OP_DIV_uint32_t_uint9_t_c_l41_c20_abad_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_c649 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c15_9fb9_return_output, 32);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_c649;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_c649;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l42_c3_c649;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c6_db90_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l45_c17_f7a5_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output;
     -- uint32_uint1_30[BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_507f] LATENCY=0
     VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_507f_return_output := uint32_uint1_30(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_4c3a] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_4c3a_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l43_c3_3753_return_output,
     VAR_uint32_30_30_BIN_OP_DIV_uint32_t_uint9_t_c_l50_c20_1615_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_446d := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c15_4c3a_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue := VAR_uint32_uint1_30_BIN_OP_DIV_uint32_t_uint9_t_c_l56_c14_507f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_446d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_446d;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l51_c3_446d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c6_96ed_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l54_c17_33de_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_a402] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_a402_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output,
     VAR_uint32_29_29_BIN_OP_DIV_uint32_t_uint9_t_c_l59_c20_d7d8_return_output);

     -- uint32_uint1_29[BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_bb46] LATENCY=0
     VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_bb46_return_output := uint32_uint1_29(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l52_c3_eda6_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_f082 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c15_a402_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue := VAR_uint32_uint1_29_BIN_OP_DIV_uint32_t_uint9_t_c_l65_c14_bb46_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_f082;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_f082;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l60_c3_f082;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c6_c1e0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l63_c17_66a6_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_ee29] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_ee29_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output,
     VAR_uint32_28_28_BIN_OP_DIV_uint32_t_uint9_t_c_l68_c20_dca2_return_output);

     -- uint32_uint1_28[BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_7edb] LATENCY=0
     VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_7edb_return_output := uint32_uint1_28(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l61_c3_d0f8_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_19b9 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c15_ee29_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue := VAR_uint32_uint1_28_BIN_OP_DIV_uint32_t_uint9_t_c_l74_c14_7edb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_19b9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_19b9;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l69_c3_19b9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c6_7893_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l72_c17_a4e5_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output;
     -- uint32_uint1_27[BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_7078] LATENCY=0
     VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_7078_return_output := uint32_uint1_27(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_37fe] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_37fe_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l70_c3_73e6_return_output,
     VAR_uint32_27_27_BIN_OP_DIV_uint32_t_uint9_t_c_l77_c20_84bd_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_d6a7 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c15_37fe_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue := VAR_uint32_uint1_27_BIN_OP_DIV_uint32_t_uint9_t_c_l83_c14_7078_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_d6a7;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_d6a7;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l78_c3_d6a7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c6_044d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l81_c17_8cb8_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output;
     -- uint32_uint1_26[BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_5ff0] LATENCY=0
     VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_5ff0_return_output := uint32_uint1_26(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_9954] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_9954_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l79_c3_de38_return_output,
     VAR_uint32_26_26_BIN_OP_DIV_uint32_t_uint9_t_c_l86_c20_3c7d_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_c136 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c15_9954_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue := VAR_uint32_uint1_26_BIN_OP_DIV_uint32_t_uint9_t_c_l92_c14_5ff0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_c136;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_c136;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l87_c3_c136;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c6_c8aa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l90_c17_c291_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output;
     -- uint32_uint1_25[BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_c749] LATENCY=0
     VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_c749_return_output := uint32_uint1_25(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_cf21] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_cf21_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l88_c3_a8e8_return_output,
     VAR_uint32_25_25_BIN_OP_DIV_uint32_t_uint9_t_c_l95_c20_980c_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_6da6 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c15_cf21_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue := VAR_uint32_uint1_25_BIN_OP_DIV_uint32_t_uint9_t_c_l101_c14_c749_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_6da6;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_6da6;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l96_c3_6da6;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c6_8fd9_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l99_c17_6837_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output;
     -- uint32_uint1_24[BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_6281] LATENCY=0
     VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_6281_return_output := uint32_uint1_24(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_8057] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_8057_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l97_c3_efac_return_output,
     VAR_uint32_24_24_BIN_OP_DIV_uint32_t_uint9_t_c_l104_c20_c86a_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_1264 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c15_8057_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue := VAR_uint32_uint1_24_BIN_OP_DIV_uint32_t_uint9_t_c_l110_c14_6281_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_1264;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_1264;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l105_c3_1264;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c6_3266_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l108_c17_a2eb_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output;

     -- Submodule level 25
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9dab] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9dab_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output,
     VAR_uint32_23_23_BIN_OP_DIV_uint32_t_uint9_t_c_l113_c20_ac74_return_output);

     -- uint32_uint1_23[BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_9c73] LATENCY=0
     VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_9c73_return_output := uint32_uint1_23(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l106_c3_ff98_return_output,
     to_unsigned(1, 1));

     -- Submodule level 26
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_6f95 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c15_9dab_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue := VAR_uint32_uint1_23_BIN_OP_DIV_uint32_t_uint9_t_c_l119_c14_9c73_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_6f95;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_6f95;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l114_c3_6f95;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output;

     -- Submodule level 27
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c6_343d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l117_c17_4e54_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output;

     -- Submodule level 28
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_26e3] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_26e3_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output,
     VAR_uint32_22_22_BIN_OP_DIV_uint32_t_uint9_t_c_l122_c20_95a2_return_output);

     -- uint32_uint1_22[BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_bf0f] LATENCY=0
     VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_bf0f_return_output := uint32_uint1_22(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l115_c3_8df9_return_output,
     to_unsigned(1, 1));

     -- Submodule level 29
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_1c98 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c15_26e3_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue := VAR_uint32_uint1_22_BIN_OP_DIV_uint32_t_uint9_t_c_l128_c14_bf0f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_1c98;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_1c98;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l123_c3_1c98;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output;

     -- Submodule level 30
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c6_1978_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l126_c17_e62b_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output;

     -- Submodule level 31
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output;
     -- uint32_uint1_21[BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_3402] LATENCY=0
     VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_3402_return_output := uint32_uint1_21(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_58fc] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_58fc_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l124_c3_77cd_return_output,
     VAR_uint32_21_21_BIN_OP_DIV_uint32_t_uint9_t_c_l131_c20_2bbd_return_output);

     -- Submodule level 32
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_09bc := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c15_58fc_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue := VAR_uint32_uint1_21_BIN_OP_DIV_uint32_t_uint9_t_c_l137_c14_3402_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_09bc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_09bc;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l132_c3_09bc;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output;

     -- Submodule level 33
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c6_0154_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l135_c17_5f0a_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output;

     -- Submodule level 34
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output;
     -- uint32_uint1_20[BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_8b29] LATENCY=0
     VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_8b29_return_output := uint32_uint1_20(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_89c1] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_89c1_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l133_c3_f2d3_return_output,
     VAR_uint32_20_20_BIN_OP_DIV_uint32_t_uint9_t_c_l140_c20_e8d6_return_output);

     -- Submodule level 35
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_1243 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c15_89c1_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue := VAR_uint32_uint1_20_BIN_OP_DIV_uint32_t_uint9_t_c_l146_c14_8b29_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_1243;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_1243;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l141_c3_1243;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output;

     -- Submodule level 36
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c6_0d9e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l144_c17_a00c_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output;

     -- Submodule level 37
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_0dbc] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_0dbc_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output,
     VAR_uint32_19_19_BIN_OP_DIV_uint32_t_uint9_t_c_l149_c20_02d9_return_output);

     -- uint32_uint1_19[BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_712d] LATENCY=0
     VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_712d_return_output := uint32_uint1_19(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l142_c3_a190_return_output,
     to_unsigned(1, 1));

     -- Submodule level 38
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_9f81 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c15_0dbc_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue := VAR_uint32_uint1_19_BIN_OP_DIV_uint32_t_uint9_t_c_l155_c14_712d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_9f81;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_9f81;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l150_c3_9f81;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output;

     -- Submodule level 39
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c6_dd9f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l153_c17_1377_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output;

     -- Submodule level 40
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a94b] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a94b_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output,
     VAR_uint32_18_18_BIN_OP_DIV_uint32_t_uint9_t_c_l158_c20_0cbb_return_output);

     -- uint32_uint1_18[BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_c54a] LATENCY=0
     VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_c54a_return_output := uint32_uint1_18(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l151_c3_4216_return_output,
     to_unsigned(1, 1));

     -- Submodule level 41
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_caaa := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c15_a94b_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue := VAR_uint32_uint1_18_BIN_OP_DIV_uint32_t_uint9_t_c_l164_c14_c54a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_caaa;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_caaa;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l159_c3_caaa;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output;

     -- Submodule level 42
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c6_a85a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l162_c17_e075_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output;

     -- Submodule level 43
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output;
     -- uint32_uint1_17[BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_cd89] LATENCY=0
     VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_cd89_return_output := uint32_uint1_17(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_e8e3] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_e8e3_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l160_c3_3963_return_output,
     VAR_uint32_17_17_BIN_OP_DIV_uint32_t_uint9_t_c_l167_c20_2f7e_return_output);

     -- Submodule level 44
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6907 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c15_e8e3_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue := VAR_uint32_uint1_17_BIN_OP_DIV_uint32_t_uint9_t_c_l173_c14_cd89_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6907;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6907;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l168_c3_6907;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output;

     -- Submodule level 45
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c6_3d2a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l171_c17_05fb_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output;

     -- Submodule level 46
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output;
     -- uint32_uint1_16[BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_2796] LATENCY=0
     VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_2796_return_output := uint32_uint1_16(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_5c0d] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_5c0d_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l169_c3_d667_return_output,
     VAR_uint32_16_16_BIN_OP_DIV_uint32_t_uint9_t_c_l176_c20_8963_return_output);

     -- Submodule level 47
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_3df1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c15_5c0d_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue := VAR_uint32_uint1_16_BIN_OP_DIV_uint32_t_uint9_t_c_l182_c14_2796_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_3df1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_3df1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l177_c3_3df1;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output;

     -- Submodule level 48
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c6_9e00_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l180_c17_4e8a_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output;

     -- Submodule level 49
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output;
     -- uint32_uint1_15[BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_9d68] LATENCY=0
     VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_9d68_return_output := uint32_uint1_15(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f5c4] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f5c4_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l178_c3_d3db_return_output,
     VAR_uint32_15_15_BIN_OP_DIV_uint32_t_uint9_t_c_l185_c20_849e_return_output);

     -- Submodule level 50
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_d950 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c15_f5c4_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue := VAR_uint32_uint1_15_BIN_OP_DIV_uint32_t_uint9_t_c_l191_c14_9d68_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_d950;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_d950;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l186_c3_d950;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output;

     -- Submodule level 51
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c6_229d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l189_c17_f4a1_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output;

     -- Submodule level 52
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_6d66] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_6d66_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output,
     VAR_uint32_14_14_BIN_OP_DIV_uint32_t_uint9_t_c_l194_c20_fc0f_return_output);

     -- uint32_uint1_14[BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_4f8a] LATENCY=0
     VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_4f8a_return_output := uint32_uint1_14(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l187_c3_b134_return_output,
     to_unsigned(1, 1));

     -- Submodule level 53
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_de10 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c15_6d66_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue := VAR_uint32_uint1_14_BIN_OP_DIV_uint32_t_uint9_t_c_l200_c14_4f8a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_de10;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_de10;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l195_c3_de10;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output;

     -- Submodule level 54
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c6_90df_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l198_c17_b4c6_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output;

     -- Submodule level 55
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_32b5] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_32b5_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output,
     VAR_uint32_13_13_BIN_OP_DIV_uint32_t_uint9_t_c_l203_c20_9f73_return_output);

     -- uint32_uint1_13[BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_ae61] LATENCY=0
     VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_ae61_return_output := uint32_uint1_13(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l196_c3_d7bc_return_output,
     to_unsigned(1, 1));

     -- Submodule level 56
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_361b := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c15_32b5_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue := VAR_uint32_uint1_13_BIN_OP_DIV_uint32_t_uint9_t_c_l209_c14_ae61_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_361b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_361b;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l204_c3_361b;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output;

     -- Submodule level 57
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c6_82d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l207_c17_faa8_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output;

     -- Submodule level 58
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_076f] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_076f_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output,
     VAR_uint32_12_12_BIN_OP_DIV_uint32_t_uint9_t_c_l212_c20_f4c0_return_output);

     -- uint32_uint1_12[BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_d398] LATENCY=0
     VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_d398_return_output := uint32_uint1_12(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l205_c3_61e2_return_output,
     to_unsigned(1, 1));

     -- Submodule level 59
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_8957 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c15_076f_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue := VAR_uint32_uint1_12_BIN_OP_DIV_uint32_t_uint9_t_c_l218_c14_d398_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_8957;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_8957;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l213_c3_8957;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output;

     -- Submodule level 60
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c6_1488_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l216_c17_b9fe_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output;

     -- Submodule level 61
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output;
     -- uint32_uint1_11[BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6048] LATENCY=0
     VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6048_return_output := uint32_uint1_11(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_bf0e] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_bf0e_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l214_c3_1203_return_output,
     VAR_uint32_11_11_BIN_OP_DIV_uint32_t_uint9_t_c_l221_c20_4a24_return_output);

     -- Submodule level 62
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_195a := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c15_bf0e_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue := VAR_uint32_uint1_11_BIN_OP_DIV_uint32_t_uint9_t_c_l227_c14_6048_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_195a;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_195a;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l222_c3_195a;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output;

     -- Submodule level 63
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c6_865d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l225_c17_622c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output;

     -- Submodule level 64
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_3a71] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_3a71_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output,
     VAR_uint32_10_10_BIN_OP_DIV_uint32_t_uint9_t_c_l230_c20_fd43_return_output);

     -- uint32_uint1_10[BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_7de0] LATENCY=0
     VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_7de0_return_output := uint32_uint1_10(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l223_c3_be24_return_output,
     to_unsigned(1, 1));

     -- Submodule level 65
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_a061 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c15_3a71_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue := VAR_uint32_uint1_10_BIN_OP_DIV_uint32_t_uint9_t_c_l236_c14_7de0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_a061;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_a061;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l231_c3_a061;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output;

     -- Submodule level 66
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c6_dac0_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l234_c17_2185_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output;

     -- Submodule level 67
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6037] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6037_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output,
     VAR_uint32_9_9_BIN_OP_DIV_uint32_t_uint9_t_c_l239_c20_34cd_return_output);

     -- uint32_uint1_9[BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_aab3] LATENCY=0
     VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_aab3_return_output := uint32_uint1_9(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l232_c3_f970_return_output,
     to_unsigned(1, 1));

     -- Submodule level 68
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_68af := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c15_6037_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue := VAR_uint32_uint1_9_BIN_OP_DIV_uint32_t_uint9_t_c_l245_c14_aab3_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_68af;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_68af;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l240_c3_68af;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output;

     -- Submodule level 69
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c6_4530_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l243_c17_06fe_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output;

     -- Submodule level 70
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output;
     -- uint32_uint1_8[BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_357a] LATENCY=0
     VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_357a_return_output := uint32_uint1_8(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_9f24] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_9f24_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l241_c3_47ca_return_output,
     VAR_uint32_8_8_BIN_OP_DIV_uint32_t_uint9_t_c_l248_c20_aae6_return_output);

     -- Submodule level 71
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_1258 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c15_9f24_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue := VAR_uint32_uint1_8_BIN_OP_DIV_uint32_t_uint9_t_c_l254_c14_357a_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_1258;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_1258;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l249_c3_1258;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output;

     -- Submodule level 72
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c6_f7da_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l252_c17_fb73_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output;

     -- Submodule level 73
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_bf73] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_bf73_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output,
     VAR_uint32_7_7_BIN_OP_DIV_uint32_t_uint9_t_c_l257_c20_1f1d_return_output);

     -- uint32_uint1_7[BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_1e5e] LATENCY=0
     VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_1e5e_return_output := uint32_uint1_7(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l250_c3_b7ad_return_output,
     to_unsigned(1, 1));

     -- Submodule level 74
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_a222 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c15_bf73_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue := VAR_uint32_uint1_7_BIN_OP_DIV_uint32_t_uint9_t_c_l263_c14_1e5e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_a222;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_a222;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l258_c3_a222;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output;

     -- Submodule level 75
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c6_9708_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l261_c17_97af_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output;

     -- Submodule level 76
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_c8e0] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_c8e0_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output,
     VAR_uint32_6_6_BIN_OP_DIV_uint32_t_uint9_t_c_l266_c20_6717_return_output);

     -- uint32_uint1_6[BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5c95] LATENCY=0
     VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5c95_return_output := uint32_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l259_c3_43d3_return_output,
     to_unsigned(1, 1));

     -- Submodule level 77
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_3e11 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c15_c8e0_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue := VAR_uint32_uint1_6_BIN_OP_DIV_uint32_t_uint9_t_c_l272_c14_5c95_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_3e11;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_3e11;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l267_c3_3e11;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output;

     -- Submodule level 78
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c6_6aa6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l270_c17_0adc_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output;

     -- Submodule level 79
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output;
     -- uint32_uint1_5[BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_8713] LATENCY=0
     VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_8713_return_output := uint32_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_df72] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_df72_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l268_c3_ad62_return_output,
     VAR_uint32_5_5_BIN_OP_DIV_uint32_t_uint9_t_c_l275_c20_c845_return_output);

     -- Submodule level 80
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_e476 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c15_df72_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue := VAR_uint32_uint1_5_BIN_OP_DIV_uint32_t_uint9_t_c_l281_c14_8713_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_e476;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_e476;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l276_c3_e476;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output;

     -- Submodule level 81
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c6_bef7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l279_c17_1ae4_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output;

     -- Submodule level 82
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_f930] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_f930_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output,
     VAR_uint32_4_4_BIN_OP_DIV_uint32_t_uint9_t_c_l284_c20_d8fe_return_output);

     -- uint32_uint1_4[BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_097e] LATENCY=0
     VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_097e_return_output := uint32_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l277_c3_ee77_return_output,
     to_unsigned(1, 1));

     -- Submodule level 83
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_3261 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c15_f930_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue := VAR_uint32_uint1_4_BIN_OP_DIV_uint32_t_uint9_t_c_l290_c14_097e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_3261;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_3261;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l285_c3_3261;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output;

     -- Submodule level 84
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c6_58e6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l288_c17_162d_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output;

     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output;

     -- Submodule level 85
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_8053] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_8053_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output,
     VAR_uint32_3_3_BIN_OP_DIV_uint32_t_uint9_t_c_l293_c20_91cb_return_output);

     -- uint32_uint1_3[BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_685c] LATENCY=0
     VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_685c_return_output := uint32_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l286_c3_2d46_return_output,
     to_unsigned(1, 1));

     -- Submodule level 86
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_1494 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c15_8053_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue := VAR_uint32_uint1_3_BIN_OP_DIV_uint32_t_uint9_t_c_l299_c14_685c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_1494;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_1494;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l294_c3_1494;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output;

     -- Submodule level 87
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c6_b0ad_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l297_c17_5939_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output;

     -- Submodule level 88
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_fcb2] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_fcb2_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output,
     VAR_uint32_2_2_BIN_OP_DIV_uint32_t_uint9_t_c_l302_c20_cbd3_return_output);

     -- uint32_uint1_2[BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_a8be] LATENCY=0
     VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_a8be_return_output := uint32_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l295_c3_7bcb_return_output,
     to_unsigned(1, 1));

     -- Submodule level 89
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_b8e8 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c15_fcb2_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue := VAR_uint32_uint1_2_BIN_OP_DIV_uint32_t_uint9_t_c_l308_c14_a8be_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_b8e8;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_b8e8;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l303_c3_b8e8;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output;

     -- Submodule level 90
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c6_f9b3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l306_c17_a2fc_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output;

     -- Submodule level 91
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output;
     -- uint32_uint1_1[BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_2939] LATENCY=0
     VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_2939_return_output := uint32_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output,
     to_unsigned(1, 1));

     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_6acf] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_6acf_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l304_c3_5132_return_output,
     VAR_uint32_1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l311_c20_56d8_return_output);

     -- Submodule level 92
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_e5c1 := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c15_6acf_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue := VAR_uint32_uint1_1_BIN_OP_DIV_uint32_t_uint9_t_c_l317_c14_2939_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_e5c1;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_e5c1;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l312_c3_e5c1;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output;

     -- Submodule level 93
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c6_d8cb_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint32_t_uint9_t_c_l315_c17_04a3_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_cond;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iftrue;
     remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output := remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output;

     -- Submodule level 94
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output;
     -- uint32_uint1[BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_91d2] LATENCY=0
     VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_91d2_return_output := uint32_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output,
     VAR_uint32_0_0_BIN_OP_DIV_uint32_t_uint9_t_c_l320_c20_e922_return_output);

     -- uint32_uint1_0[BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_c233] LATENCY=0
     VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_c233_return_output := uint32_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l313_c3_cf17_return_output,
     to_unsigned(1, 1));

     -- Submodule level 95
     VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_a37c := resize(VAR_uint32_uint1_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c15_91d2_return_output, 32);
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue := VAR_uint32_uint1_0_BIN_OP_DIV_uint32_t_uint9_t_c_l326_c14_c233_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left := VAR_remainder_BIN_OP_DIV_uint32_t_uint9_t_c_l321_c3_a37c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_left;
     BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output := BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output;

     -- Submodule level 96
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c6_d4ec_return_output;
     -- output_MUX[BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_cond;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iftrue;
     output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output := output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output;

     -- Submodule level 97
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint32_t_uint9_t_c_l322_c3_4021_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
