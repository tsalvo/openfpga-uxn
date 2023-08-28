-- Timing params:
--   Fixed?: True
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
-- Submodules: 98
entity deo_phased_0CLK_0ef75794 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end deo_phased_0CLK_0ef75794;
architecture arch of deo_phased_0CLK_0ef75794 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal deo_mask : uint16_t_16 := (
0 => to_unsigned(65320, 16),
1 => to_unsigned(768, 16),
2 => to_unsigned(49192, 16),
3 => to_unsigned(32768, 16),
4 => to_unsigned(32768, 16),
5 => to_unsigned(32768, 16),
6 => to_unsigned(32768, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(41568, 16),
11 => to_unsigned(41568, 16),
12 => to_unsigned(0, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal device_port : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_base_address : unsigned(7 downto 0) := to_unsigned(0, 8);
signal port_range_palette_lo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal port_range_palette_hi : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_deo_mask : uint16_t_16;
signal REG_COMB_device_port : unsigned(7 downto 0);
signal REG_COMB_device_base_address : unsigned(7 downto 0);
signal REG_COMB_port_range_palette_lo : unsigned(0 downto 0);
signal REG_COMB_port_range_palette_hi : unsigned(0 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l363_c6_49a8]
signal BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l363_c1_7d30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l369_c7_072e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l363_c2_01de]
signal result_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(0 downto 0);

-- device_port_MUX[uxn_device_h_l363_c2_01de]
signal device_port_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
signal device_port_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(7 downto 0);
signal device_port_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(7 downto 0);
signal device_port_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(7 downto 0);

-- device_base_address_MUX[uxn_device_h_l363_c2_01de]
signal device_base_address_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
signal device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(7 downto 0);
signal device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(7 downto 0);
signal device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l365_c17_396b]
signal BIN_OP_AND_uxn_device_h_l365_c17_396b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l365_c17_396b_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l366_c25_69e6]
signal BIN_OP_AND_uxn_device_h_l366_c25_69e6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l366_c25_69e6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output : unsigned(7 downto 0);

-- poke_dev[uxn_device_h_l367_c3_a361]
signal poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_dev_uxn_device_h_l367_c3_a361_address : unsigned(7 downto 0);
signal poke_dev_uxn_device_h_l367_c3_a361_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l369_c11_6896]
signal BIN_OP_EQ_uxn_device_h_l369_c11_6896_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l369_c11_6896_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l369_c1_9f3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l387_c7_8a7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l369_c7_072e]
signal result_MUX_uxn_device_h_l369_c7_072e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l369_c7_072e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l369_c7_072e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l369_c7_072e_return_output : unsigned(0 downto 0);

-- CONST_SR_4[uxn_device_h_l370_c25_b6e5]
signal CONST_SR_4_uxn_device_h_l370_c25_b6e5_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l370_c15_5fef]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l370_c52_9de6]
signal BIN_OP_AND_uxn_device_h_l370_c52_9de6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l370_c52_9de6_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l370_c15_a440]
signal BIN_OP_SR_uxn_device_h_l370_c15_a440_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l370_c15_a440_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l370_c15_b085]
signal BIN_OP_AND_uxn_device_h_l370_c15_b085_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l370_c15_b085_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l370_c15_a427]
signal UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr : unsigned(15 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l371_c7_64a6]
signal BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l374_c8_78b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l371_c3_0a33]
signal result_MUX_uxn_device_h_l371_c3_0a33_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l371_c3_0a33_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l371_c3_0a33_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l371_c3_0a33_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l374_c12_b40f]
signal BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l377_c8_933d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l374_c8_78b1]
signal result_MUX_uxn_device_h_l374_c8_78b1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l374_c8_78b1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l374_c8_78b1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l374_c8_78b1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l377_c12_1b40]
signal BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l377_c1_ab24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l377_c8_933d]
signal result_MUX_uxn_device_h_l377_c8_933d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l377_c8_933d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l377_c8_933d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l377_c8_933d_return_output : unsigned(0 downto 0);

-- screen_deo_phased[uxn_device_h_l378_c13_8163]
signal screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_deo_phased_uxn_device_h_l378_c13_8163_phase : unsigned(3 downto 0);
signal screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l378_c13_8163_device_port : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l378_c13_8163_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l380_c12_53a4]
signal BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l380_c8_104a]
signal result_MUX_uxn_device_h_l380_c8_104a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l380_c8_104a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l380_c8_104a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l380_c8_104a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l383_c12_e961]
signal BIN_OP_EQ_uxn_device_h_l383_c12_e961_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l383_c12_e961_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l383_c8_1e41]
signal result_MUX_uxn_device_h_l383_c8_1e41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l383_c8_1e41_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l383_c8_1e41_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l383_c8_1e41_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l387_c11_6f6e]
signal BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l387_c1_6354]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l404_c7_bfce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l387_c7_8a7f]
signal result_MUX_uxn_device_h_l387_c7_8a7f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l387_c7_8a7f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l387_c7_8a7f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l387_c7_8a7f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l388_c7_64d2]
signal BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l391_c8_b400]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l388_c3_9bb5]
signal result_MUX_uxn_device_h_l388_c3_9bb5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l388_c3_9bb5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l388_c3_9bb5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l388_c3_9bb5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l391_c12_5f52]
signal BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l394_c8_ef46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l391_c8_b400]
signal result_MUX_uxn_device_h_l391_c8_b400_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l391_c8_b400_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l391_c8_b400_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l391_c8_b400_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l394_c12_4d62]
signal BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l394_c1_7f47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l394_c8_ef46]
signal result_MUX_uxn_device_h_l394_c8_ef46_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l394_c8_ef46_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l394_c8_ef46_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l394_c8_ef46_return_output : unsigned(0 downto 0);

-- screen_deo_phased[uxn_device_h_l395_c13_288d]
signal screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_deo_phased_uxn_device_h_l395_c13_288d_phase : unsigned(3 downto 0);
signal screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l395_c13_288d_device_port : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l395_c13_288d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l397_c12_d947]
signal BIN_OP_EQ_uxn_device_h_l397_c12_d947_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l397_c12_d947_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l397_c8_87f0]
signal result_MUX_uxn_device_h_l397_c8_87f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l397_c8_87f0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l397_c8_87f0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l397_c8_87f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l400_c12_0503]
signal BIN_OP_EQ_uxn_device_h_l400_c12_0503_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l400_c12_0503_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l400_c8_1bae]
signal result_MUX_uxn_device_h_l400_c8_1bae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l400_c8_1bae_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l400_c8_1bae_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l400_c8_1bae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l404_c11_3446]
signal BIN_OP_EQ_uxn_device_h_l404_c11_3446_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l404_c11_3446_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l404_c1_1184]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l421_c7_ba9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l404_c7_bfce]
signal result_MUX_uxn_device_h_l404_c7_bfce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l404_c7_bfce_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l404_c7_bfce_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l404_c7_bfce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l405_c7_7206]
signal BIN_OP_EQ_uxn_device_h_l405_c7_7206_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l405_c7_7206_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l408_c8_084c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l405_c3_3211]
signal result_MUX_uxn_device_h_l405_c3_3211_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l405_c3_3211_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l405_c3_3211_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l405_c3_3211_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l408_c12_b43f]
signal BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l411_c8_7229]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l408_c8_084c]
signal result_MUX_uxn_device_h_l408_c8_084c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l408_c8_084c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l408_c8_084c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l408_c8_084c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l411_c12_d5fe]
signal BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l411_c1_d366]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l411_c8_7229]
signal result_MUX_uxn_device_h_l411_c8_7229_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l411_c8_7229_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l411_c8_7229_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l411_c8_7229_return_output : unsigned(0 downto 0);

-- screen_deo_phased[uxn_device_h_l412_c13_11ce]
signal screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_deo_phased_uxn_device_h_l412_c13_11ce_phase : unsigned(3 downto 0);
signal screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l414_c12_38c9]
signal BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l414_c8_4234]
signal result_MUX_uxn_device_h_l414_c8_4234_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l414_c8_4234_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l414_c8_4234_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l414_c8_4234_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l417_c12_13c3]
signal BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l417_c8_7a1f]
signal result_MUX_uxn_device_h_l417_c8_7a1f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l417_c8_7a1f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l417_c8_7a1f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l417_c8_7a1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l421_c11_5b26]
signal BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l421_c1_edab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l421_c7_ba9a]
signal result_MUX_uxn_device_h_l421_c7_ba9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l421_c7_ba9a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l421_c7_ba9a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l421_c7_ba9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l422_c7_599e]
signal BIN_OP_EQ_uxn_device_h_l422_c7_599e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l422_c7_599e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l425_c8_35a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l422_c3_e3ee]
signal result_MUX_uxn_device_h_l422_c3_e3ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l422_c3_e3ee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l422_c3_e3ee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l422_c3_e3ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l425_c12_8188]
signal BIN_OP_EQ_uxn_device_h_l425_c12_8188_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l425_c12_8188_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l428_c8_b189]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l425_c8_35a6]
signal result_MUX_uxn_device_h_l425_c8_35a6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l425_c8_35a6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l425_c8_35a6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l425_c8_35a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l428_c12_e233]
signal BIN_OP_EQ_uxn_device_h_l428_c12_e233_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l428_c12_e233_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l428_c1_390a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l428_c8_b189]
signal result_MUX_uxn_device_h_l428_c8_b189_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l428_c8_b189_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l428_c8_b189_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l428_c8_b189_return_output : unsigned(0 downto 0);

