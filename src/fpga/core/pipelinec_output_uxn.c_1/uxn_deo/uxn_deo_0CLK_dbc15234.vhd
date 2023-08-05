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
-- BIN_OP_AND[uxn_device_h_l112_c16_57f1]
signal BIN_OP_AND_uxn_device_h_l112_c16_57f1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_57f1_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_c88d]
signal BIN_OP_AND_uxn_device_h_l113_c17_c88d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_c88d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_12ff]
signal BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_9b56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_6011]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_bced]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_bced]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l115_c14_9f46]
signal device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l115_c14_9f46_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l115_c14_9f46_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_7acb]
signal system_deo_uxn_device_h_l115_c3_7acb_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_7acb_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_c17a]
signal BIN_OP_GT_uxn_device_h_l116_c27_c17a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_c17a_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_b5a6]
signal MUX_uxn_device_h_l116_c27_b5a6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_b5a6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_b5a6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_b5a6_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_9e5f]
signal BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_a456]
signal MUX_uxn_device_h_l117_c27_a456_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_a456_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_a456_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_a456_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_3c46]
signal BIN_OP_AND_uxn_device_h_l118_c7_3c46_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_3c46_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_457c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l127_c19_b499]
signal device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l127_c19_b499_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l127_c19_b499_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_9912]
signal screen_palette_uxn_device_h_l127_c4_9912_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_4f64]
signal BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_5a29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_db16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l131_c15_7637]
signal device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l131_c15_7637_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l131_c15_7637_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_0027]
signal console_deo_uxn_device_h_l131_c3_0027_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_0027_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_f2dc]
signal BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_8b6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_5e4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l134_c14_0fe2]
signal device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l134_c14_0fe2_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l134_c14_0fe2_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_4916]
signal screen_deo_uxn_device_h_l134_c3_4916_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_4916_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_89aa]
signal BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c351]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_7a49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l137_c15_9793]
signal device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l137_c15_9793_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l137_c15_9793_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_5e65]
signal file_deo_uxn_device_h_l137_c3_5e65_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_5e65_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_5e65_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_3777]
signal BIN_OP_EQ_uxn_device_h_l139_c11_3777_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_3777_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_e1b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l140_c15_3dd2]
signal device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l140_c15_3dd2_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l140_c15_3dd2_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_d6ef]
signal file_deo_uxn_device_h_l140_c3_d6ef_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_d6ef_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_d6ef_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_57f1
BIN_OP_AND_uxn_device_h_l112_c16_57f1 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_57f1_left,
BIN_OP_AND_uxn_device_h_l112_c16_57f1_right,
BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_c88d
BIN_OP_AND_uxn_device_h_l113_c17_c88d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_c88d_left,
BIN_OP_AND_uxn_device_h_l113_c17_c88d_right,
BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_12ff
BIN_OP_EQ_uxn_device_h_l114_c6_12ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left,
BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right,
BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced
port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced
port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output);

-- device_ram_read_uxn_device_h_l115_c14_9f46
device_ram_read_uxn_device_h_l115_c14_9f46 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l115_c14_9f46_address,
device_ram_read_uxn_device_h_l115_c14_9f46_return_output);

-- system_deo_uxn_device_h_l115_c3_7acb
system_deo_uxn_device_h_l115_c3_7acb : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_7acb_d,
system_deo_uxn_device_h_l115_c3_7acb_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_c17a
BIN_OP_GT_uxn_device_h_l116_c27_c17a : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_c17a_left,
BIN_OP_GT_uxn_device_h_l116_c27_c17a_right,
BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output);

-- MUX_uxn_device_h_l116_c27_b5a6
MUX_uxn_device_h_l116_c27_b5a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_b5a6_cond,
MUX_uxn_device_h_l116_c27_b5a6_iftrue,
MUX_uxn_device_h_l116_c27_b5a6_iffalse,
MUX_uxn_device_h_l116_c27_b5a6_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_9e5f
BIN_OP_LT_uxn_device_h_l117_c27_9e5f : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left,
BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right,
BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output);

