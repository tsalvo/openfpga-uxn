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
-- BIN_OP_AND[uxn_device_h_l110_c16_4f56]
signal BIN_OP_AND_uxn_device_h_l110_c16_4f56_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l110_c16_4f56_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l111_c17_b586]
signal BIN_OP_AND_uxn_device_h_l111_c17_b586_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l111_c17_b586_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l112_c6_4d72]
signal BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_952b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c7_a479]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l112_c2_49d4]
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l112_c2_49d4]
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l113_c14_2ee3]
signal device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l113_c14_2ee3_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l113_c14_2ee3_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l113_c3_fa86]
signal system_deo_uxn_device_h_l113_c3_fa86_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l113_c3_fa86_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l114_c27_fe5b]
signal BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l114_c27_9204]
signal MUX_uxn_device_h_l114_c27_9204_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_9204_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_9204_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l114_c27_9204_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l115_c27_c706]
signal BIN_OP_LT_uxn_device_h_l115_c27_c706_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l115_c27_c706_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l115_c27_194f]
signal MUX_uxn_device_h_l115_c27_194f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_194f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_194f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c27_194f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l116_c7_6ebc]
signal BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c1_1da2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l125_c19_b8dd]
signal device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l125_c19_b8dd_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l125_c19_b8dd_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l125_c4_4ca1]
signal screen_palette_uxn_device_h_l125_c4_4ca1_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l128_c11_fbe3]
signal BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c1_2728]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c7_e919]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l129_c15_ff36]
signal device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l129_c15_ff36_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l129_c15_ff36_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l129_c3_a0f1]
signal console_deo_uxn_device_h_l129_c3_a0f1_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l129_c3_a0f1_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c11_5cf6]
signal BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c1_3324]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_daf3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l132_c14_32d8]
signal device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l132_c14_32d8_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l132_c14_32d8_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l132_c3_5271]
signal screen_deo_uxn_device_h_l132_c3_5271_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l132_c3_5271_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_c821]
signal BIN_OP_EQ_uxn_device_h_l134_c11_c821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_c821_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c1_6fb4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_ead4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l135_c15_30de]
signal device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l135_c15_30de_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l135_c15_30de_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l135_c3_b2a8]
signal file_deo_uxn_device_h_l135_c3_b2a8_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l135_c3_b2a8_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l135_c3_b2a8_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_018b]
signal BIN_OP_EQ_uxn_device_h_l137_c11_018b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_018b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c1_14f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l138_c15_a7ca]
signal device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l138_c15_a7ca_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l138_c15_a7ca_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l138_c3_656b]
signal file_deo_uxn_device_h_l138_c3_656b_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l138_c3_656b_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l138_c3_656b_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l110_c16_4f56
BIN_OP_AND_uxn_device_h_l110_c16_4f56 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l110_c16_4f56_left,
BIN_OP_AND_uxn_device_h_l110_c16_4f56_right,
BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output);

-- BIN_OP_AND_uxn_device_h_l111_c17_b586
BIN_OP_AND_uxn_device_h_l111_c17_b586 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l111_c17_b586_left,
BIN_OP_AND_uxn_device_h_l111_c17_b586_right,
BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output);

-- BIN_OP_EQ_uxn_device_h_l112_c6_4d72
BIN_OP_EQ_uxn_device_h_l112_c6_4d72 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left,
BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right,
BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4
port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4
port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output);

-- device_ram_read_uxn_device_h_l113_c14_2ee3
device_ram_read_uxn_device_h_l113_c14_2ee3 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l113_c14_2ee3_address,
device_ram_read_uxn_device_h_l113_c14_2ee3_return_output);

-- system_deo_uxn_device_h_l113_c3_fa86
system_deo_uxn_device_h_l113_c3_fa86 : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l113_c3_fa86_d,
system_deo_uxn_device_h_l113_c3_fa86_device_port);