-- screen_deo_phased[uxn_device_h_l429_c13_a9af]
signal screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_deo_phased_uxn_device_h_l429_c13_a9af_phase : unsigned(3 downto 0);
signal screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port : unsigned(7 downto 0);
signal screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l431_c12_0cbb]
signal BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l431_c8_6fb9]
signal result_MUX_uxn_device_h_l431_c8_6fb9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l431_c8_6fb9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l431_c8_6fb9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l431_c8_6fb9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l434_c12_538f]
signal BIN_OP_EQ_uxn_device_h_l434_c12_538f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l434_c12_538f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l434_c8_7e3b]
signal result_MUX_uxn_device_h_l434_c8_7e3b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l434_c8_7e3b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l434_c8_7e3b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l434_c8_7e3b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l438_c11_fdf6]
signal BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l438_c7_d2fc]
signal result_MUX_uxn_device_h_l438_c7_d2fc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l438_c7_d2fc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l438_c7_d2fc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l438_c7_d2fc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l439_c7_712c]
signal BIN_OP_EQ_uxn_device_h_l439_c7_712c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l439_c7_712c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l439_c3_4e03]
signal result_MUX_uxn_device_h_l439_c3_4e03_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l439_c3_4e03_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l439_c3_4e03_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l439_c3_4e03_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l442_c12_284b]
signal BIN_OP_EQ_uxn_device_h_l442_c12_284b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l442_c12_284b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l442_c8_f5c8]
signal result_MUX_uxn_device_h_l442_c8_f5c8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l442_c8_f5c8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l442_c8_f5c8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l442_c8_f5c8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l445_c12_b5b8]
signal BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l445_c8_3fa9]
signal result_MUX_uxn_device_h_l445_c8_3fa9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l445_c8_3fa9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l445_c8_3fa9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l445_c8_3fa9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l448_c12_3f81]
signal BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l448_c8_235c]
signal result_MUX_uxn_device_h_l448_c8_235c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l448_c8_235c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l448_c8_235c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l448_c8_235c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l451_c12_6bec]
signal BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l451_c8_109a]
signal result_MUX_uxn_device_h_l451_c8_109a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l451_c8_109a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l451_c8_109a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l451_c8_109a_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l363_c6_49a8
BIN_OP_EQ_uxn_device_h_l363_c6_49a8 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left,
BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right,
BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output);

-- result_MUX_uxn_device_h_l363_c2_01de
result_MUX_uxn_device_h_l363_c2_01de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l363_c2_01de_cond,
result_MUX_uxn_device_h_l363_c2_01de_iftrue,
result_MUX_uxn_device_h_l363_c2_01de_iffalse,
result_MUX_uxn_device_h_l363_c2_01de_return_output);

-- device_port_MUX_uxn_device_h_l363_c2_01de
device_port_MUX_uxn_device_h_l363_c2_01de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_port_MUX_uxn_device_h_l363_c2_01de_cond,
device_port_MUX_uxn_device_h_l363_c2_01de_iftrue,
device_port_MUX_uxn_device_h_l363_c2_01de_iffalse,
device_port_MUX_uxn_device_h_l363_c2_01de_return_output);

-- device_base_address_MUX_uxn_device_h_l363_c2_01de
device_base_address_MUX_uxn_device_h_l363_c2_01de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_base_address_MUX_uxn_device_h_l363_c2_01de_cond,
device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue,
device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse,
device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output);

-- BIN_OP_AND_uxn_device_h_l365_c17_396b
BIN_OP_AND_uxn_device_h_l365_c17_396b : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l365_c17_396b_left,
BIN_OP_AND_uxn_device_h_l365_c17_396b_right,
BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output);

-- BIN_OP_AND_uxn_device_h_l366_c25_69e6
BIN_OP_AND_uxn_device_h_l366_c25_69e6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l366_c25_69e6_left,
BIN_OP_AND_uxn_device_h_l366_c25_69e6_right,
BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output);

-- poke_dev_uxn_device_h_l367_c3_a361
poke_dev_uxn_device_h_l367_c3_a361 : entity work.poke_dev_0CLK_de264c78 port map (
poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE,
poke_dev_uxn_device_h_l367_c3_a361_address,
poke_dev_uxn_device_h_l367_c3_a361_value);

-- BIN_OP_EQ_uxn_device_h_l369_c11_6896
BIN_OP_EQ_uxn_device_h_l369_c11_6896 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l369_c11_6896_left,
BIN_OP_EQ_uxn_device_h_l369_c11_6896_right,
BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output);

-- result_MUX_uxn_device_h_l369_c7_072e
result_MUX_uxn_device_h_l369_c7_072e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l369_c7_072e_cond,
result_MUX_uxn_device_h_l369_c7_072e_iftrue,
result_MUX_uxn_device_h_l369_c7_072e_iffalse,
result_MUX_uxn_device_h_l369_c7_072e_return_output);

-- CONST_SR_4_uxn_device_h_l370_c25_b6e5
CONST_SR_4_uxn_device_h_l370_c25_b6e5 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l370_c25_b6e5_x,
CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output);

-- BIN_OP_AND_uxn_device_h_l370_c52_9de6
BIN_OP_AND_uxn_device_h_l370_c52_9de6 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l370_c52_9de6_left,
BIN_OP_AND_uxn_device_h_l370_c52_9de6_right,
BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output);

-- BIN_OP_SR_uxn_device_h_l370_c15_a440
BIN_OP_SR_uxn_device_h_l370_c15_a440 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l370_c15_a440_left,
BIN_OP_SR_uxn_device_h_l370_c15_a440_right,
BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output);

-- BIN_OP_AND_uxn_device_h_l370_c15_b085
BIN_OP_AND_uxn_device_h_l370_c15_b085 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l370_c15_b085_left,
BIN_OP_AND_uxn_device_h_l370_c15_b085_right,
BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output);

-- UNARY_OP_NOT_uxn_device_h_l370_c15_a427
UNARY_OP_NOT_uxn_device_h_l370_c15_a427 : entity work.UNARY_OP_NOT_uint16_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr,
UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output);

-- BIN_OP_EQ_uxn_device_h_l371_c7_64a6
BIN_OP_EQ_uxn_device_h_l371_c7_64a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left,
BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right,
BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output);

-- result_MUX_uxn_device_h_l371_c3_0a33
result_MUX_uxn_device_h_l371_c3_0a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l371_c3_0a33_cond,
result_MUX_uxn_device_h_l371_c3_0a33_iftrue,
result_MUX_uxn_device_h_l371_c3_0a33_iffalse,
result_MUX_uxn_device_h_l371_c3_0a33_return_output);

-- BIN_OP_EQ_uxn_device_h_l374_c12_b40f
BIN_OP_EQ_uxn_device_h_l374_c12_b40f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left,
BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right,
BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output);

-- result_MUX_uxn_device_h_l374_c8_78b1
result_MUX_uxn_device_h_l374_c8_78b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l374_c8_78b1_cond,
result_MUX_uxn_device_h_l374_c8_78b1_iftrue,
result_MUX_uxn_device_h_l374_c8_78b1_iffalse,
result_MUX_uxn_device_h_l374_c8_78b1_return_output);

-- BIN_OP_EQ_uxn_device_h_l377_c12_1b40
BIN_OP_EQ_uxn_device_h_l377_c12_1b40 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left,
BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right,
BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output);

-- result_MUX_uxn_device_h_l377_c8_933d
result_MUX_uxn_device_h_l377_c8_933d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l377_c8_933d_cond,
result_MUX_uxn_device_h_l377_c8_933d_iftrue,
result_MUX_uxn_device_h_l377_c8_933d_iffalse,
result_MUX_uxn_device_h_l377_c8_933d_return_output);

-- screen_deo_phased_uxn_device_h_l378_c13_8163
screen_deo_phased_uxn_device_h_l378_c13_8163 : entity work.screen_deo_phased_0CLK_f52d3c7c port map (
clk,
screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE,
screen_deo_phased_uxn_device_h_l378_c13_8163_phase,
screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address,
screen_deo_phased_uxn_device_h_l378_c13_8163_device_port,
screen_deo_phased_uxn_device_h_l378_c13_8163_return_output);

-- BIN_OP_EQ_uxn_device_h_l380_c12_53a4
BIN_OP_EQ_uxn_device_h_l380_c12_53a4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left,
BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right,
BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output);

-- result_MUX_uxn_device_h_l380_c8_104a
result_MUX_uxn_device_h_l380_c8_104a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l380_c8_104a_cond,
result_MUX_uxn_device_h_l380_c8_104a_iftrue,
result_MUX_uxn_device_h_l380_c8_104a_iffalse,
result_MUX_uxn_device_h_l380_c8_104a_return_output);

-- BIN_OP_EQ_uxn_device_h_l383_c12_e961
BIN_OP_EQ_uxn_device_h_l383_c12_e961 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l383_c12_e961_left,
BIN_OP_EQ_uxn_device_h_l383_c12_e961_right,
BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output);

-- result_MUX_uxn_device_h_l383_c8_1e41
result_MUX_uxn_device_h_l383_c8_1e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l383_c8_1e41_cond,
result_MUX_uxn_device_h_l383_c8_1e41_iftrue,
result_MUX_uxn_device_h_l383_c8_1e41_iffalse,
result_MUX_uxn_device_h_l383_c8_1e41_return_output);

-- BIN_OP_EQ_uxn_device_h_l387_c11_6f6e
BIN_OP_EQ_uxn_device_h_l387_c11_6f6e : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left,
BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right,
BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output);

-- result_MUX_uxn_device_h_l387_c7_8a7f
result_MUX_uxn_device_h_l387_c7_8a7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l387_c7_8a7f_cond,
result_MUX_uxn_device_h_l387_c7_8a7f_iftrue,
result_MUX_uxn_device_h_l387_c7_8a7f_iffalse,
result_MUX_uxn_device_h_l387_c7_8a7f_return_output);

-- BIN_OP_EQ_uxn_device_h_l388_c7_64d2
BIN_OP_EQ_uxn_device_h_l388_c7_64d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left,
BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right,
BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output);

-- result_MUX_uxn_device_h_l388_c3_9bb5
result_MUX_uxn_device_h_l388_c3_9bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l388_c3_9bb5_cond,
result_MUX_uxn_device_h_l388_c3_9bb5_iftrue,
result_MUX_uxn_device_h_l388_c3_9bb5_iffalse,
result_MUX_uxn_device_h_l388_c3_9bb5_return_output);

-- BIN_OP_EQ_uxn_device_h_l391_c12_5f52
BIN_OP_EQ_uxn_device_h_l391_c12_5f52 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left,
BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right,
BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output);

-- result_MUX_uxn_device_h_l391_c8_b400
result_MUX_uxn_device_h_l391_c8_b400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l391_c8_b400_cond,
result_MUX_uxn_device_h_l391_c8_b400_iftrue,
result_MUX_uxn_device_h_l391_c8_b400_iffalse,
result_MUX_uxn_device_h_l391_c8_b400_return_output);

-- BIN_OP_EQ_uxn_device_h_l394_c12_4d62
BIN_OP_EQ_uxn_device_h_l394_c12_4d62 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left,
BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right,
BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output);

