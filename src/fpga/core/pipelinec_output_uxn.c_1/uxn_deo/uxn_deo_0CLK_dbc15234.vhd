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
-- Submodules: 36
entity uxn_deo_0CLK_dbc15234 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr : in unsigned(7 downto 0));
end uxn_deo_0CLK_dbc15234;
architecture arch of uxn_deo_0CLK_dbc15234 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device_port : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_index : unsigned(7 downto 0) := to_unsigned(0, 8);
signal port_range_palette_lo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal port_range_palette_hi : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_device_port : unsigned(7 downto 0);
signal REG_COMB_device_index : unsigned(7 downto 0);
signal REG_COMB_port_range_palette_lo : unsigned(0 downto 0);
signal REG_COMB_port_range_palette_hi : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l110_c16_7be2]
signal BIN_OP_AND_uxn_device_h_l110_c16_7be2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l110_c16_7be2_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l111_c17_c617]
signal BIN_OP_AND_uxn_device_h_l111_c17_c617_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l111_c17_c617_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l112_c6_320a]
signal BIN_OP_EQ_uxn_device_h_l112_c6_320a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c6_320a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_d65e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c7_fae6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l112_c2_1243]
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l112_c2_1243]
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l113_c14_15e6]
signal device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l113_c14_15e6_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l113_c14_15e6_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l113_c3_f1b8]
signal system_deo_uxn_device_h_l113_c3_f1b8_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l113_c3_f1b8_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l114_c27_ba46]
signal BIN_OP_GT_uxn_device_h_l114_c27_ba46_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l114_c27_ba46_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l114_c27_5613]
signal MUX_uxn_device_h_l114_c27_5613_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_5613_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_5613_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_5613_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l115_c27_ee1b]
signal BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l115_c27_099e]
signal MUX_uxn_device_h_l115_c27_099e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_099e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_099e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_099e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l116_c7_4b30]
signal BIN_OP_AND_uxn_device_h_l116_c7_4b30_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l116_c7_4b30_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c1_01c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l125_c19_5339]
signal device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l125_c19_5339_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l125_c19_5339_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l125_c4_4514]
signal screen_palette_uxn_device_h_l125_c4_4514_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l128_c11_f48f]
signal BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c1_a6ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c7_8e93]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l129_c15_bd14]
signal device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l129_c15_bd14_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l129_c15_bd14_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l129_c3_2c2c]
signal console_deo_uxn_device_h_l129_c3_2c2c_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l129_c3_2c2c_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c11_1f59]
signal BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c1_4cc8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_b3b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l132_c14_c205]
signal device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l132_c14_c205_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l132_c14_c205_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l132_c3_becf]
signal screen_deo_uxn_device_h_l132_c3_becf_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l132_c3_becf_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_079b]
signal BIN_OP_EQ_uxn_device_h_l134_c11_079b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_079b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c1_d78f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_a00f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l135_c15_dc50]
signal device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l135_c15_dc50_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l135_c15_dc50_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l135_c3_3e1c]
signal file_deo_uxn_device_h_l135_c3_3e1c_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l135_c3_3e1c_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l135_c3_3e1c_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_b30c]
signal BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c1_4264]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l138_c15_eda8]
signal device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l138_c15_eda8_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l138_c15_eda8_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l138_c3_53a6]
signal file_deo_uxn_device_h_l138_c3_53a6_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l138_c3_53a6_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l138_c3_53a6_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l110_c16_7be2
BIN_OP_AND_uxn_device_h_l110_c16_7be2 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l110_c16_7be2_left,
BIN_OP_AND_uxn_device_h_l110_c16_7be2_right,
BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output);

-- BIN_OP_AND_uxn_device_h_l111_c17_c617
BIN_OP_AND_uxn_device_h_l111_c17_c617 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l111_c17_c617_left,
BIN_OP_AND_uxn_device_h_l111_c17_c617_right,
BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output);

-- BIN_OP_EQ_uxn_device_h_l112_c6_320a
BIN_OP_EQ_uxn_device_h_l112_c6_320a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l112_c6_320a_left,
BIN_OP_EQ_uxn_device_h_l112_c6_320a_right,
BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243
port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243
port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output);

-- device_ram_read_uxn_device_h_l113_c14_15e6
device_ram_read_uxn_device_h_l113_c14_15e6 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l113_c14_15e6_address,
device_ram_read_uxn_device_h_l113_c14_15e6_return_output);