-- BIN_OP_GT_uxn_device_h_l114_c27_fe5b
BIN_OP_GT_uxn_device_h_l114_c27_fe5b : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left,
BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right,
BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output);

-- MUX_uxn_device_h_l114_c27_9204
MUX_uxn_device_h_l114_c27_9204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l114_c27_9204_cond,
MUX_uxn_device_h_l114_c27_9204_iftrue,
MUX_uxn_device_h_l114_c27_9204_iffalse,
MUX_uxn_device_h_l114_c27_9204_return_output);

-- BIN_OP_LT_uxn_device_h_l115_c27_c706
BIN_OP_LT_uxn_device_h_l115_c27_c706 : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l115_c27_c706_left,
BIN_OP_LT_uxn_device_h_l115_c27_c706_right,
BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output);

-- MUX_uxn_device_h_l115_c27_194f
MUX_uxn_device_h_l115_c27_194f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l115_c27_194f_cond,
MUX_uxn_device_h_l115_c27_194f_iftrue,
MUX_uxn_device_h_l115_c27_194f_iffalse,
MUX_uxn_device_h_l115_c27_194f_return_output);

-- BIN_OP_AND_uxn_device_h_l116_c7_6ebc
BIN_OP_AND_uxn_device_h_l116_c7_6ebc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left,
BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right,
BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output);

-- device_ram_read_uxn_device_h_l125_c19_b8dd
device_ram_read_uxn_device_h_l125_c19_b8dd : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l125_c19_b8dd_address,
device_ram_read_uxn_device_h_l125_c19_b8dd_return_output);

-- screen_palette_uxn_device_h_l125_c4_4ca1
screen_palette_uxn_device_h_l125_c4_4ca1 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l125_c4_4ca1_device_port);

-- BIN_OP_EQ_uxn_device_h_l128_c11_fbe3
BIN_OP_EQ_uxn_device_h_l128_c11_fbe3 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left,
BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right,
BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output);

-- device_ram_read_uxn_device_h_l129_c15_ff36
device_ram_read_uxn_device_h_l129_c15_ff36 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l129_c15_ff36_address,
device_ram_read_uxn_device_h_l129_c15_ff36_return_output);

-- console_deo_uxn_device_h_l129_c3_a0f1
console_deo_uxn_device_h_l129_c3_a0f1 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l129_c3_a0f1_d,
console_deo_uxn_device_h_l129_c3_a0f1_device_port);

-- BIN_OP_EQ_uxn_device_h_l131_c11_5cf6
BIN_OP_EQ_uxn_device_h_l131_c11_5cf6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left,
BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right,
BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output);

-- device_ram_read_uxn_device_h_l132_c14_32d8
device_ram_read_uxn_device_h_l132_c14_32d8 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l132_c14_32d8_address,
device_ram_read_uxn_device_h_l132_c14_32d8_return_output);

-- screen_deo_uxn_device_h_l132_c3_5271
screen_deo_uxn_device_h_l132_c3_5271 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l132_c3_5271_d,
screen_deo_uxn_device_h_l132_c3_5271_device_port);

-- BIN_OP_EQ_uxn_device_h_l134_c11_c821
BIN_OP_EQ_uxn_device_h_l134_c11_c821 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_c821_left,
BIN_OP_EQ_uxn_device_h_l134_c11_c821_right,
BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output);

-- device_ram_read_uxn_device_h_l135_c15_30de
device_ram_read_uxn_device_h_l135_c15_30de : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l135_c15_30de_address,
device_ram_read_uxn_device_h_l135_c15_30de_return_output);

-- file_deo_uxn_device_h_l135_c3_b2a8
file_deo_uxn_device_h_l135_c3_b2a8 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l135_c3_b2a8_file_index,
file_deo_uxn_device_h_l135_c3_b2a8_d,
file_deo_uxn_device_h_l135_c3_b2a8_p);