-- result_MUX_uxn_device_h_l394_c8_ef46
result_MUX_uxn_device_h_l394_c8_ef46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l394_c8_ef46_cond,
result_MUX_uxn_device_h_l394_c8_ef46_iftrue,
result_MUX_uxn_device_h_l394_c8_ef46_iffalse,
result_MUX_uxn_device_h_l394_c8_ef46_return_output);

-- screen_deo_phased_uxn_device_h_l395_c13_288d
screen_deo_phased_uxn_device_h_l395_c13_288d : entity work.screen_deo_phased_0CLK_f52d3c7c port map (
clk,
screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE,
screen_deo_phased_uxn_device_h_l395_c13_288d_phase,
screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address,
screen_deo_phased_uxn_device_h_l395_c13_288d_device_port,
screen_deo_phased_uxn_device_h_l395_c13_288d_return_output);

-- BIN_OP_EQ_uxn_device_h_l397_c12_d947
BIN_OP_EQ_uxn_device_h_l397_c12_d947 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l397_c12_d947_left,
BIN_OP_EQ_uxn_device_h_l397_c12_d947_right,
BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output);

-- result_MUX_uxn_device_h_l397_c8_87f0
result_MUX_uxn_device_h_l397_c8_87f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l397_c8_87f0_cond,
result_MUX_uxn_device_h_l397_c8_87f0_iftrue,
result_MUX_uxn_device_h_l397_c8_87f0_iffalse,
result_MUX_uxn_device_h_l397_c8_87f0_return_output);

-- BIN_OP_EQ_uxn_device_h_l400_c12_0503
BIN_OP_EQ_uxn_device_h_l400_c12_0503 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l400_c12_0503_left,
BIN_OP_EQ_uxn_device_h_l400_c12_0503_right,
BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output);

-- result_MUX_uxn_device_h_l400_c8_1bae
result_MUX_uxn_device_h_l400_c8_1bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l400_c8_1bae_cond,
result_MUX_uxn_device_h_l400_c8_1bae_iftrue,
result_MUX_uxn_device_h_l400_c8_1bae_iffalse,
result_MUX_uxn_device_h_l400_c8_1bae_return_output);

-- BIN_OP_EQ_uxn_device_h_l404_c11_3446
BIN_OP_EQ_uxn_device_h_l404_c11_3446 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l404_c11_3446_left,
BIN_OP_EQ_uxn_device_h_l404_c11_3446_right,
BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output);

-- result_MUX_uxn_device_h_l404_c7_bfce
result_MUX_uxn_device_h_l404_c7_bfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l404_c7_bfce_cond,
result_MUX_uxn_device_h_l404_c7_bfce_iftrue,
result_MUX_uxn_device_h_l404_c7_bfce_iffalse,
result_MUX_uxn_device_h_l404_c7_bfce_return_output);

-- BIN_OP_EQ_uxn_device_h_l405_c7_7206
BIN_OP_EQ_uxn_device_h_l405_c7_7206 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l405_c7_7206_left,
BIN_OP_EQ_uxn_device_h_l405_c7_7206_right,
BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output);

-- result_MUX_uxn_device_h_l405_c3_3211
result_MUX_uxn_device_h_l405_c3_3211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l405_c3_3211_cond,
result_MUX_uxn_device_h_l405_c3_3211_iftrue,
result_MUX_uxn_device_h_l405_c3_3211_iffalse,
result_MUX_uxn_device_h_l405_c3_3211_return_output);

-- BIN_OP_EQ_uxn_device_h_l408_c12_b43f
BIN_OP_EQ_uxn_device_h_l408_c12_b43f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left,
BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right,
BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output);

-- result_MUX_uxn_device_h_l408_c8_084c
result_MUX_uxn_device_h_l408_c8_084c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l408_c8_084c_cond,
result_MUX_uxn_device_h_l408_c8_084c_iftrue,
result_MUX_uxn_device_h_l408_c8_084c_iffalse,
result_MUX_uxn_device_h_l408_c8_084c_return_output);

-- BIN_OP_EQ_uxn_device_h_l411_c12_d5fe
BIN_OP_EQ_uxn_device_h_l411_c12_d5fe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left,
BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right,
BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output);

-- result_MUX_uxn_device_h_l411_c8_7229
result_MUX_uxn_device_h_l411_c8_7229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l411_c8_7229_cond,
result_MUX_uxn_device_h_l411_c8_7229_iftrue,
result_MUX_uxn_device_h_l411_c8_7229_iffalse,
result_MUX_uxn_device_h_l411_c8_7229_return_output);

-- screen_deo_phased_uxn_device_h_l412_c13_11ce
screen_deo_phased_uxn_device_h_l412_c13_11ce : entity work.screen_deo_phased_0CLK_f52d3c7c port map (
clk,
screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE,
screen_deo_phased_uxn_device_h_l412_c13_11ce_phase,
screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address,
screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port,
screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output);

-- BIN_OP_EQ_uxn_device_h_l414_c12_38c9
BIN_OP_EQ_uxn_device_h_l414_c12_38c9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left,
BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right,
BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output);

-- result_MUX_uxn_device_h_l414_c8_4234
result_MUX_uxn_device_h_l414_c8_4234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l414_c8_4234_cond,
result_MUX_uxn_device_h_l414_c8_4234_iftrue,
result_MUX_uxn_device_h_l414_c8_4234_iffalse,
result_MUX_uxn_device_h_l414_c8_4234_return_output);

-- BIN_OP_EQ_uxn_device_h_l417_c12_13c3
BIN_OP_EQ_uxn_device_h_l417_c12_13c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left,
BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right,
BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output);

-- result_MUX_uxn_device_h_l417_c8_7a1f
result_MUX_uxn_device_h_l417_c8_7a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l417_c8_7a1f_cond,
result_MUX_uxn_device_h_l417_c8_7a1f_iftrue,
result_MUX_uxn_device_h_l417_c8_7a1f_iffalse,
result_MUX_uxn_device_h_l417_c8_7a1f_return_output);

-- BIN_OP_EQ_uxn_device_h_l421_c11_5b26
BIN_OP_EQ_uxn_device_h_l421_c11_5b26 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left,
BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right,
BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output);

-- result_MUX_uxn_device_h_l421_c7_ba9a
result_MUX_uxn_device_h_l421_c7_ba9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l421_c7_ba9a_cond,
result_MUX_uxn_device_h_l421_c7_ba9a_iftrue,
result_MUX_uxn_device_h_l421_c7_ba9a_iffalse,
result_MUX_uxn_device_h_l421_c7_ba9a_return_output);

-- BIN_OP_EQ_uxn_device_h_l422_c7_599e
BIN_OP_EQ_uxn_device_h_l422_c7_599e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l422_c7_599e_left,
BIN_OP_EQ_uxn_device_h_l422_c7_599e_right,
BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output);

-- result_MUX_uxn_device_h_l422_c3_e3ee
result_MUX_uxn_device_h_l422_c3_e3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l422_c3_e3ee_cond,
result_MUX_uxn_device_h_l422_c3_e3ee_iftrue,
result_MUX_uxn_device_h_l422_c3_e3ee_iffalse,
result_MUX_uxn_device_h_l422_c3_e3ee_return_output);

-- BIN_OP_EQ_uxn_device_h_l425_c12_8188
BIN_OP_EQ_uxn_device_h_l425_c12_8188 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l425_c12_8188_left,
BIN_OP_EQ_uxn_device_h_l425_c12_8188_right,
BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output);

-- result_MUX_uxn_device_h_l425_c8_35a6
result_MUX_uxn_device_h_l425_c8_35a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l425_c8_35a6_cond,
result_MUX_uxn_device_h_l425_c8_35a6_iftrue,
result_MUX_uxn_device_h_l425_c8_35a6_iffalse,
result_MUX_uxn_device_h_l425_c8_35a6_return_output);

-- BIN_OP_EQ_uxn_device_h_l428_c12_e233
BIN_OP_EQ_uxn_device_h_l428_c12_e233 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l428_c12_e233_left,
BIN_OP_EQ_uxn_device_h_l428_c12_e233_right,
BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output);

-- result_MUX_uxn_device_h_l428_c8_b189
result_MUX_uxn_device_h_l428_c8_b189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l428_c8_b189_cond,
result_MUX_uxn_device_h_l428_c8_b189_iftrue,
result_MUX_uxn_device_h_l428_c8_b189_iffalse,
result_MUX_uxn_device_h_l428_c8_b189_return_output);

-- screen_deo_phased_uxn_device_h_l429_c13_a9af
screen_deo_phased_uxn_device_h_l429_c13_a9af : entity work.screen_deo_phased_0CLK_f52d3c7c port map (
clk,
screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE,
screen_deo_phased_uxn_device_h_l429_c13_a9af_phase,
screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address,
screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port,
screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output);

-- BIN_OP_EQ_uxn_device_h_l431_c12_0cbb
BIN_OP_EQ_uxn_device_h_l431_c12_0cbb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left,
BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right,
BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output);

-- result_MUX_uxn_device_h_l431_c8_6fb9
result_MUX_uxn_device_h_l431_c8_6fb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l431_c8_6fb9_cond,
result_MUX_uxn_device_h_l431_c8_6fb9_iftrue,
result_MUX_uxn_device_h_l431_c8_6fb9_iffalse,
result_MUX_uxn_device_h_l431_c8_6fb9_return_output);

-- BIN_OP_EQ_uxn_device_h_l434_c12_538f
BIN_OP_EQ_uxn_device_h_l434_c12_538f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l434_c12_538f_left,
BIN_OP_EQ_uxn_device_h_l434_c12_538f_right,
BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output);

-- result_MUX_uxn_device_h_l434_c8_7e3b
result_MUX_uxn_device_h_l434_c8_7e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l434_c8_7e3b_cond,
result_MUX_uxn_device_h_l434_c8_7e3b_iftrue,
result_MUX_uxn_device_h_l434_c8_7e3b_iffalse,
result_MUX_uxn_device_h_l434_c8_7e3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l438_c11_fdf6
BIN_OP_EQ_uxn_device_h_l438_c11_fdf6 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left,
BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right,
BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output);

-- result_MUX_uxn_device_h_l438_c7_d2fc
result_MUX_uxn_device_h_l438_c7_d2fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l438_c7_d2fc_cond,
result_MUX_uxn_device_h_l438_c7_d2fc_iftrue,
result_MUX_uxn_device_h_l438_c7_d2fc_iffalse,
result_MUX_uxn_device_h_l438_c7_d2fc_return_output);