-- system_deo_uxn_device_h_l113_c3_f1b8
system_deo_uxn_device_h_l113_c3_f1b8 : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l113_c3_f1b8_d,
system_deo_uxn_device_h_l113_c3_f1b8_device_port);

-- BIN_OP_GT_uxn_device_h_l114_c27_ba46
BIN_OP_GT_uxn_device_h_l114_c27_ba46 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l114_c27_ba46_left,
BIN_OP_GT_uxn_device_h_l114_c27_ba46_right,
BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output);

-- MUX_uxn_device_h_l114_c27_5613
MUX_uxn_device_h_l114_c27_5613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l114_c27_5613_cond,
MUX_uxn_device_h_l114_c27_5613_iftrue,
MUX_uxn_device_h_l114_c27_5613_iffalse,
MUX_uxn_device_h_l114_c27_5613_return_output);

-- BIN_OP_LT_uxn_device_h_l115_c27_ee1b
BIN_OP_LT_uxn_device_h_l115_c27_ee1b : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left,
BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right,
BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output);

-- MUX_uxn_device_h_l115_c27_099e
MUX_uxn_device_h_l115_c27_099e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l115_c27_099e_cond,
MUX_uxn_device_h_l115_c27_099e_iftrue,
MUX_uxn_device_h_l115_c27_099e_iffalse,
MUX_uxn_device_h_l115_c27_099e_return_output);

-- BIN_OP_AND_uxn_device_h_l116_c7_4b30
BIN_OP_AND_uxn_device_h_l116_c7_4b30 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l116_c7_4b30_left,
BIN_OP_AND_uxn_device_h_l116_c7_4b30_right,
BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output);

-- device_ram_read_uxn_device_h_l125_c19_5339
device_ram_read_uxn_device_h_l125_c19_5339 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l125_c19_5339_address,
device_ram_read_uxn_device_h_l125_c19_5339_return_output);

-- screen_palette_uxn_device_h_l125_c4_4514
screen_palette_uxn_device_h_l125_c4_4514 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l125_c4_4514_device_port);

-- BIN_OP_EQ_uxn_device_h_l128_c11_f48f
BIN_OP_EQ_uxn_device_h_l128_c11_f48f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left,
BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right,
BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output);

-- device_ram_read_uxn_device_h_l129_c15_bd14
device_ram_read_uxn_device_h_l129_c15_bd14 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l129_c15_bd14_address,
device_ram_read_uxn_device_h_l129_c15_bd14_return_output);

-- console_deo_uxn_device_h_l129_c3_2c2c
console_deo_uxn_device_h_l129_c3_2c2c : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l129_c3_2c2c_d,
console_deo_uxn_device_h_l129_c3_2c2c_device_port);

-- BIN_OP_EQ_uxn_device_h_l131_c11_1f59
BIN_OP_EQ_uxn_device_h_l131_c11_1f59 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left,
BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right,
BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output);

-- device_ram_read_uxn_device_h_l132_c14_c205
device_ram_read_uxn_device_h_l132_c14_c205 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l132_c14_c205_address,
device_ram_read_uxn_device_h_l132_c14_c205_return_output);

-- screen_deo_uxn_device_h_l132_c3_becf
screen_deo_uxn_device_h_l132_c3_becf : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l132_c3_becf_d,
screen_deo_uxn_device_h_l132_c3_becf_device_port);

-- BIN_OP_EQ_uxn_device_h_l134_c11_079b
BIN_OP_EQ_uxn_device_h_l134_c11_079b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_079b_left,
BIN_OP_EQ_uxn_device_h_l134_c11_079b_right,
BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output);

-- device_ram_read_uxn_device_h_l135_c15_dc50
device_ram_read_uxn_device_h_l135_c15_dc50 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l135_c15_dc50_address,
device_ram_read_uxn_device_h_l135_c15_dc50_return_output);

-- file_deo_uxn_device_h_l135_c3_3e1c
file_deo_uxn_device_h_l135_c3_3e1c : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l135_c3_3e1c_file_index,
file_deo_uxn_device_h_l135_c3_3e1c_d,
file_deo_uxn_device_h_l135_c3_3e1c_p);

-- BIN_OP_EQ_uxn_device_h_l137_c11_b30c
BIN_OP_EQ_uxn_device_h_l137_c11_b30c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left,
BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right,
BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output);