-- BIN_OP_EQ_uxn_device_h_l137_c11_018b
BIN_OP_EQ_uxn_device_h_l137_c11_018b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_018b_left,
BIN_OP_EQ_uxn_device_h_l137_c11_018b_right,
BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output);

-- device_ram_read_uxn_device_h_l138_c15_a7ca
device_ram_read_uxn_device_h_l138_c15_a7ca : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l138_c15_a7ca_address,
device_ram_read_uxn_device_h_l138_c15_a7ca_return_output);

-- file_deo_uxn_device_h_l138_c3_656b
file_deo_uxn_device_h_l138_c3_656b : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l138_c3_656b_file_index,
file_deo_uxn_device_h_l138_c3_656b_d,
file_deo_uxn_device_h_l138_c3_656b_p);



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
 BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output,
 BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output,
 BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output,
 device_ram_read_uxn_device_h_l113_c14_2ee3_return_output,
 BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output,
 MUX_uxn_device_h_l114_c27_9204_return_output,
 BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output,
 MUX_uxn_device_h_l115_c27_194f_return_output,
 BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output,
 device_ram_read_uxn_device_h_l125_c19_b8dd_return_output,
 BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output,
 device_ram_read_uxn_device_h_l129_c15_ff36_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output,
 device_ram_read_uxn_device_h_l132_c14_32d8_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output,
 device_ram_read_uxn_device_h_l135_c15_30de_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output,
 device_ram_read_uxn_device_h_l138_c15_a7ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l113_c3_fa86_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l113_c3_fa86_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_9204_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_9204_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_9204_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l114_c27_9204_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_194f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_194f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_194f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c27_194f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l125_c4_4ca1_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l129_c3_a0f1_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l129_c3_a0f1_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_ff36_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l129_c15_ff36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l132_c3_5271_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l132_c3_5271_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_32d8_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l132_c14_32d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_b2a8_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_b2a8_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l135_c3_b2a8_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_30de_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l135_c15_30de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_656b_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_656b_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l138_c3_656b_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_right := to_unsigned(176, 8);
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_right := to_unsigned(240, 8);
     VAR_MUX_uxn_device_h_l114_c27_9204_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l135_c3_b2a8_file_index := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse := to_unsigned(0, 1);
     VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_address := resize(to_unsigned(8, 4), 8);
     VAR_MUX_uxn_device_h_l114_c27_9204_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l138_c3_656b_file_index := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l115_c27_194f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l115_c27_194f_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l111_c17_b586] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l111_c17_b586_left <= VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_left;
     BIN_OP_AND_uxn_device_h_l111_c17_b586_right <= VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output := BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;

     -- BIN_OP_AND[uxn_device_h_l110_c16_4f56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l110_c16_4f56_left <= VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_left;
     BIN_OP_AND_uxn_device_h_l110_c16_4f56_right <= VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output := BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_left := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_console_deo_uxn_device_h_l129_c3_a0f1_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_file_deo_uxn_device_h_l135_c3_b2a8_p := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_file_deo_uxn_device_h_l138_c3_656b_p := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_screen_deo_uxn_device_h_l132_c3_5271_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_system_deo_uxn_device_h_l113_c3_fa86_device_port := VAR_BIN_OP_AND_uxn_device_h_l110_c16_4f56_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_left := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_device_ram_read_uxn_device_h_l129_c15_ff36_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_device_ram_read_uxn_device_h_l132_c14_32d8_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_device_ram_read_uxn_device_h_l135_c15_30de_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_address := VAR_BIN_OP_AND_uxn_device_h_l111_c17_b586_return_output;
     -- BIN_OP_LT[uxn_device_h_l115_c27_c706] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l115_c27_c706_left <= VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_left;
     BIN_OP_LT_uxn_device_h_l115_c27_c706_right <= VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output := BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output;

     -- BIN_OP_EQ[uxn_device_h_l112_c6_4d72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left <= VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_left;
     BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right <= VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output := BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c11_5cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_left;
     BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output := BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_c821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_c821_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_c821_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_018b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_018b_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_018b_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l128_c11_fbe3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_left;
     BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output := BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output;

     -- BIN_OP_GT[uxn_device_h_l114_c27_fe5b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left <= VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_left;
     BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right <= VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output := BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c6_4d72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond := VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond := VAR_BIN_OP_EQ_uxn_device_h_l128_c11_fbe3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c11_5cf6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_c821_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_018b_return_output;
     VAR_MUX_uxn_device_h_l114_c27_9204_cond := VAR_BIN_OP_GT_uxn_device_h_l114_c27_fe5b_return_output;
     VAR_MUX_uxn_device_h_l115_c27_194f_cond := VAR_BIN_OP_LT_uxn_device_h_l115_c27_c706_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c7_a479] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output;

     -- MUX[uxn_device_h_l115_c27_194f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l115_c27_194f_cond <= VAR_MUX_uxn_device_h_l115_c27_194f_cond;
     MUX_uxn_device_h_l115_c27_194f_iftrue <= VAR_MUX_uxn_device_h_l115_c27_194f_iftrue;
     MUX_uxn_device_h_l115_c27_194f_iffalse <= VAR_MUX_uxn_device_h_l115_c27_194f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l115_c27_194f_return_output := MUX_uxn_device_h_l115_c27_194f_return_output;

     -- MUX[uxn_device_h_l114_c27_9204] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l114_c27_9204_cond <= VAR_MUX_uxn_device_h_l114_c27_9204_cond;
     MUX_uxn_device_h_l114_c27_9204_iftrue <= VAR_MUX_uxn_device_h_l114_c27_9204_iftrue;
     MUX_uxn_device_h_l114_c27_9204_iffalse <= VAR_MUX_uxn_device_h_l114_c27_9204_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l114_c27_9204_return_output := MUX_uxn_device_h_l114_c27_9204_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_952b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c7_a479_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left := VAR_MUX_uxn_device_h_l114_c27_9204_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue := VAR_MUX_uxn_device_h_l114_c27_9204_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right := VAR_MUX_uxn_device_h_l115_c27_194f_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue := VAR_MUX_uxn_device_h_l115_c27_194f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output;
     VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_952b_return_output;
     -- port_range_palette_lo_MUX[uxn_device_h_l112_c2_49d4] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_cond;
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output := port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output;

     -- BIN_OP_AND[uxn_device_h_l116_c7_6ebc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left <= VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_left;
     BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right <= VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output := BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c7_e919] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l112_c2_49d4] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_cond;
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output := port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output;

     -- device_ram_read[uxn_device_h_l113_c14_2ee3] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l113_c14_2ee3_address <= VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_return_output := device_ram_read_uxn_device_h_l113_c14_2ee3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l128_c1_2728] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond := VAR_BIN_OP_AND_uxn_device_h_l116_c7_6ebc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c7_e919_return_output;
     VAR_device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l128_c1_2728_return_output;
     VAR_system_deo_uxn_device_h_l113_c3_fa86_d := VAR_device_ram_read_uxn_device_h_l113_c14_2ee3_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l112_c2_49d4_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l112_c2_49d4_return_output;
     -- device_ram_read[uxn_device_h_l129_c15_ff36] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l129_c15_ff36_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l129_c15_ff36_address <= VAR_device_ram_read_uxn_device_h_l129_c15_ff36_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l129_c15_ff36_return_output := device_ram_read_uxn_device_h_l129_c15_ff36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l131_c1_3324] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_daf3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output;

     -- system_deo[uxn_device_h_l113_c3_fa86] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l113_c3_fa86_d <= VAR_system_deo_uxn_device_h_l113_c3_fa86_d;
     system_deo_uxn_device_h_l113_c3_fa86_device_port <= VAR_system_deo_uxn_device_h_l113_c3_fa86_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c1_1da2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_daf3_return_output;
     VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c1_1da2_return_output;
     VAR_device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l131_c1_3324_return_output;
     VAR_console_deo_uxn_device_h_l129_c3_a0f1_d := VAR_device_ram_read_uxn_device_h_l129_c15_ff36_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_ead4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output;

     -- console_deo[uxn_device_h_l129_c3_a0f1] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l129_c3_a0f1_d <= VAR_console_deo_uxn_device_h_l129_c3_a0f1_d;
     console_deo_uxn_device_h_l129_c3_a0f1_device_port <= VAR_console_deo_uxn_device_h_l129_c3_a0f1_device_port;
     -- Outputs

     -- device_ram_read[uxn_device_h_l125_c19_b8dd] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l125_c19_b8dd_address <= VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_return_output := device_ram_read_uxn_device_h_l125_c19_b8dd_return_output;

     -- device_ram_read[uxn_device_h_l132_c14_32d8] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l132_c14_32d8_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l132_c14_32d8_address <= VAR_device_ram_read_uxn_device_h_l132_c14_32d8_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l132_c14_32d8_return_output := device_ram_read_uxn_device_h_l132_c14_32d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c1_6fb4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_ead4_return_output;
     VAR_device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c1_6fb4_return_output;
     VAR_screen_palette_uxn_device_h_l125_c4_4ca1_device_port := VAR_device_ram_read_uxn_device_h_l125_c19_b8dd_return_output;
     VAR_screen_deo_uxn_device_h_l132_c3_5271_d := VAR_device_ram_read_uxn_device_h_l132_c14_32d8_return_output;
     -- screen_deo[uxn_device_h_l132_c3_5271] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l132_c3_5271_d <= VAR_screen_deo_uxn_device_h_l132_c3_5271_d;
     screen_deo_uxn_device_h_l132_c3_5271_device_port <= VAR_screen_deo_uxn_device_h_l132_c3_5271_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l125_c4_4ca1] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l125_c4_4ca1_device_port <= VAR_screen_palette_uxn_device_h_l125_c4_4ca1_device_port;
     -- Outputs

     -- device_ram_read[uxn_device_h_l135_c15_30de] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l135_c15_30de_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l135_c15_30de_address <= VAR_device_ram_read_uxn_device_h_l135_c15_30de_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l135_c15_30de_return_output := device_ram_read_uxn_device_h_l135_c15_30de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c1_14f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output;

     -- Submodule level 7
     VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c1_14f7_return_output;
     VAR_file_deo_uxn_device_h_l135_c3_b2a8_d := VAR_device_ram_read_uxn_device_h_l135_c15_30de_return_output;
     -- file_deo[uxn_device_h_l135_c3_b2a8] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l135_c3_b2a8_file_index <= VAR_file_deo_uxn_device_h_l135_c3_b2a8_file_index;
     file_deo_uxn_device_h_l135_c3_b2a8_d <= VAR_file_deo_uxn_device_h_l135_c3_b2a8_d;
     file_deo_uxn_device_h_l135_c3_b2a8_p <= VAR_file_deo_uxn_device_h_l135_c3_b2a8_p;
     -- Outputs

     -- device_ram_read[uxn_device_h_l138_c15_a7ca] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l138_c15_a7ca_address <= VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_return_output := device_ram_read_uxn_device_h_l138_c15_a7ca_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l138_c3_656b_d := VAR_device_ram_read_uxn_device_h_l138_c15_a7ca_return_output;
     -- file_deo[uxn_device_h_l138_c3_656b] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l138_c3_656b_file_index <= VAR_file_deo_uxn_device_h_l138_c3_656b_file_index;
     file_deo_uxn_device_h_l138_c3_656b_d <= VAR_file_deo_uxn_device_h_l138_c3_656b_d;
     file_deo_uxn_device_h_l138_c3_656b_p <= VAR_file_deo_uxn_device_h_l138_c3_656b_p;
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