-- MUX_uxn_device_h_l117_c27_a456
MUX_uxn_device_h_l117_c27_a456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_a456_cond,
MUX_uxn_device_h_l117_c27_a456_iftrue,
MUX_uxn_device_h_l117_c27_a456_iffalse,
MUX_uxn_device_h_l117_c27_a456_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_3c46
BIN_OP_AND_uxn_device_h_l118_c7_3c46 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_3c46_left,
BIN_OP_AND_uxn_device_h_l118_c7_3c46_right,
BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output);

-- device_ram_read_uxn_device_h_l127_c19_b499
device_ram_read_uxn_device_h_l127_c19_b499 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l127_c19_b499_address,
device_ram_read_uxn_device_h_l127_c19_b499_return_output);

-- screen_palette_uxn_device_h_l127_c4_9912
screen_palette_uxn_device_h_l127_c4_9912 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_9912_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_4f64
BIN_OP_EQ_uxn_device_h_l130_c11_4f64 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left,
BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right,
BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output);

-- device_ram_read_uxn_device_h_l131_c15_7637
device_ram_read_uxn_device_h_l131_c15_7637 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l131_c15_7637_address,
device_ram_read_uxn_device_h_l131_c15_7637_return_output);

-- console_deo_uxn_device_h_l131_c3_0027
console_deo_uxn_device_h_l131_c3_0027 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_0027_d,
console_deo_uxn_device_h_l131_c3_0027_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_f2dc
BIN_OP_EQ_uxn_device_h_l133_c11_f2dc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left,
BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right,
BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output);

-- device_ram_read_uxn_device_h_l134_c14_0fe2
device_ram_read_uxn_device_h_l134_c14_0fe2 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l134_c14_0fe2_address,
device_ram_read_uxn_device_h_l134_c14_0fe2_return_output);

-- screen_deo_uxn_device_h_l134_c3_4916
screen_deo_uxn_device_h_l134_c3_4916 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_4916_d,
screen_deo_uxn_device_h_l134_c3_4916_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_89aa
BIN_OP_EQ_uxn_device_h_l136_c11_89aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left,
BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right,
BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output);

-- device_ram_read_uxn_device_h_l137_c15_9793
device_ram_read_uxn_device_h_l137_c15_9793 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l137_c15_9793_address,
device_ram_read_uxn_device_h_l137_c15_9793_return_output);

-- file_deo_uxn_device_h_l137_c3_5e65
file_deo_uxn_device_h_l137_c3_5e65 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_5e65_file_index,
file_deo_uxn_device_h_l137_c3_5e65_d,
file_deo_uxn_device_h_l137_c3_5e65_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_3777
BIN_OP_EQ_uxn_device_h_l139_c11_3777 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_3777_left,
BIN_OP_EQ_uxn_device_h_l139_c11_3777_right,
BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output);

-- device_ram_read_uxn_device_h_l140_c15_3dd2
device_ram_read_uxn_device_h_l140_c15_3dd2 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l140_c15_3dd2_address,
device_ram_read_uxn_device_h_l140_c15_3dd2_return_output);