-- device_ram_read_uxn_device_h_l138_c15_eda8
device_ram_read_uxn_device_h_l138_c15_eda8 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l138_c15_eda8_address,
device_ram_read_uxn_device_h_l138_c15_eda8_return_output);

-- file_deo_uxn_device_h_l138_c3_53a6
file_deo_uxn_device_h_l138_c3_53a6 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l138_c3_53a6_file_index,
file_deo_uxn_device_h_l138_c3_53a6_d,
file_deo_uxn_device_h_l138_c3_53a6_p);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 device_port,
 device_index,
 port_range_palette_lo,
 port_range_palette_hi,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output,
 BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output,
 BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output,
 device_ram_read_uxn_device_h_l113_c14_15e6_return_output,
 BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output,
 MUX_uxn_device_h_l114_c27_5613_return_output,
 BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output,
 MUX_uxn_device_h_l115_c27_099e_return_output,
 BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output,
 device_ram_read_uxn_device_h_l125_c19_5339_return_output,
 BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output,
 device_ram_read_uxn_device_h_l129_c15_bd14_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output,
 device_ram_read_uxn_device_h_l132_c14_c205_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output,
 device_ram_read_uxn_device_h_l135_c15_dc50_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output,
 device_ram_read_uxn_device_h_l138_c15_eda8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l113_c3_f1b8_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l113_c3_f1b8_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_15e6_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_15e6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_5613_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_5613_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_5613_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_5613_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_099e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_099e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_099e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_099e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l125_c4_4514_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_5339_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_5339_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l129_c3_2c2c_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l129_c3_2c2c_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_bd14_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_bd14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l132_c3_becf_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l132_c3_becf_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_c205_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_c205_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_3e1c_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_3e1c_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_3e1c_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_dc50_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_dc50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_53a6_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_53a6_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_53a6_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_eda8_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_eda8_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_device_port : unsigned(7 downto 0);