-- BIN_OP_EQ_uxn_device_h_l439_c7_712c
BIN_OP_EQ_uxn_device_h_l439_c7_712c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l439_c7_712c_left,
BIN_OP_EQ_uxn_device_h_l439_c7_712c_right,
BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output);

-- result_MUX_uxn_device_h_l439_c3_4e03
result_MUX_uxn_device_h_l439_c3_4e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l439_c3_4e03_cond,
result_MUX_uxn_device_h_l439_c3_4e03_iftrue,
result_MUX_uxn_device_h_l439_c3_4e03_iffalse,
result_MUX_uxn_device_h_l439_c3_4e03_return_output);

-- BIN_OP_EQ_uxn_device_h_l442_c12_284b
BIN_OP_EQ_uxn_device_h_l442_c12_284b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l442_c12_284b_left,
BIN_OP_EQ_uxn_device_h_l442_c12_284b_right,
BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output);

-- result_MUX_uxn_device_h_l442_c8_f5c8
result_MUX_uxn_device_h_l442_c8_f5c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l442_c8_f5c8_cond,
result_MUX_uxn_device_h_l442_c8_f5c8_iftrue,
result_MUX_uxn_device_h_l442_c8_f5c8_iffalse,
result_MUX_uxn_device_h_l442_c8_f5c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l445_c12_b5b8
BIN_OP_EQ_uxn_device_h_l445_c12_b5b8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left,
BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right,
BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output);

-- result_MUX_uxn_device_h_l445_c8_3fa9
result_MUX_uxn_device_h_l445_c8_3fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l445_c8_3fa9_cond,
result_MUX_uxn_device_h_l445_c8_3fa9_iftrue,
result_MUX_uxn_device_h_l445_c8_3fa9_iffalse,
result_MUX_uxn_device_h_l445_c8_3fa9_return_output);

-- BIN_OP_EQ_uxn_device_h_l448_c12_3f81
BIN_OP_EQ_uxn_device_h_l448_c12_3f81 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left,
BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right,
BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output);

-- result_MUX_uxn_device_h_l448_c8_235c
result_MUX_uxn_device_h_l448_c8_235c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l448_c8_235c_cond,
result_MUX_uxn_device_h_l448_c8_235c_iftrue,
result_MUX_uxn_device_h_l448_c8_235c_iffalse,
result_MUX_uxn_device_h_l448_c8_235c_return_output);

-- BIN_OP_EQ_uxn_device_h_l451_c12_6bec
BIN_OP_EQ_uxn_device_h_l451_c12_6bec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left,
BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right,
BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output);