-- file_deo_uxn_device_h_l140_c3_d6ef
file_deo_uxn_device_h_l140_c3_d6ef : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_d6ef_file_index,
file_deo_uxn_device_h_l140_c3_d6ef_d,
file_deo_uxn_device_h_l140_c3_d6ef_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output,
 device_ram_read_uxn_device_h_l115_c14_9f46_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output,
 MUX_uxn_device_h_l116_c27_b5a6_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output,
 MUX_uxn_device_h_l117_c27_a456_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output,
 device_ram_read_uxn_device_h_l127_c19_b499_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output,
 device_ram_read_uxn_device_h_l131_c15_7637_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output,
 device_ram_read_uxn_device_h_l134_c14_0fe2_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output,
 device_ram_read_uxn_device_h_l137_c15_9793_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output,
 device_ram_read_uxn_device_h_l140_c15_3dd2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_7acb_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_7acb_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_9f46_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_9f46_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_b5a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_b5a6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_b5a6_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_b5a6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_a456_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_a456_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_a456_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_a456_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_9912_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_b499_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_b499_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_0027_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_0027_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_7637_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_7637_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_4916_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_4916_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_5e65_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_5e65_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_5e65_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_9793_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_9793_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_d6ef_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_d6ef_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_d6ef_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_right := to_unsigned(176, 8);
     VAR_MUX_uxn_device_h_l117_c27_a456_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l140_c3_d6ef_file_index := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l137_c3_5e65_file_index := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right := to_unsigned(32, 6);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right := to_unsigned(14, 4);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_right := to_unsigned(7, 3);
     VAR_device_ram_read_uxn_device_h_l127_c19_b499_address := resize(to_unsigned(8, 4), 8);
     VAR_MUX_uxn_device_h_l116_c27_b5a6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l116_c27_b5a6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l117_c27_a456_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l112_c16_57f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_57f1_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_left;
     BIN_OP_AND_uxn_device_h_l112_c16_57f1_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output := BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;

     -- BIN_OP_AND[uxn_device_h_l113_c17_c88d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_c88d_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_left;
     BIN_OP_AND_uxn_device_h_l113_c17_c88d_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output := BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_0027_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_5e65_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_d6ef_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_4916_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_7acb_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_57f1_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_device_ram_read_uxn_device_h_l115_c14_9f46_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_device_ram_read_uxn_device_h_l131_c15_7637_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_device_ram_read_uxn_device_h_l137_c15_9793_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c88d_return_output;
     -- BIN_OP_EQ[uxn_device_h_l139_c11_3777] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_3777_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_3777_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output;

     -- BIN_OP_GT[uxn_device_h_l116_c27_c17a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_c17a_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_left;
     BIN_OP_GT_uxn_device_h_l116_c27_c17a_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output := BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_4f64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_f2dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c6_12ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output;

     -- BIN_OP_LT[uxn_device_h_l117_c27_9e5f] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_left;
     BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output := BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_89aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_12ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_4f64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f2dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_89aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3777_return_output;
     VAR_MUX_uxn_device_h_l116_c27_b5a6_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_c17a_return_output;
     VAR_MUX_uxn_device_h_l117_c27_a456_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_9e5f_return_output;
     -- MUX[uxn_device_h_l117_c27_a456] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_a456_cond <= VAR_MUX_uxn_device_h_l117_c27_a456_cond;
     MUX_uxn_device_h_l117_c27_a456_iftrue <= VAR_MUX_uxn_device_h_l117_c27_a456_iftrue;
     MUX_uxn_device_h_l117_c27_a456_iffalse <= VAR_MUX_uxn_device_h_l117_c27_a456_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_a456_return_output := MUX_uxn_device_h_l117_c27_a456_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_9b56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output;

     -- MUX[uxn_device_h_l116_c27_b5a6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_b5a6_cond <= VAR_MUX_uxn_device_h_l116_c27_b5a6_cond;
     MUX_uxn_device_h_l116_c27_b5a6_iftrue <= VAR_MUX_uxn_device_h_l116_c27_b5a6_iftrue;
     MUX_uxn_device_h_l116_c27_b5a6_iffalse <= VAR_MUX_uxn_device_h_l116_c27_b5a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_b5a6_return_output := MUX_uxn_device_h_l116_c27_b5a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_6011] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6011_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_left := VAR_MUX_uxn_device_h_l116_c27_b5a6_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue := VAR_MUX_uxn_device_h_l116_c27_b5a6_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_right := VAR_MUX_uxn_device_h_l117_c27_a456_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue := VAR_MUX_uxn_device_h_l117_c27_a456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output;
     VAR_device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_9b56_return_output;
     -- device_ram_read[uxn_device_h_l115_c14_9f46] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l115_c14_9f46_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l115_c14_9f46_address <= VAR_device_ram_read_uxn_device_h_l115_c14_9f46_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l115_c14_9f46_return_output := device_ram_read_uxn_device_h_l115_c14_9f46_return_output;

     -- BIN_OP_AND[uxn_device_h_l118_c7_3c46] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_3c46_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_left;
     BIN_OP_AND_uxn_device_h_l118_c7_3c46_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output := BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_bced] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_db16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_bced] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_5a29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_3c46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_db16_return_output;
     VAR_device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_5a29_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_7acb_d := VAR_device_ram_read_uxn_device_h_l115_c14_9f46_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_bced_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_bced_return_output;
     -- system_deo[uxn_device_h_l115_c3_7acb] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_7acb_d <= VAR_system_deo_uxn_device_h_l115_c3_7acb_d;
     system_deo_uxn_device_h_l115_c3_7acb_device_port <= VAR_system_deo_uxn_device_h_l115_c3_7acb_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_8b6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_457c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output;

     -- device_ram_read[uxn_device_h_l131_c15_7637] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l131_c15_7637_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l131_c15_7637_address <= VAR_device_ram_read_uxn_device_h_l131_c15_7637_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l131_c15_7637_return_output := device_ram_read_uxn_device_h_l131_c15_7637_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_5e4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5e4b_return_output;
     VAR_device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_457c_return_output;
     VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8b6a_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_0027_d := VAR_device_ram_read_uxn_device_h_l131_c15_7637_return_output;
     -- device_ram_read[uxn_device_h_l127_c19_b499] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l127_c19_b499_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l127_c19_b499_address <= VAR_device_ram_read_uxn_device_h_l127_c19_b499_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l127_c19_b499_return_output := device_ram_read_uxn_device_h_l127_c19_b499_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_7a49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c351] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output;

     -- device_ram_read[uxn_device_h_l134_c14_0fe2] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l134_c14_0fe2_address <= VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_return_output := device_ram_read_uxn_device_h_l134_c14_0fe2_return_output;

     -- console_deo[uxn_device_h_l131_c3_0027] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_0027_d <= VAR_console_deo_uxn_device_h_l131_c3_0027_d;
     console_deo_uxn_device_h_l131_c3_0027_device_port <= VAR_console_deo_uxn_device_h_l131_c3_0027_device_port;
     -- Outputs

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_7a49_return_output;
     VAR_device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c351_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_9912_device_port := VAR_device_ram_read_uxn_device_h_l127_c19_b499_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_4916_d := VAR_device_ram_read_uxn_device_h_l134_c14_0fe2_return_output;
     -- screen_palette[uxn_device_h_l127_c4_9912] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_9912_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_9912_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_e1b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output;

     -- screen_deo[uxn_device_h_l134_c3_4916] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_4916_d <= VAR_screen_deo_uxn_device_h_l134_c3_4916_d;
     screen_deo_uxn_device_h_l134_c3_4916_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_4916_device_port;
     -- Outputs

     -- device_ram_read[uxn_device_h_l137_c15_9793] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l137_c15_9793_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l137_c15_9793_address <= VAR_device_ram_read_uxn_device_h_l137_c15_9793_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l137_c15_9793_return_output := device_ram_read_uxn_device_h_l137_c15_9793_return_output;

     -- Submodule level 7
     VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_e1b4_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_5e65_d := VAR_device_ram_read_uxn_device_h_l137_c15_9793_return_output;
     -- device_ram_read[uxn_device_h_l140_c15_3dd2] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l140_c15_3dd2_address <= VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_return_output := device_ram_read_uxn_device_h_l140_c15_3dd2_return_output;

     -- file_deo[uxn_device_h_l137_c3_5e65] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_5e65_file_index <= VAR_file_deo_uxn_device_h_l137_c3_5e65_file_index;
     file_deo_uxn_device_h_l137_c3_5e65_d <= VAR_file_deo_uxn_device_h_l137_c3_5e65_d;
     file_deo_uxn_device_h_l137_c3_5e65_p <= VAR_file_deo_uxn_device_h_l137_c3_5e65_p;
     -- Outputs

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_d6ef_d := VAR_device_ram_read_uxn_device_h_l140_c15_3dd2_return_output;
     -- file_deo[uxn_device_h_l140_c3_d6ef] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_d6ef_file_index <= VAR_file_deo_uxn_device_h_l140_c3_d6ef_file_index;
     file_deo_uxn_device_h_l140_c3_d6ef_d <= VAR_file_deo_uxn_device_h_l140_c3_d6ef_d;
     file_deo_uxn_device_h_l140_c3_d6ef_p <= VAR_file_deo_uxn_device_h_l140_c3_d6ef_p;
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