variable REG_VAR_device_index : unsigned(7 downto 0);
variable REG_VAR_port_range_palette_lo : unsigned(0 downto 0);
variable REG_VAR_port_range_palette_hi : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device_port := device_port;
  REG_VAR_device_index := device_index;
  REG_VAR_port_range_palette_lo := port_range_palette_lo;
  REG_VAR_port_range_palette_hi := port_range_palette_hi;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_file_deo_uxn_device_h_l138_c3_53a6_file_index := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l114_c27_5613_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_right := to_unsigned(160, 8);
     VAR_MUX_uxn_device_h_l115_c27_099e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l114_c27_5613_iftrue := to_unsigned(1, 1);
     VAR_device_ram_read_uxn_device_h_l125_c19_5339_address := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l135_c3_3e1c_file_index := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right := to_unsigned(176, 8);
     VAR_MUX_uxn_device_h_l115_c27_099e_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l111_c17_c617] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l111_c17_c617_left <= VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_left;
     BIN_OP_AND_uxn_device_h_l111_c17_c617_right <= VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output := BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;

     -- BIN_OP_AND[uxn_device_h_l110_c16_7be2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l110_c16_7be2_left <= VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_left;
     BIN_OP_AND_uxn_device_h_l110_c16_7be2_right <= VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output := BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_left := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_console_deo_uxn_device_h_l129_c3_2c2c_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_file_deo_uxn_device_h_l135_c3_3e1c_p := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_file_deo_uxn_device_h_l138_c3_53a6_p := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_screen_deo_uxn_device_h_l132_c3_becf_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_system_deo_uxn_device_h_l113_c3_f1b8_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_7be2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_device_ram_read_uxn_device_h_l113_c14_15e6_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_device_ram_read_uxn_device_h_l129_c15_bd14_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_device_ram_read_uxn_device_h_l132_c14_c205_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_device_ram_read_uxn_device_h_l135_c15_dc50_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     VAR_device_ram_read_uxn_device_h_l138_c15_eda8_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_c617_return_output;
     -- BIN_OP_EQ[uxn_device_h_l112_c6_320a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l112_c6_320a_left <= VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_left;
     BIN_OP_EQ_uxn_device_h_l112_c6_320a_right <= VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output := BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l128_c11_f48f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_left;
     BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output := BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output;

     -- BIN_OP_LT[uxn_device_h_l115_c27_ee1b] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left <= VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_left;
     BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right <= VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output := BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output;

     -- BIN_OP_GT[uxn_device_h_l114_c27_ba46] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l114_c27_ba46_left <= VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_left;
     BIN_OP_GT_uxn_device_h_l114_c27_ba46_right <= VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output := BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c11_1f59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_left;
     BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output := BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_b30c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_079b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_079b_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_079b_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_320a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond := VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l128_c11_f48f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c11_1f59_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_079b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_b30c_return_output;
     VAR_MUX_uxn_device_h_l114_c27_5613_cond := VAR_BIN_OP_GT_uxn_device_h_l114_c27_ba46_return_output;
     VAR_MUX_uxn_device_h_l115_c27_099e_cond := VAR_BIN_OP_LT_uxn_device_h_l115_c27_ee1b_return_output;
     -- MUX[uxn_device_h_l114_c27_5613] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l114_c27_5613_cond <= VAR_MUX_uxn_device_h_l114_c27_5613_cond;
     MUX_uxn_device_h_l114_c27_5613_iftrue <= VAR_MUX_uxn_device_h_l114_c27_5613_iftrue;
     MUX_uxn_device_h_l114_c27_5613_iffalse <= VAR_MUX_uxn_device_h_l114_c27_5613_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l114_c27_5613_return_output := MUX_uxn_device_h_l114_c27_5613_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c7_fae6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_d65e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output;

     -- MUX[uxn_device_h_l115_c27_099e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l115_c27_099e_cond <= VAR_MUX_uxn_device_h_l115_c27_099e_cond;
     MUX_uxn_device_h_l115_c27_099e_iftrue <= VAR_MUX_uxn_device_h_l115_c27_099e_iftrue;
     MUX_uxn_device_h_l115_c27_099e_iffalse <= VAR_MUX_uxn_device_h_l115_c27_099e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l115_c27_099e_return_output := MUX_uxn_device_h_l115_c27_099e_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_fae6_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_left := VAR_MUX_uxn_device_h_l114_c27_5613_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue := VAR_MUX_uxn_device_h_l114_c27_5613_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_right := VAR_MUX_uxn_device_h_l115_c27_099e_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue := VAR_MUX_uxn_device_h_l115_c27_099e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output;
     VAR_device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_d65e_return_output;
     -- device_ram_read[uxn_device_h_l113_c14_15e6] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l113_c14_15e6_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l113_c14_15e6_address <= VAR_device_ram_read_uxn_device_h_l113_c14_15e6_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l113_c14_15e6_return_output := device_ram_read_uxn_device_h_l113_c14_15e6_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l112_c2_1243] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_cond;
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output := port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c7_8e93] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output;

     -- BIN_OP_AND[uxn_device_h_l116_c7_4b30] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l116_c7_4b30_left <= VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_left;
     BIN_OP_AND_uxn_device_h_l116_c7_4b30_right <= VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output := BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l112_c2_1243] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_cond;
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output := port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c1_a6ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond := VAR_BIN_OP_AND_uxn_device_h_l116_c7_4b30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_8e93_return_output;
     VAR_device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_a6ec_return_output;
     VAR_system_deo_uxn_device_h_l113_c3_f1b8_d := VAR_device_ram_read_uxn_device_h_l113_c14_15e6_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_1243_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_1243_return_output;
     -- device_ram_read[uxn_device_h_l129_c15_bd14] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l129_c15_bd14_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l129_c15_bd14_address <= VAR_device_ram_read_uxn_device_h_l129_c15_bd14_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l129_c15_bd14_return_output := device_ram_read_uxn_device_h_l129_c15_bd14_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_b3b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output;

     -- system_deo[uxn_device_h_l113_c3_f1b8] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l113_c3_f1b8_d <= VAR_system_deo_uxn_device_h_l113_c3_f1b8_d;
     system_deo_uxn_device_h_l113_c3_f1b8_device_port <= VAR_system_deo_uxn_device_h_l113_c3_f1b8_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c1_4cc8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c1_01c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_b3b6_return_output;
     VAR_device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_01c0_return_output;
     VAR_device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_4cc8_return_output;
     VAR_console_deo_uxn_device_h_l129_c3_2c2c_d := VAR_device_ram_read_uxn_device_h_l129_c15_bd14_return_output;
     -- device_ram_read[uxn_device_h_l125_c19_5339] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l125_c19_5339_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l125_c19_5339_address <= VAR_device_ram_read_uxn_device_h_l125_c19_5339_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l125_c19_5339_return_output := device_ram_read_uxn_device_h_l125_c19_5339_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c1_d78f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output;

     -- device_ram_read[uxn_device_h_l132_c14_c205] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l132_c14_c205_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l132_c14_c205_address <= VAR_device_ram_read_uxn_device_h_l132_c14_c205_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l132_c14_c205_return_output := device_ram_read_uxn_device_h_l132_c14_c205_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_a00f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output;

     -- console_deo[uxn_device_h_l129_c3_2c2c] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l129_c3_2c2c_d <= VAR_console_deo_uxn_device_h_l129_c3_2c2c_d;
     console_deo_uxn_device_h_l129_c3_2c2c_device_port <= VAR_console_deo_uxn_device_h_l129_c3_2c2c_device_port;
     -- Outputs

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_a00f_return_output;
     VAR_device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_d78f_return_output;
     VAR_screen_palette_uxn_device_h_l125_c4_4514_device_port := VAR_device_ram_read_uxn_device_h_l125_c19_5339_return_output;
     VAR_screen_deo_uxn_device_h_l132_c3_becf_d := VAR_device_ram_read_uxn_device_h_l132_c14_c205_return_output;
     -- screen_deo[uxn_device_h_l132_c3_becf] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l132_c3_becf_d <= VAR_screen_deo_uxn_device_h_l132_c3_becf_d;
     screen_deo_uxn_device_h_l132_c3_becf_device_port <= VAR_screen_deo_uxn_device_h_l132_c3_becf_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l125_c4_4514] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l125_c4_4514_device_port <= VAR_screen_palette_uxn_device_h_l125_c4_4514_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c1_4264] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output;

     -- device_ram_read[uxn_device_h_l135_c15_dc50] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l135_c15_dc50_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l135_c15_dc50_address <= VAR_device_ram_read_uxn_device_h_l135_c15_dc50_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l135_c15_dc50_return_output := device_ram_read_uxn_device_h_l135_c15_dc50_return_output;

     -- Submodule level 7
     VAR_device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_4264_return_output;
     VAR_file_deo_uxn_device_h_l135_c3_3e1c_d := VAR_device_ram_read_uxn_device_h_l135_c15_dc50_return_output;
     -- file_deo[uxn_device_h_l135_c3_3e1c] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l135_c3_3e1c_file_index <= VAR_file_deo_uxn_device_h_l135_c3_3e1c_file_index;
     file_deo_uxn_device_h_l135_c3_3e1c_d <= VAR_file_deo_uxn_device_h_l135_c3_3e1c_d;
     file_deo_uxn_device_h_l135_c3_3e1c_p <= VAR_file_deo_uxn_device_h_l135_c3_3e1c_p;
     -- Outputs

     -- device_ram_read[uxn_device_h_l138_c15_eda8] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l138_c15_eda8_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l138_c15_eda8_address <= VAR_device_ram_read_uxn_device_h_l138_c15_eda8_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l138_c15_eda8_return_output := device_ram_read_uxn_device_h_l138_c15_eda8_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l138_c3_53a6_d := VAR_device_ram_read_uxn_device_h_l138_c15_eda8_return_output;
     -- file_deo[uxn_device_h_l138_c3_53a6] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l138_c3_53a6_file_index <= VAR_file_deo_uxn_device_h_l138_c3_53a6_file_index;
     file_deo_uxn_device_h_l138_c3_53a6_d <= VAR_file_deo_uxn_device_h_l138_c3_53a6_d;
     file_deo_uxn_device_h_l138_c3_53a6_p <= VAR_file_deo_uxn_device_h_l138_c3_53a6_p;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device_port <= REG_VAR_device_port;
REG_COMB_device_index <= REG_VAR_device_index;
REG_COMB_port_range_palette_lo <= REG_VAR_port_range_palette_lo;
REG_COMB_port_range_palette_hi <= REG_VAR_port_range_palette_hi;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device_port <= REG_COMB_device_port;
     device_index <= REG_COMB_device_index;
     port_range_palette_lo <= REG_COMB_port_range_palette_lo;
     port_range_palette_hi <= REG_COMB_port_range_palette_hi;
 end if;
 end if;
end process;

end arch;