-- result_MUX_uxn_device_h_l451_c8_109a
result_MUX_uxn_device_h_l451_c8_109a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l451_c8_109a_cond,
result_MUX_uxn_device_h_l451_c8_109a_iftrue,
result_MUX_uxn_device_h_l451_c8_109a_iffalse,
result_MUX_uxn_device_h_l451_c8_109a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 device_address,
 value,
 -- Registers
 deo_mask,
 device_port,
 device_base_address,
 port_range_palette_lo,
 port_range_palette_hi,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output,
 result_MUX_uxn_device_h_l363_c2_01de_return_output,
 device_port_MUX_uxn_device_h_l363_c2_01de_return_output,
 device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output,
 BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output,
 BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output,
 BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output,
 result_MUX_uxn_device_h_l369_c7_072e_return_output,
 CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output,
 BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output,
 BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output,
 BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output,
 UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output,
 BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output,
 result_MUX_uxn_device_h_l371_c3_0a33_return_output,
 BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output,
 result_MUX_uxn_device_h_l374_c8_78b1_return_output,
 BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output,
 result_MUX_uxn_device_h_l377_c8_933d_return_output,
 screen_deo_phased_uxn_device_h_l378_c13_8163_return_output,
 BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output,
 result_MUX_uxn_device_h_l380_c8_104a_return_output,
 BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output,
 result_MUX_uxn_device_h_l383_c8_1e41_return_output,
 BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output,
 result_MUX_uxn_device_h_l387_c7_8a7f_return_output,
 BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output,
 result_MUX_uxn_device_h_l388_c3_9bb5_return_output,
 BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output,
 result_MUX_uxn_device_h_l391_c8_b400_return_output,
 BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output,
 result_MUX_uxn_device_h_l394_c8_ef46_return_output,
 screen_deo_phased_uxn_device_h_l395_c13_288d_return_output,
 BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output,
 result_MUX_uxn_device_h_l397_c8_87f0_return_output,
 BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output,
 result_MUX_uxn_device_h_l400_c8_1bae_return_output,
 BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output,
 result_MUX_uxn_device_h_l404_c7_bfce_return_output,
 BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output,
 result_MUX_uxn_device_h_l405_c3_3211_return_output,
 BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output,
 result_MUX_uxn_device_h_l408_c8_084c_return_output,
 BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output,
 result_MUX_uxn_device_h_l411_c8_7229_return_output,
 screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output,
 BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output,
 result_MUX_uxn_device_h_l414_c8_4234_return_output,
 BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output,
 result_MUX_uxn_device_h_l417_c8_7a1f_return_output,
 BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output,
 result_MUX_uxn_device_h_l421_c7_ba9a_return_output,
 BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output,
 result_MUX_uxn_device_h_l422_c3_e3ee_return_output,
 BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output,
 result_MUX_uxn_device_h_l425_c8_35a6_return_output,
 BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output,
 result_MUX_uxn_device_h_l428_c8_b189_return_output,
 screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output,
 BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output,
 result_MUX_uxn_device_h_l431_c8_6fb9_return_output,
 BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output,
 result_MUX_uxn_device_h_l434_c8_7e3b_return_output,
 BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output,
 result_MUX_uxn_device_h_l438_c7_d2fc_return_output,
 BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output,
 result_MUX_uxn_device_h_l439_c3_4e03_return_output,
 BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output,
 result_MUX_uxn_device_h_l442_c8_f5c8_return_output,
 BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output,
 result_MUX_uxn_device_h_l445_c8_3fa9_return_output,
 BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output,
 result_MUX_uxn_device_h_l448_c8_235c_return_output,
 BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output,
 result_MUX_uxn_device_h_l451_c8_109a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l369_c7_072e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(7 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(7 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(7 downto 0);
 variable VAR_device_port_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
 variable VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue : unsigned(7 downto 0);
 variable VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse : unsigned(7 downto 0);
 variable VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output : unsigned(7 downto 0);
 variable VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output : unsigned(7 downto 0);
 variable VAR_poke_dev_uxn_device_h_l367_c3_a361_address : unsigned(7 downto 0);
 variable VAR_poke_dev_uxn_device_h_l367_c3_a361_value : unsigned(7 downto 0);
 variable VAR_poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l369_c7_072e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l371_c3_0a33_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l369_c7_072e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l387_c7_8a7f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l369_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_result_uxn_device_h_l370_c3_bc94 : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l371_c3_0a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l371_c3_0a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l374_c8_78b1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l371_c3_0a33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l374_c8_78b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l374_c8_78b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l377_c8_933d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l374_c8_78b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l377_c8_933d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l377_c8_933d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l380_c8_104a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l377_c8_933d_cond : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_phase : unsigned(3 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_port : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l380_c8_104a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l380_c8_104a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l383_c8_1e41_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l380_c8_104a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l383_c8_1e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l383_c8_1e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l383_c8_1e41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l388_c3_9bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l404_c7_bfce_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l387_c7_8a7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l391_c8_b400_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l388_c3_9bb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l391_c8_b400_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l391_c8_b400_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l394_c8_ef46_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l391_c8_b400_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l394_c8_ef46_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l394_c8_ef46_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l397_c8_87f0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l394_c8_ef46_cond : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_phase : unsigned(3 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_port : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l397_c8_87f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l397_c8_87f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l400_c8_1bae_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l397_c8_87f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l400_c8_1bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l400_c8_1bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l400_c8_1bae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l404_c7_bfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l405_c3_3211_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l404_c7_bfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l421_c7_ba9a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l404_c7_bfce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l405_c3_3211_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l405_c3_3211_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l408_c8_084c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l405_c3_3211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l408_c8_084c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l408_c8_084c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l411_c8_7229_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l408_c8_084c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l411_c8_7229_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l411_c8_7229_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l414_c8_4234_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l411_c8_7229_cond : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_phase : unsigned(3 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l414_c8_4234_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l414_c8_4234_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l417_c8_7a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l414_c8_4234_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l417_c8_7a1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l422_c3_e3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l438_c7_d2fc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l421_c7_ba9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l425_c8_35a6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l422_c3_e3ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l425_c8_35a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l425_c8_35a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l428_c8_b189_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l425_c8_35a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l428_c8_b189_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l428_c8_b189_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l431_c8_6fb9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l428_c8_b189_cond : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_phase : unsigned(3 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port : unsigned(7 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l434_c8_7e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l431_c8_6fb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l434_c8_7e3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l439_c3_4e03_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l438_c7_d2fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l439_c3_4e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l439_c3_4e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l442_c8_f5c8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l439_c3_4e03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l445_c8_3fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l442_c8_f5c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l448_c8_235c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l445_c8_3fa9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l448_c8_235c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l448_c8_235c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l451_c8_109a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l448_c8_235c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l451_c8_109a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l451_c8_109a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l451_c8_109a_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_deo_mask : uint16_t_16;
variable REG_VAR_device_port : unsigned(7 downto 0);
variable REG_VAR_device_base_address : unsigned(7 downto 0);
variable REG_VAR_port_range_palette_lo : unsigned(0 downto 0);
variable REG_VAR_port_range_palette_hi : unsigned(0 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_deo_mask := deo_mask;
  REG_VAR_device_port := device_port;
  REG_VAR_device_base_address := device_base_address;
  REG_VAR_port_range_palette_lo := port_range_palette_lo;
  REG_VAR_port_range_palette_hi := port_range_palette_hi;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_right := to_unsigned(176, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l371_c3_0a33_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l380_c8_104a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right := to_unsigned(160, 8);
     VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right := to_unsigned(32, 6);
     VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l363_c2_01de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_right := to_unsigned(160, 8);
     VAR_result_MUX_uxn_device_h_l439_c3_4e03_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right := to_unsigned(4, 3);
     VAR_result_MUX_uxn_device_h_l405_c3_3211_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_right := to_unsigned(176, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right := to_unsigned(176, 8);
     VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_phase := resize(to_unsigned(3, 2), 4);
     VAR_result_MUX_uxn_device_h_l448_c8_235c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l391_c8_b400_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l400_c8_1bae_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l408_c8_084c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_right := to_unsigned(176, 8);
     VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l425_c8_35a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right := to_unsigned(16, 5);
     VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_right := to_unsigned(15, 4);
     VAR_result_MUX_uxn_device_h_l451_c8_109a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right := to_unsigned(16, 5);
     VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_phase := resize(to_unsigned(2, 2), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse := to_unsigned(0, 1);
     VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_phase := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right := to_unsigned(176, 8);
     VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right := to_unsigned(160, 8);
     VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_phase := resize(to_unsigned(0, 1), 4);
     VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_right := to_unsigned(3, 2);
     VAR_result_MUX_uxn_device_h_l397_c8_87f0_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l374_c8_78b1_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l383_c8_1e41_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_right := to_unsigned(16, 5);
     VAR_result_MUX_uxn_device_h_l414_c8_4234_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right := to_unsigned(160, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_device_address := device_address;
     VAR_value := value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue := VAR_CLOCK_ENABLE;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0 := deo_mask;
     REG_VAR_deo_mask := deo_mask;
     VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_left := VAR_device_address;
     VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_left := VAR_device_address;
     VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_x := VAR_device_address;
     VAR_poke_dev_uxn_device_h_l367_c3_a361_address := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left := device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left := device_base_address;
     VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse := device_base_address;
     VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address := device_base_address;
     VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address := device_base_address;
     VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address := device_base_address;
     VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address := device_base_address;
     VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iffalse := device_port;
     VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_port := device_port;
     VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_port := device_port;
     VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port := device_port;
     VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port := device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left := VAR_phase;
     REG_VAR_port_range_palette_hi := port_range_palette_hi;
     REG_VAR_port_range_palette_lo := port_range_palette_lo;
     VAR_result_MUX_uxn_device_h_l400_c8_1bae_iffalse := result;
     VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iffalse := result;
     VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iffalse := result;
     VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iffalse := result;
     VAR_result_MUX_uxn_device_h_l451_c8_109a_iffalse := result;
     VAR_poke_dev_uxn_device_h_l367_c3_a361_value := VAR_value;
     -- BIN_OP_EQ[uxn_device_h_l411_c12_d5fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_left;
     BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output := BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l380_c12_53a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_left;
     BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output := BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l405_c7_7206] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l405_c7_7206_left <= VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_left;
     BIN_OP_EQ_uxn_device_h_l405_c7_7206_right <= VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output := BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output;

     -- BIN_OP_EQ[uxn_device_h_l428_c12_e233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l428_c12_e233_left <= VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_left;
     BIN_OP_EQ_uxn_device_h_l428_c12_e233_right <= VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output := BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output;

     -- BIN_OP_EQ[uxn_device_h_l414_c12_38c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left <= VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_left;
     BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right <= VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output := BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l448_c12_3f81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left <= VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_left;
     BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right <= VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output := BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output;

     -- BIN_OP_AND[uxn_device_h_l365_c17_396b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l365_c17_396b_left <= VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_left;
     BIN_OP_AND_uxn_device_h_l365_c17_396b_right <= VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output := BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output;

     -- BIN_OP_AND[uxn_device_h_l370_c52_9de6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l370_c52_9de6_left <= VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_left;
     BIN_OP_AND_uxn_device_h_l370_c52_9de6_right <= VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output := BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l388_c7_64d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left <= VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_left;
     BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right <= VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output := BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l394_c12_4d62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left <= VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_left;
     BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right <= VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output := BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output;

     -- BIN_OP_EQ[uxn_device_h_l408_c12_b43f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left <= VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_left;
     BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right <= VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output := BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l377_c12_1b40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left <= VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_left;
     BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right <= VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output := BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output;

     -- BIN_OP_EQ[uxn_device_h_l383_c12_e961] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l383_c12_e961_left <= VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_left;
     BIN_OP_EQ_uxn_device_h_l383_c12_e961_right <= VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output := BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output;

     -- BIN_OP_EQ[uxn_device_h_l442_c12_284b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l442_c12_284b_left <= VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_left;
     BIN_OP_EQ_uxn_device_h_l442_c12_284b_right <= VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output := BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l425_c12_8188] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l425_c12_8188_left <= VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_left;
     BIN_OP_EQ_uxn_device_h_l425_c12_8188_right <= VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output := BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output;

     -- BIN_OP_EQ[uxn_device_h_l397_c12_d947] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l397_c12_d947_left <= VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_left;
     BIN_OP_EQ_uxn_device_h_l397_c12_d947_right <= VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output := BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output;

     -- BIN_OP_EQ[uxn_device_h_l431_c12_0cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left <= VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_left;
     BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right <= VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output := BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l371_c7_64a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left <= VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_left;
     BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right <= VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output := BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l404_c11_3446] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l404_c11_3446_left <= VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_left;
     BIN_OP_EQ_uxn_device_h_l404_c11_3446_right <= VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output := BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output;

     -- BIN_OP_EQ[uxn_device_h_l421_c11_5b26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left <= VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_left;
     BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right <= VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output := BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output;

     -- BIN_OP_EQ[uxn_device_h_l387_c11_6f6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left <= VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_left;
     BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right <= VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output := BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l363_c6_49a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left <= VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_left;
     BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right <= VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output := BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;

     -- CONST_SR_4[uxn_device_h_l370_c25_b6e5] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l370_c25_b6e5_x <= VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output := CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l417_c12_13c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left <= VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_left;
     BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right <= VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output := BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output;

     -- BIN_OP_AND[uxn_device_h_l366_c25_69e6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l366_c25_69e6_left <= VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_left;
     BIN_OP_AND_uxn_device_h_l366_c25_69e6_right <= VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output := BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l445_c12_b5b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left <= VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_left;
     BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right <= VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output := BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l439_c7_712c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l439_c7_712c_left <= VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_left;
     BIN_OP_EQ_uxn_device_h_l439_c7_712c_right <= VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output := BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l451_c12_6bec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left <= VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_left;
     BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right <= VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output := BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output;

     -- BIN_OP_EQ[uxn_device_h_l369_c11_6896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l369_c11_6896_left <= VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_left;
     BIN_OP_EQ_uxn_device_h_l369_c11_6896_right <= VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output := BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output;

     -- BIN_OP_EQ[uxn_device_h_l374_c12_b40f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left <= VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_left;
     BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right <= VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output := BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l400_c12_0503] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l400_c12_0503_left <= VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_left;
     BIN_OP_EQ_uxn_device_h_l400_c12_0503_right <= VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output := BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output;

     -- BIN_OP_EQ[uxn_device_h_l391_c12_5f52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left <= VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_left;
     BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right <= VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output := BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l438_c11_fdf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left <= VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_left;
     BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right <= VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output := BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l434_c12_538f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l434_c12_538f_left <= VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_left;
     BIN_OP_EQ_uxn_device_h_l434_c12_538f_right <= VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output := BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l422_c7_599e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l422_c7_599e_left <= VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_left;
     BIN_OP_EQ_uxn_device_h_l422_c7_599e_right <= VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output := BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output;

     -- Submodule level 1
     VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iftrue := VAR_BIN_OP_AND_uxn_device_h_l365_c17_396b_return_output;
     VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue := VAR_BIN_OP_AND_uxn_device_h_l366_c25_69e6_return_output;
     VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_right := VAR_BIN_OP_AND_uxn_device_h_l370_c52_9de6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;
     VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;
     VAR_device_port_MUX_uxn_device_h_l363_c2_01de_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;
     VAR_result_MUX_uxn_device_h_l363_c2_01de_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c6_49a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output;
     VAR_result_MUX_uxn_device_h_l369_c7_072e_cond := VAR_BIN_OP_EQ_uxn_device_h_l369_c11_6896_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output;
     VAR_result_MUX_uxn_device_h_l371_c3_0a33_cond := VAR_BIN_OP_EQ_uxn_device_h_l371_c7_64a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond := VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output;
     VAR_result_MUX_uxn_device_h_l374_c8_78b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l374_c12_b40f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond := VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output;
     VAR_result_MUX_uxn_device_h_l377_c8_933d_cond := VAR_BIN_OP_EQ_uxn_device_h_l377_c12_1b40_return_output;
     VAR_result_MUX_uxn_device_h_l380_c8_104a_cond := VAR_BIN_OP_EQ_uxn_device_h_l380_c12_53a4_return_output;
     VAR_result_MUX_uxn_device_h_l383_c8_1e41_cond := VAR_BIN_OP_EQ_uxn_device_h_l383_c12_e961_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond := VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond := VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output;
     VAR_result_MUX_uxn_device_h_l387_c7_8a7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l387_c11_6f6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond := VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output;
     VAR_result_MUX_uxn_device_h_l388_c3_9bb5_cond := VAR_BIN_OP_EQ_uxn_device_h_l388_c7_64d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond := VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output;
     VAR_result_MUX_uxn_device_h_l391_c8_b400_cond := VAR_BIN_OP_EQ_uxn_device_h_l391_c12_5f52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond := VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output;
     VAR_result_MUX_uxn_device_h_l394_c8_ef46_cond := VAR_BIN_OP_EQ_uxn_device_h_l394_c12_4d62_return_output;
     VAR_result_MUX_uxn_device_h_l397_c8_87f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l397_c12_d947_return_output;
     VAR_result_MUX_uxn_device_h_l400_c8_1bae_cond := VAR_BIN_OP_EQ_uxn_device_h_l400_c12_0503_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond := VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output;
     VAR_result_MUX_uxn_device_h_l404_c7_bfce_cond := VAR_BIN_OP_EQ_uxn_device_h_l404_c11_3446_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond := VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output;
     VAR_result_MUX_uxn_device_h_l405_c3_3211_cond := VAR_BIN_OP_EQ_uxn_device_h_l405_c7_7206_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond := VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output;
     VAR_result_MUX_uxn_device_h_l408_c8_084c_cond := VAR_BIN_OP_EQ_uxn_device_h_l408_c12_b43f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond := VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output;
     VAR_result_MUX_uxn_device_h_l411_c8_7229_cond := VAR_BIN_OP_EQ_uxn_device_h_l411_c12_d5fe_return_output;
     VAR_result_MUX_uxn_device_h_l414_c8_4234_cond := VAR_BIN_OP_EQ_uxn_device_h_l414_c12_38c9_return_output;
     VAR_result_MUX_uxn_device_h_l417_c8_7a1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l417_c12_13c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond := VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output;
     VAR_result_MUX_uxn_device_h_l421_c7_ba9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l421_c11_5b26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output;
     VAR_result_MUX_uxn_device_h_l422_c3_e3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l422_c7_599e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond := VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output;
     VAR_result_MUX_uxn_device_h_l425_c8_35a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l425_c12_8188_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond := VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output;
     VAR_result_MUX_uxn_device_h_l428_c8_b189_cond := VAR_BIN_OP_EQ_uxn_device_h_l428_c12_e233_return_output;
     VAR_result_MUX_uxn_device_h_l431_c8_6fb9_cond := VAR_BIN_OP_EQ_uxn_device_h_l431_c12_0cbb_return_output;
     VAR_result_MUX_uxn_device_h_l434_c8_7e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l434_c12_538f_return_output;
     VAR_result_MUX_uxn_device_h_l438_c7_d2fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l438_c11_fdf6_return_output;
     VAR_result_MUX_uxn_device_h_l439_c3_4e03_cond := VAR_BIN_OP_EQ_uxn_device_h_l439_c7_712c_return_output;
     VAR_result_MUX_uxn_device_h_l442_c8_f5c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l442_c12_284b_return_output;
     VAR_result_MUX_uxn_device_h_l445_c8_3fa9_cond := VAR_BIN_OP_EQ_uxn_device_h_l445_c12_b5b8_return_output;
     VAR_result_MUX_uxn_device_h_l448_c8_235c_cond := VAR_BIN_OP_EQ_uxn_device_h_l448_c12_3f81_return_output;
     VAR_result_MUX_uxn_device_h_l451_c8_109a_cond := VAR_BIN_OP_EQ_uxn_device_h_l451_c12_6bec_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l370_c25_b6e5_return_output, 4);
     -- device_base_address_MUX[uxn_device_h_l363_c2_01de] LATENCY=0
     -- Inputs
     device_base_address_MUX_uxn_device_h_l363_c2_01de_cond <= VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_cond;
     device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue <= VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iftrue;
     device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse <= VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_iffalse;
     -- Outputs
     VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output := device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output;

     -- result_MUX[uxn_device_h_l451_c8_109a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l451_c8_109a_cond <= VAR_result_MUX_uxn_device_h_l451_c8_109a_cond;
     result_MUX_uxn_device_h_l451_c8_109a_iftrue <= VAR_result_MUX_uxn_device_h_l451_c8_109a_iftrue;
     result_MUX_uxn_device_h_l451_c8_109a_iffalse <= VAR_result_MUX_uxn_device_h_l451_c8_109a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l451_c8_109a_return_output := result_MUX_uxn_device_h_l451_c8_109a_return_output;

     -- result_MUX[uxn_device_h_l434_c8_7e3b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l434_c8_7e3b_cond <= VAR_result_MUX_uxn_device_h_l434_c8_7e3b_cond;
     result_MUX_uxn_device_h_l434_c8_7e3b_iftrue <= VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iftrue;
     result_MUX_uxn_device_h_l434_c8_7e3b_iffalse <= VAR_result_MUX_uxn_device_h_l434_c8_7e3b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l434_c8_7e3b_return_output := result_MUX_uxn_device_h_l434_c8_7e3b_return_output;

     -- result_MUX[uxn_device_h_l400_c8_1bae] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l400_c8_1bae_cond <= VAR_result_MUX_uxn_device_h_l400_c8_1bae_cond;
     result_MUX_uxn_device_h_l400_c8_1bae_iftrue <= VAR_result_MUX_uxn_device_h_l400_c8_1bae_iftrue;
     result_MUX_uxn_device_h_l400_c8_1bae_iffalse <= VAR_result_MUX_uxn_device_h_l400_c8_1bae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l400_c8_1bae_return_output := result_MUX_uxn_device_h_l400_c8_1bae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l363_c1_7d30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output;

     -- result_MUX[uxn_device_h_l417_c8_7a1f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l417_c8_7a1f_cond <= VAR_result_MUX_uxn_device_h_l417_c8_7a1f_cond;
     result_MUX_uxn_device_h_l417_c8_7a1f_iftrue <= VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iftrue;
     result_MUX_uxn_device_h_l417_c8_7a1f_iffalse <= VAR_result_MUX_uxn_device_h_l417_c8_7a1f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l417_c8_7a1f_return_output := result_MUX_uxn_device_h_l417_c8_7a1f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l369_c7_072e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l370_c15_5fef] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output;

     -- device_port_MUX[uxn_device_h_l363_c2_01de] LATENCY=0
     -- Inputs
     device_port_MUX_uxn_device_h_l363_c2_01de_cond <= VAR_device_port_MUX_uxn_device_h_l363_c2_01de_cond;
     device_port_MUX_uxn_device_h_l363_c2_01de_iftrue <= VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iftrue;
     device_port_MUX_uxn_device_h_l363_c2_01de_iffalse <= VAR_device_port_MUX_uxn_device_h_l363_c2_01de_iffalse;
     -- Outputs
     VAR_device_port_MUX_uxn_device_h_l363_c2_01de_return_output := device_port_MUX_uxn_device_h_l363_c2_01de_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c7_072e_return_output;
     VAR_poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l363_c1_7d30_return_output;
     VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l370_c15_5fef_return_output;
     REG_VAR_device_base_address := VAR_device_base_address_MUX_uxn_device_h_l363_c2_01de_return_output;
     REG_VAR_device_port := VAR_device_port_MUX_uxn_device_h_l363_c2_01de_return_output;
     VAR_result_MUX_uxn_device_h_l397_c8_87f0_iffalse := VAR_result_MUX_uxn_device_h_l400_c8_1bae_return_output;
     VAR_result_MUX_uxn_device_h_l414_c8_4234_iffalse := VAR_result_MUX_uxn_device_h_l417_c8_7a1f_return_output;
     VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iffalse := VAR_result_MUX_uxn_device_h_l434_c8_7e3b_return_output;
     VAR_result_MUX_uxn_device_h_l448_c8_235c_iffalse := VAR_result_MUX_uxn_device_h_l451_c8_109a_return_output;
     -- result_MUX[uxn_device_h_l414_c8_4234] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l414_c8_4234_cond <= VAR_result_MUX_uxn_device_h_l414_c8_4234_cond;
     result_MUX_uxn_device_h_l414_c8_4234_iftrue <= VAR_result_MUX_uxn_device_h_l414_c8_4234_iftrue;
     result_MUX_uxn_device_h_l414_c8_4234_iffalse <= VAR_result_MUX_uxn_device_h_l414_c8_4234_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l414_c8_4234_return_output := result_MUX_uxn_device_h_l414_c8_4234_return_output;

     -- result_MUX[uxn_device_h_l448_c8_235c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l448_c8_235c_cond <= VAR_result_MUX_uxn_device_h_l448_c8_235c_cond;
     result_MUX_uxn_device_h_l448_c8_235c_iftrue <= VAR_result_MUX_uxn_device_h_l448_c8_235c_iftrue;
     result_MUX_uxn_device_h_l448_c8_235c_iffalse <= VAR_result_MUX_uxn_device_h_l448_c8_235c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l448_c8_235c_return_output := result_MUX_uxn_device_h_l448_c8_235c_return_output;

     -- result_MUX[uxn_device_h_l431_c8_6fb9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l431_c8_6fb9_cond <= VAR_result_MUX_uxn_device_h_l431_c8_6fb9_cond;
     result_MUX_uxn_device_h_l431_c8_6fb9_iftrue <= VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iftrue;
     result_MUX_uxn_device_h_l431_c8_6fb9_iffalse <= VAR_result_MUX_uxn_device_h_l431_c8_6fb9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l431_c8_6fb9_return_output := result_MUX_uxn_device_h_l431_c8_6fb9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l387_c7_8a7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output;

     -- poke_dev[uxn_device_h_l367_c3_a361] LATENCY=0
     -- Clock enable
     poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE <= VAR_poke_dev_uxn_device_h_l367_c3_a361_CLOCK_ENABLE;
     -- Inputs
     poke_dev_uxn_device_h_l367_c3_a361_address <= VAR_poke_dev_uxn_device_h_l367_c3_a361_address;
     poke_dev_uxn_device_h_l367_c3_a361_value <= VAR_poke_dev_uxn_device_h_l367_c3_a361_value;
     -- Outputs

     -- result_MUX[uxn_device_h_l397_c8_87f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l397_c8_87f0_cond <= VAR_result_MUX_uxn_device_h_l397_c8_87f0_cond;
     result_MUX_uxn_device_h_l397_c8_87f0_iftrue <= VAR_result_MUX_uxn_device_h_l397_c8_87f0_iftrue;
     result_MUX_uxn_device_h_l397_c8_87f0_iffalse <= VAR_result_MUX_uxn_device_h_l397_c8_87f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l397_c8_87f0_return_output := result_MUX_uxn_device_h_l397_c8_87f0_return_output;

     -- BIN_OP_SR[uxn_device_h_l370_c15_a440] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l370_c15_a440_left <= VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_left;
     BIN_OP_SR_uxn_device_h_l370_c15_a440_right <= VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output := BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l369_c1_9f3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_left := VAR_BIN_OP_SR_uxn_device_h_l370_c15_a440_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c7_8a7f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l369_c1_9f3c_return_output;
     VAR_result_MUX_uxn_device_h_l394_c8_ef46_iffalse := VAR_result_MUX_uxn_device_h_l397_c8_87f0_return_output;
     VAR_result_MUX_uxn_device_h_l411_c8_7229_iffalse := VAR_result_MUX_uxn_device_h_l414_c8_4234_return_output;
     VAR_result_MUX_uxn_device_h_l428_c8_b189_iffalse := VAR_result_MUX_uxn_device_h_l431_c8_6fb9_return_output;
     VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iffalse := VAR_result_MUX_uxn_device_h_l448_c8_235c_return_output;
     -- result_MUX[uxn_device_h_l445_c8_3fa9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l445_c8_3fa9_cond <= VAR_result_MUX_uxn_device_h_l445_c8_3fa9_cond;
     result_MUX_uxn_device_h_l445_c8_3fa9_iftrue <= VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iftrue;
     result_MUX_uxn_device_h_l445_c8_3fa9_iffalse <= VAR_result_MUX_uxn_device_h_l445_c8_3fa9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l445_c8_3fa9_return_output := result_MUX_uxn_device_h_l445_c8_3fa9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l387_c1_6354] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output;

     -- BIN_OP_AND[uxn_device_h_l370_c15_b085] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l370_c15_b085_left <= VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_left;
     BIN_OP_AND_uxn_device_h_l370_c15_b085_right <= VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output := BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l404_c7_bfce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l374_c8_78b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output;

     -- Submodule level 4
     VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr := VAR_BIN_OP_AND_uxn_device_h_l370_c15_b085_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l374_c8_78b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c7_bfce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l387_c1_6354_return_output;
     VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iffalse := VAR_result_MUX_uxn_device_h_l445_c8_3fa9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l404_c1_1184] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l421_c7_ba9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l391_c8_b400] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output;

     -- result_MUX[uxn_device_h_l442_c8_f5c8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l442_c8_f5c8_cond <= VAR_result_MUX_uxn_device_h_l442_c8_f5c8_cond;
     result_MUX_uxn_device_h_l442_c8_f5c8_iftrue <= VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iftrue;
     result_MUX_uxn_device_h_l442_c8_f5c8_iffalse <= VAR_result_MUX_uxn_device_h_l442_c8_f5c8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l442_c8_f5c8_return_output := result_MUX_uxn_device_h_l442_c8_f5c8_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l370_c15_a427] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output := UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l377_c8_933d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c8_933d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l391_c8_b400_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c7_ba9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l404_c1_1184_return_output;
     VAR_result_uxn_device_h_l370_c3_bc94 := resize(VAR_UNARY_OP_NOT_uxn_device_h_l370_c15_a427_return_output, 1);
     VAR_result_MUX_uxn_device_h_l439_c3_4e03_iffalse := VAR_result_MUX_uxn_device_h_l442_c8_f5c8_return_output;
     VAR_result_MUX_uxn_device_h_l383_c8_1e41_iffalse := VAR_result_uxn_device_h_l370_c3_bc94;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l394_c8_ef46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output;

     -- result_MUX[uxn_device_h_l383_c8_1e41] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l383_c8_1e41_cond <= VAR_result_MUX_uxn_device_h_l383_c8_1e41_cond;
     result_MUX_uxn_device_h_l383_c8_1e41_iftrue <= VAR_result_MUX_uxn_device_h_l383_c8_1e41_iftrue;
     result_MUX_uxn_device_h_l383_c8_1e41_iffalse <= VAR_result_MUX_uxn_device_h_l383_c8_1e41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l383_c8_1e41_return_output := result_MUX_uxn_device_h_l383_c8_1e41_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l408_c8_084c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l421_c1_edab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l377_c1_ab24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output;

     -- result_MUX[uxn_device_h_l439_c3_4e03] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l439_c3_4e03_cond <= VAR_result_MUX_uxn_device_h_l439_c3_4e03_cond;
     result_MUX_uxn_device_h_l439_c3_4e03_iftrue <= VAR_result_MUX_uxn_device_h_l439_c3_4e03_iftrue;
     result_MUX_uxn_device_h_l439_c3_4e03_iffalse <= VAR_result_MUX_uxn_device_h_l439_c3_4e03_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l439_c3_4e03_return_output := result_MUX_uxn_device_h_l439_c3_4e03_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c8_ef46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l408_c8_084c_return_output;
     VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l377_c1_ab24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l421_c1_edab_return_output;
     VAR_result_MUX_uxn_device_h_l380_c8_104a_iffalse := VAR_result_MUX_uxn_device_h_l383_c8_1e41_return_output;
     VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iftrue := VAR_result_MUX_uxn_device_h_l439_c3_4e03_return_output;
     -- result_MUX[uxn_device_h_l438_c7_d2fc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l438_c7_d2fc_cond <= VAR_result_MUX_uxn_device_h_l438_c7_d2fc_cond;
     result_MUX_uxn_device_h_l438_c7_d2fc_iftrue <= VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iftrue;
     result_MUX_uxn_device_h_l438_c7_d2fc_iffalse <= VAR_result_MUX_uxn_device_h_l438_c7_d2fc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l438_c7_d2fc_return_output := result_MUX_uxn_device_h_l438_c7_d2fc_return_output;

     -- screen_deo_phased[uxn_device_h_l378_c13_8163] LATENCY=0
     -- Clock enable
     screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE <= VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_CLOCK_ENABLE;
     -- Inputs
     screen_deo_phased_uxn_device_h_l378_c13_8163_phase <= VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_phase;
     screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address <= VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_base_address;
     screen_deo_phased_uxn_device_h_l378_c13_8163_device_port <= VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_device_port;
     -- Outputs
     VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_return_output := screen_deo_phased_uxn_device_h_l378_c13_8163_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l411_c8_7229] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output;

     -- result_MUX[uxn_device_h_l380_c8_104a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l380_c8_104a_cond <= VAR_result_MUX_uxn_device_h_l380_c8_104a_cond;
     result_MUX_uxn_device_h_l380_c8_104a_iftrue <= VAR_result_MUX_uxn_device_h_l380_c8_104a_iftrue;
     result_MUX_uxn_device_h_l380_c8_104a_iffalse <= VAR_result_MUX_uxn_device_h_l380_c8_104a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l380_c8_104a_return_output := result_MUX_uxn_device_h_l380_c8_104a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l425_c8_35a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l394_c1_7f47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output;

     -- Submodule level 7
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c8_7229_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l425_c8_35a6_return_output;
     VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l394_c1_7f47_return_output;
     VAR_result_MUX_uxn_device_h_l377_c8_933d_iffalse := VAR_result_MUX_uxn_device_h_l380_c8_104a_return_output;
     VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iffalse := VAR_result_MUX_uxn_device_h_l438_c7_d2fc_return_output;
     VAR_result_MUX_uxn_device_h_l377_c8_933d_iftrue := VAR_screen_deo_phased_uxn_device_h_l378_c13_8163_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l411_c1_d366] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output;

     -- result_MUX[uxn_device_h_l377_c8_933d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l377_c8_933d_cond <= VAR_result_MUX_uxn_device_h_l377_c8_933d_cond;
     result_MUX_uxn_device_h_l377_c8_933d_iftrue <= VAR_result_MUX_uxn_device_h_l377_c8_933d_iftrue;
     result_MUX_uxn_device_h_l377_c8_933d_iffalse <= VAR_result_MUX_uxn_device_h_l377_c8_933d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l377_c8_933d_return_output := result_MUX_uxn_device_h_l377_c8_933d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l428_c8_b189] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output;

     -- screen_deo_phased[uxn_device_h_l395_c13_288d] LATENCY=0
     -- Clock enable
     screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE <= VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_CLOCK_ENABLE;
     -- Inputs
     screen_deo_phased_uxn_device_h_l395_c13_288d_phase <= VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_phase;
     screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address <= VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_base_address;
     screen_deo_phased_uxn_device_h_l395_c13_288d_device_port <= VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_device_port;
     -- Outputs
     VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_return_output := screen_deo_phased_uxn_device_h_l395_c13_288d_return_output;

     -- Submodule level 8
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c8_b189_return_output;
     VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l411_c1_d366_return_output;
     VAR_result_MUX_uxn_device_h_l374_c8_78b1_iffalse := VAR_result_MUX_uxn_device_h_l377_c8_933d_return_output;
     VAR_result_MUX_uxn_device_h_l394_c8_ef46_iftrue := VAR_screen_deo_phased_uxn_device_h_l395_c13_288d_return_output;
     -- result_MUX[uxn_device_h_l374_c8_78b1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l374_c8_78b1_cond <= VAR_result_MUX_uxn_device_h_l374_c8_78b1_cond;
     result_MUX_uxn_device_h_l374_c8_78b1_iftrue <= VAR_result_MUX_uxn_device_h_l374_c8_78b1_iftrue;
     result_MUX_uxn_device_h_l374_c8_78b1_iffalse <= VAR_result_MUX_uxn_device_h_l374_c8_78b1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l374_c8_78b1_return_output := result_MUX_uxn_device_h_l374_c8_78b1_return_output;

     -- screen_deo_phased[uxn_device_h_l412_c13_11ce] LATENCY=0
     -- Clock enable
     screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE <= VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_CLOCK_ENABLE;
     -- Inputs
     screen_deo_phased_uxn_device_h_l412_c13_11ce_phase <= VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_phase;
     screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address <= VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_base_address;
     screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port <= VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_device_port;
     -- Outputs
     VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output := screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l428_c1_390a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output;

     -- result_MUX[uxn_device_h_l394_c8_ef46] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l394_c8_ef46_cond <= VAR_result_MUX_uxn_device_h_l394_c8_ef46_cond;
     result_MUX_uxn_device_h_l394_c8_ef46_iftrue <= VAR_result_MUX_uxn_device_h_l394_c8_ef46_iftrue;
     result_MUX_uxn_device_h_l394_c8_ef46_iffalse <= VAR_result_MUX_uxn_device_h_l394_c8_ef46_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l394_c8_ef46_return_output := result_MUX_uxn_device_h_l394_c8_ef46_return_output;

     -- Submodule level 9
     VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l428_c1_390a_return_output;
     VAR_result_MUX_uxn_device_h_l371_c3_0a33_iffalse := VAR_result_MUX_uxn_device_h_l374_c8_78b1_return_output;
     VAR_result_MUX_uxn_device_h_l391_c8_b400_iffalse := VAR_result_MUX_uxn_device_h_l394_c8_ef46_return_output;
     VAR_result_MUX_uxn_device_h_l411_c8_7229_iftrue := VAR_screen_deo_phased_uxn_device_h_l412_c13_11ce_return_output;
     -- result_MUX[uxn_device_h_l411_c8_7229] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l411_c8_7229_cond <= VAR_result_MUX_uxn_device_h_l411_c8_7229_cond;
     result_MUX_uxn_device_h_l411_c8_7229_iftrue <= VAR_result_MUX_uxn_device_h_l411_c8_7229_iftrue;
     result_MUX_uxn_device_h_l411_c8_7229_iffalse <= VAR_result_MUX_uxn_device_h_l411_c8_7229_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l411_c8_7229_return_output := result_MUX_uxn_device_h_l411_c8_7229_return_output;

     -- screen_deo_phased[uxn_device_h_l429_c13_a9af] LATENCY=0
     -- Clock enable
     screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE <= VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_CLOCK_ENABLE;
     -- Inputs
     screen_deo_phased_uxn_device_h_l429_c13_a9af_phase <= VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_phase;
     screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address <= VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_base_address;
     screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port <= VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_device_port;
     -- Outputs
     VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output := screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output;

     -- result_MUX[uxn_device_h_l391_c8_b400] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l391_c8_b400_cond <= VAR_result_MUX_uxn_device_h_l391_c8_b400_cond;
     result_MUX_uxn_device_h_l391_c8_b400_iftrue <= VAR_result_MUX_uxn_device_h_l391_c8_b400_iftrue;
     result_MUX_uxn_device_h_l391_c8_b400_iffalse <= VAR_result_MUX_uxn_device_h_l391_c8_b400_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l391_c8_b400_return_output := result_MUX_uxn_device_h_l391_c8_b400_return_output;

     -- result_MUX[uxn_device_h_l371_c3_0a33] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l371_c3_0a33_cond <= VAR_result_MUX_uxn_device_h_l371_c3_0a33_cond;
     result_MUX_uxn_device_h_l371_c3_0a33_iftrue <= VAR_result_MUX_uxn_device_h_l371_c3_0a33_iftrue;
     result_MUX_uxn_device_h_l371_c3_0a33_iffalse <= VAR_result_MUX_uxn_device_h_l371_c3_0a33_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l371_c3_0a33_return_output := result_MUX_uxn_device_h_l371_c3_0a33_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l369_c7_072e_iftrue := VAR_result_MUX_uxn_device_h_l371_c3_0a33_return_output;
     VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iffalse := VAR_result_MUX_uxn_device_h_l391_c8_b400_return_output;
     VAR_result_MUX_uxn_device_h_l408_c8_084c_iffalse := VAR_result_MUX_uxn_device_h_l411_c8_7229_return_output;
     VAR_result_MUX_uxn_device_h_l428_c8_b189_iftrue := VAR_screen_deo_phased_uxn_device_h_l429_c13_a9af_return_output;
     -- result_MUX[uxn_device_h_l428_c8_b189] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l428_c8_b189_cond <= VAR_result_MUX_uxn_device_h_l428_c8_b189_cond;
     result_MUX_uxn_device_h_l428_c8_b189_iftrue <= VAR_result_MUX_uxn_device_h_l428_c8_b189_iftrue;
     result_MUX_uxn_device_h_l428_c8_b189_iffalse <= VAR_result_MUX_uxn_device_h_l428_c8_b189_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l428_c8_b189_return_output := result_MUX_uxn_device_h_l428_c8_b189_return_output;

     -- result_MUX[uxn_device_h_l408_c8_084c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l408_c8_084c_cond <= VAR_result_MUX_uxn_device_h_l408_c8_084c_cond;
     result_MUX_uxn_device_h_l408_c8_084c_iftrue <= VAR_result_MUX_uxn_device_h_l408_c8_084c_iftrue;
     result_MUX_uxn_device_h_l408_c8_084c_iffalse <= VAR_result_MUX_uxn_device_h_l408_c8_084c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l408_c8_084c_return_output := result_MUX_uxn_device_h_l408_c8_084c_return_output;

     -- result_MUX[uxn_device_h_l388_c3_9bb5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l388_c3_9bb5_cond <= VAR_result_MUX_uxn_device_h_l388_c3_9bb5_cond;
     result_MUX_uxn_device_h_l388_c3_9bb5_iftrue <= VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iftrue;
     result_MUX_uxn_device_h_l388_c3_9bb5_iffalse <= VAR_result_MUX_uxn_device_h_l388_c3_9bb5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l388_c3_9bb5_return_output := result_MUX_uxn_device_h_l388_c3_9bb5_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iftrue := VAR_result_MUX_uxn_device_h_l388_c3_9bb5_return_output;
     VAR_result_MUX_uxn_device_h_l405_c3_3211_iffalse := VAR_result_MUX_uxn_device_h_l408_c8_084c_return_output;
     VAR_result_MUX_uxn_device_h_l425_c8_35a6_iffalse := VAR_result_MUX_uxn_device_h_l428_c8_b189_return_output;
     -- result_MUX[uxn_device_h_l405_c3_3211] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l405_c3_3211_cond <= VAR_result_MUX_uxn_device_h_l405_c3_3211_cond;
     result_MUX_uxn_device_h_l405_c3_3211_iftrue <= VAR_result_MUX_uxn_device_h_l405_c3_3211_iftrue;
     result_MUX_uxn_device_h_l405_c3_3211_iffalse <= VAR_result_MUX_uxn_device_h_l405_c3_3211_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l405_c3_3211_return_output := result_MUX_uxn_device_h_l405_c3_3211_return_output;

     -- result_MUX[uxn_device_h_l425_c8_35a6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l425_c8_35a6_cond <= VAR_result_MUX_uxn_device_h_l425_c8_35a6_cond;
     result_MUX_uxn_device_h_l425_c8_35a6_iftrue <= VAR_result_MUX_uxn_device_h_l425_c8_35a6_iftrue;
     result_MUX_uxn_device_h_l425_c8_35a6_iffalse <= VAR_result_MUX_uxn_device_h_l425_c8_35a6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l425_c8_35a6_return_output := result_MUX_uxn_device_h_l425_c8_35a6_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_device_h_l404_c7_bfce_iftrue := VAR_result_MUX_uxn_device_h_l405_c3_3211_return_output;
     VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iffalse := VAR_result_MUX_uxn_device_h_l425_c8_35a6_return_output;
     -- result_MUX[uxn_device_h_l422_c3_e3ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l422_c3_e3ee_cond <= VAR_result_MUX_uxn_device_h_l422_c3_e3ee_cond;
     result_MUX_uxn_device_h_l422_c3_e3ee_iftrue <= VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iftrue;
     result_MUX_uxn_device_h_l422_c3_e3ee_iffalse <= VAR_result_MUX_uxn_device_h_l422_c3_e3ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l422_c3_e3ee_return_output := result_MUX_uxn_device_h_l422_c3_e3ee_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iftrue := VAR_result_MUX_uxn_device_h_l422_c3_e3ee_return_output;
     -- result_MUX[uxn_device_h_l421_c7_ba9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l421_c7_ba9a_cond <= VAR_result_MUX_uxn_device_h_l421_c7_ba9a_cond;
     result_MUX_uxn_device_h_l421_c7_ba9a_iftrue <= VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iftrue;
     result_MUX_uxn_device_h_l421_c7_ba9a_iffalse <= VAR_result_MUX_uxn_device_h_l421_c7_ba9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l421_c7_ba9a_return_output := result_MUX_uxn_device_h_l421_c7_ba9a_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l404_c7_bfce_iffalse := VAR_result_MUX_uxn_device_h_l421_c7_ba9a_return_output;
     -- result_MUX[uxn_device_h_l404_c7_bfce] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l404_c7_bfce_cond <= VAR_result_MUX_uxn_device_h_l404_c7_bfce_cond;
     result_MUX_uxn_device_h_l404_c7_bfce_iftrue <= VAR_result_MUX_uxn_device_h_l404_c7_bfce_iftrue;
     result_MUX_uxn_device_h_l404_c7_bfce_iffalse <= VAR_result_MUX_uxn_device_h_l404_c7_bfce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l404_c7_bfce_return_output := result_MUX_uxn_device_h_l404_c7_bfce_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iffalse := VAR_result_MUX_uxn_device_h_l404_c7_bfce_return_output;
     -- result_MUX[uxn_device_h_l387_c7_8a7f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l387_c7_8a7f_cond <= VAR_result_MUX_uxn_device_h_l387_c7_8a7f_cond;
     result_MUX_uxn_device_h_l387_c7_8a7f_iftrue <= VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iftrue;
     result_MUX_uxn_device_h_l387_c7_8a7f_iffalse <= VAR_result_MUX_uxn_device_h_l387_c7_8a7f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l387_c7_8a7f_return_output := result_MUX_uxn_device_h_l387_c7_8a7f_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l369_c7_072e_iffalse := VAR_result_MUX_uxn_device_h_l387_c7_8a7f_return_output;
     -- result_MUX[uxn_device_h_l369_c7_072e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l369_c7_072e_cond <= VAR_result_MUX_uxn_device_h_l369_c7_072e_cond;
     result_MUX_uxn_device_h_l369_c7_072e_iftrue <= VAR_result_MUX_uxn_device_h_l369_c7_072e_iftrue;
     result_MUX_uxn_device_h_l369_c7_072e_iffalse <= VAR_result_MUX_uxn_device_h_l369_c7_072e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l369_c7_072e_return_output := result_MUX_uxn_device_h_l369_c7_072e_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l363_c2_01de_iffalse := VAR_result_MUX_uxn_device_h_l369_c7_072e_return_output;
     -- result_MUX[uxn_device_h_l363_c2_01de] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l363_c2_01de_cond <= VAR_result_MUX_uxn_device_h_l363_c2_01de_cond;
     result_MUX_uxn_device_h_l363_c2_01de_iftrue <= VAR_result_MUX_uxn_device_h_l363_c2_01de_iftrue;
     result_MUX_uxn_device_h_l363_c2_01de_iffalse <= VAR_result_MUX_uxn_device_h_l363_c2_01de_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l363_c2_01de_return_output := result_MUX_uxn_device_h_l363_c2_01de_return_output;

     -- Submodule level 18
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l363_c2_01de_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l363_c2_01de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_deo_mask <= REG_VAR_deo_mask;
REG_COMB_device_port <= REG_VAR_device_port;
REG_COMB_device_base_address <= REG_VAR_device_base_address;
REG_COMB_port_range_palette_lo <= REG_VAR_port_range_palette_lo;
REG_COMB_port_range_palette_hi <= REG_VAR_port_range_palette_hi;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     deo_mask <= REG_COMB_deo_mask;
     device_port <= REG_COMB_device_port;
     device_base_address <= REG_COMB_device_base_address;
     port_range_palette_lo <= REG_COMB_port_range_palette_lo;
     port_range_palette_hi <= REG_COMB_port_range_palette_hi;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
