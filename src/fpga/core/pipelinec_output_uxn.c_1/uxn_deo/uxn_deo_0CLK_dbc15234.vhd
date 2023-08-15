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
-- BIN_OP_AND[uxn_device_h_l112_c16_5dc6]
signal BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_2b39]
signal BIN_OP_AND_uxn_device_h_l113_c17_2b39_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_2b39_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_cf8f]
signal BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_d29f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_fd00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_b878]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_b878]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l115_c14_3a61]
signal device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l115_c14_3a61_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l115_c14_3a61_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_5ac5]
signal system_deo_uxn_device_h_l115_c3_5ac5_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_5ac5_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_3139]
signal BIN_OP_GT_uxn_device_h_l116_c27_3139_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_3139_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_7955]
signal MUX_uxn_device_h_l116_c27_7955_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_7955_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_7955_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_7955_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_2a66]
signal BIN_OP_LT_uxn_device_h_l117_c27_2a66_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_2a66_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_22cf]
signal MUX_uxn_device_h_l117_c27_22cf_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_22cf_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_22cf_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_22cf_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_2a27]
signal BIN_OP_AND_uxn_device_h_l118_c7_2a27_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_2a27_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_22c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l127_c19_6c18]
signal device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l127_c19_6c18_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l127_c19_6c18_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_3116]
signal screen_palette_uxn_device_h_l127_c4_3116_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_fdaf]
signal BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_4e9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_792d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l131_c15_d6eb]
signal device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l131_c15_d6eb_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l131_c15_d6eb_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_74ea]
signal console_deo_uxn_device_h_l131_c3_74ea_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_74ea_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_e705]
signal BIN_OP_EQ_uxn_device_h_l133_c11_e705_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_e705_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_0d2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_631d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l134_c14_29c4]
signal device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l134_c14_29c4_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l134_c14_29c4_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_1f38]
signal screen_deo_uxn_device_h_l134_c3_1f38_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_1f38_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_da08]
signal BIN_OP_EQ_uxn_device_h_l136_c11_da08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_da08_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_1634]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_59cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l137_c15_2e94]
signal device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l137_c15_2e94_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l137_c15_2e94_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_af6c]
signal file_deo_uxn_device_h_l137_c3_af6c_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_af6c_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_af6c_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_3ed9]
signal BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_f956]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l140_c15_4ee7]
signal device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l140_c15_4ee7_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l140_c15_4ee7_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_77e4]
signal file_deo_uxn_device_h_l140_c3_77e4_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_77e4_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_77e4_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_5dc6
BIN_OP_AND_uxn_device_h_l112_c16_5dc6 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left,
BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right,
BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_2b39
BIN_OP_AND_uxn_device_h_l113_c17_2b39 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_2b39_left,
BIN_OP_AND_uxn_device_h_l113_c17_2b39_right,
BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_cf8f
BIN_OP_EQ_uxn_device_h_l114_c6_cf8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left,
BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right,
BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878
port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878
port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output);

-- device_ram_read_uxn_device_h_l115_c14_3a61
device_ram_read_uxn_device_h_l115_c14_3a61 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l115_c14_3a61_address,
device_ram_read_uxn_device_h_l115_c14_3a61_return_output);

-- system_deo_uxn_device_h_l115_c3_5ac5
system_deo_uxn_device_h_l115_c3_5ac5 : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_5ac5_d,
system_deo_uxn_device_h_l115_c3_5ac5_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_3139
BIN_OP_GT_uxn_device_h_l116_c27_3139 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_3139_left,
BIN_OP_GT_uxn_device_h_l116_c27_3139_right,
BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output);

-- MUX_uxn_device_h_l116_c27_7955
MUX_uxn_device_h_l116_c27_7955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_7955_cond,
MUX_uxn_device_h_l116_c27_7955_iftrue,
MUX_uxn_device_h_l116_c27_7955_iffalse,
MUX_uxn_device_h_l116_c27_7955_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_2a66
BIN_OP_LT_uxn_device_h_l117_c27_2a66 : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_2a66_left,
BIN_OP_LT_uxn_device_h_l117_c27_2a66_right,
BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output);

-- MUX_uxn_device_h_l117_c27_22cf
MUX_uxn_device_h_l117_c27_22cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_22cf_cond,
MUX_uxn_device_h_l117_c27_22cf_iftrue,
MUX_uxn_device_h_l117_c27_22cf_iffalse,
MUX_uxn_device_h_l117_c27_22cf_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_2a27
BIN_OP_AND_uxn_device_h_l118_c7_2a27 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_2a27_left,
BIN_OP_AND_uxn_device_h_l118_c7_2a27_right,
BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output);

-- device_ram_read_uxn_device_h_l127_c19_6c18
device_ram_read_uxn_device_h_l127_c19_6c18 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l127_c19_6c18_address,
device_ram_read_uxn_device_h_l127_c19_6c18_return_output);

-- screen_palette_uxn_device_h_l127_c4_3116
screen_palette_uxn_device_h_l127_c4_3116 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_3116_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_fdaf
BIN_OP_EQ_uxn_device_h_l130_c11_fdaf : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left,
BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right,
BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output);

-- device_ram_read_uxn_device_h_l131_c15_d6eb
device_ram_read_uxn_device_h_l131_c15_d6eb : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l131_c15_d6eb_address,
device_ram_read_uxn_device_h_l131_c15_d6eb_return_output);

-- console_deo_uxn_device_h_l131_c3_74ea
console_deo_uxn_device_h_l131_c3_74ea : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_74ea_d,
console_deo_uxn_device_h_l131_c3_74ea_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_e705
BIN_OP_EQ_uxn_device_h_l133_c11_e705 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_e705_left,
BIN_OP_EQ_uxn_device_h_l133_c11_e705_right,
BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output);

-- device_ram_read_uxn_device_h_l134_c14_29c4
device_ram_read_uxn_device_h_l134_c14_29c4 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l134_c14_29c4_address,
device_ram_read_uxn_device_h_l134_c14_29c4_return_output);

-- screen_deo_uxn_device_h_l134_c3_1f38
screen_deo_uxn_device_h_l134_c3_1f38 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_1f38_d,
screen_deo_uxn_device_h_l134_c3_1f38_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_da08
BIN_OP_EQ_uxn_device_h_l136_c11_da08 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_da08_left,
BIN_OP_EQ_uxn_device_h_l136_c11_da08_right,
BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output);

-- device_ram_read_uxn_device_h_l137_c15_2e94
device_ram_read_uxn_device_h_l137_c15_2e94 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l137_c15_2e94_address,
device_ram_read_uxn_device_h_l137_c15_2e94_return_output);

-- file_deo_uxn_device_h_l137_c3_af6c
file_deo_uxn_device_h_l137_c3_af6c : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_af6c_file_index,
file_deo_uxn_device_h_l137_c3_af6c_d,
file_deo_uxn_device_h_l137_c3_af6c_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_3ed9
BIN_OP_EQ_uxn_device_h_l139_c11_3ed9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left,
BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right,
BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output);

-- device_ram_read_uxn_device_h_l140_c15_4ee7
device_ram_read_uxn_device_h_l140_c15_4ee7 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l140_c15_4ee7_address,
device_ram_read_uxn_device_h_l140_c15_4ee7_return_output);

-- file_deo_uxn_device_h_l140_c3_77e4
file_deo_uxn_device_h_l140_c3_77e4 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_77e4_file_index,
file_deo_uxn_device_h_l140_c3_77e4_d,
file_deo_uxn_device_h_l140_c3_77e4_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output,
 device_ram_read_uxn_device_h_l115_c14_3a61_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output,
 MUX_uxn_device_h_l116_c27_7955_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output,
 MUX_uxn_device_h_l117_c27_22cf_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output,
 device_ram_read_uxn_device_h_l127_c19_6c18_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output,
 device_ram_read_uxn_device_h_l131_c15_d6eb_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output,
 device_ram_read_uxn_device_h_l134_c14_29c4_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output,
 device_ram_read_uxn_device_h_l137_c15_2e94_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output,
 device_ram_read_uxn_device_h_l140_c15_4ee7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_5ac5_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_5ac5_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_3a61_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l115_c14_3a61_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_7955_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_7955_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_7955_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_7955_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_22cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_22cf_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_22cf_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_22cf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_3116_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_6c18_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l127_c19_6c18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_74ea_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_74ea_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_1f38_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_1f38_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_29c4_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l134_c14_29c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_af6c_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_af6c_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_af6c_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_2e94_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l137_c15_2e94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_77e4_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_77e4_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_77e4_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_device_h_l116_c27_7955_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l117_c27_22cf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l117_c27_22cf_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right := to_unsigned(16, 5);
     VAR_MUX_uxn_device_h_l116_c27_7955_iftrue := to_unsigned(1, 1);
     VAR_device_ram_read_uxn_device_h_l127_c19_6c18_address := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_right := to_unsigned(240, 8);
     VAR_file_deo_uxn_device_h_l140_c3_77e4_file_index := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l137_c3_af6c_file_index := to_unsigned(0, 1);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right := to_unsigned(176, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_right := to_unsigned(32, 6);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l113_c17_2b39] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_2b39_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_left;
     BIN_OP_AND_uxn_device_h_l113_c17_2b39_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output := BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;

     -- BIN_OP_AND[uxn_device_h_l112_c16_5dc6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_left;
     BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output := BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_74ea_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_af6c_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_77e4_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_1f38_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_5ac5_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_5dc6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_device_ram_read_uxn_device_h_l115_c14_3a61_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_device_ram_read_uxn_device_h_l134_c14_29c4_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_device_ram_read_uxn_device_h_l137_c15_2e94_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_2b39_return_output;
     -- BIN_OP_EQ[uxn_device_h_l114_c6_cf8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output;

     -- BIN_OP_GT[uxn_device_h_l116_c27_3139] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_3139_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_left;
     BIN_OP_GT_uxn_device_h_l116_c27_3139_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output := BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_fdaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_da08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_da08_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_da08_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_e705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_e705_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_e705_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output;

     -- BIN_OP_LT[uxn_device_h_l117_c27_2a66] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_2a66_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_left;
     BIN_OP_LT_uxn_device_h_l117_c27_2a66_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output := BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_3ed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_cf8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_fdaf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_e705_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_da08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_3ed9_return_output;
     VAR_MUX_uxn_device_h_l116_c27_7955_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_3139_return_output;
     VAR_MUX_uxn_device_h_l117_c27_22cf_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_2a66_return_output;
     -- MUX[uxn_device_h_l116_c27_7955] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_7955_cond <= VAR_MUX_uxn_device_h_l116_c27_7955_cond;
     MUX_uxn_device_h_l116_c27_7955_iftrue <= VAR_MUX_uxn_device_h_l116_c27_7955_iftrue;
     MUX_uxn_device_h_l116_c27_7955_iffalse <= VAR_MUX_uxn_device_h_l116_c27_7955_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_7955_return_output := MUX_uxn_device_h_l116_c27_7955_return_output;

     -- MUX[uxn_device_h_l117_c27_22cf] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_22cf_cond <= VAR_MUX_uxn_device_h_l117_c27_22cf_cond;
     MUX_uxn_device_h_l117_c27_22cf_iftrue <= VAR_MUX_uxn_device_h_l117_c27_22cf_iftrue;
     MUX_uxn_device_h_l117_c27_22cf_iffalse <= VAR_MUX_uxn_device_h_l117_c27_22cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_22cf_return_output := MUX_uxn_device_h_l117_c27_22cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_fd00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_d29f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_fd00_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_left := VAR_MUX_uxn_device_h_l116_c27_7955_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue := VAR_MUX_uxn_device_h_l116_c27_7955_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_right := VAR_MUX_uxn_device_h_l117_c27_22cf_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue := VAR_MUX_uxn_device_h_l117_c27_22cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output;
     VAR_device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_d29f_return_output;
     -- BIN_OP_AND[uxn_device_h_l118_c7_2a27] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_2a27_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_left;
     BIN_OP_AND_uxn_device_h_l118_c7_2a27_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output := BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output;

     -- device_ram_read[uxn_device_h_l115_c14_3a61] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l115_c14_3a61_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l115_c14_3a61_address <= VAR_device_ram_read_uxn_device_h_l115_c14_3a61_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l115_c14_3a61_return_output := device_ram_read_uxn_device_h_l115_c14_3a61_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_b878] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_b878] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_4e9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_792d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_2a27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_792d_return_output;
     VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_4e9d_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_5ac5_d := VAR_device_ram_read_uxn_device_h_l115_c14_3a61_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_b878_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_b878_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_0d2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_631d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output;

     -- system_deo[uxn_device_h_l115_c3_5ac5] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_5ac5_d <= VAR_system_deo_uxn_device_h_l115_c3_5ac5_d;
     system_deo_uxn_device_h_l115_c3_5ac5_device_port <= VAR_system_deo_uxn_device_h_l115_c3_5ac5_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_22c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output;

     -- device_ram_read[uxn_device_h_l131_c15_d6eb] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l131_c15_d6eb_address <= VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_return_output := device_ram_read_uxn_device_h_l131_c15_d6eb_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_631d_return_output;
     VAR_device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_22c8_return_output;
     VAR_device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_0d2c_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_74ea_d := VAR_device_ram_read_uxn_device_h_l131_c15_d6eb_return_output;
     -- device_ram_read[uxn_device_h_l134_c14_29c4] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l134_c14_29c4_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l134_c14_29c4_address <= VAR_device_ram_read_uxn_device_h_l134_c14_29c4_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l134_c14_29c4_return_output := device_ram_read_uxn_device_h_l134_c14_29c4_return_output;

     -- device_ram_read[uxn_device_h_l127_c19_6c18] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l127_c19_6c18_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l127_c19_6c18_address <= VAR_device_ram_read_uxn_device_h_l127_c19_6c18_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l127_c19_6c18_return_output := device_ram_read_uxn_device_h_l127_c19_6c18_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_1634] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output;

     -- console_deo[uxn_device_h_l131_c3_74ea] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_74ea_d <= VAR_console_deo_uxn_device_h_l131_c3_74ea_d;
     console_deo_uxn_device_h_l131_c3_74ea_device_port <= VAR_console_deo_uxn_device_h_l131_c3_74ea_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_59cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_59cc_return_output;
     VAR_device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_1634_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_3116_device_port := VAR_device_ram_read_uxn_device_h_l127_c19_6c18_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_1f38_d := VAR_device_ram_read_uxn_device_h_l134_c14_29c4_return_output;
     -- screen_palette[uxn_device_h_l127_c4_3116] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_3116_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_3116_device_port;
     -- Outputs

     -- device_ram_read[uxn_device_h_l137_c15_2e94] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l137_c15_2e94_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l137_c15_2e94_address <= VAR_device_ram_read_uxn_device_h_l137_c15_2e94_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l137_c15_2e94_return_output := device_ram_read_uxn_device_h_l137_c15_2e94_return_output;

     -- screen_deo[uxn_device_h_l134_c3_1f38] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_1f38_d <= VAR_screen_deo_uxn_device_h_l134_c3_1f38_d;
     screen_deo_uxn_device_h_l134_c3_1f38_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_1f38_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_f956] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output;

     -- Submodule level 7
     VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_f956_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_af6c_d := VAR_device_ram_read_uxn_device_h_l137_c15_2e94_return_output;
     -- file_deo[uxn_device_h_l137_c3_af6c] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_af6c_file_index <= VAR_file_deo_uxn_device_h_l137_c3_af6c_file_index;
     file_deo_uxn_device_h_l137_c3_af6c_d <= VAR_file_deo_uxn_device_h_l137_c3_af6c_d;
     file_deo_uxn_device_h_l137_c3_af6c_p <= VAR_file_deo_uxn_device_h_l137_c3_af6c_p;
     -- Outputs

     -- device_ram_read[uxn_device_h_l140_c15_4ee7] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l140_c15_4ee7_address <= VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_return_output := device_ram_read_uxn_device_h_l140_c15_4ee7_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_77e4_d := VAR_device_ram_read_uxn_device_h_l140_c15_4ee7_return_output;
     -- file_deo[uxn_device_h_l140_c3_77e4] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_77e4_file_index <= VAR_file_deo_uxn_device_h_l140_c3_77e4_file_index;
     file_deo_uxn_device_h_l140_c3_77e4_d <= VAR_file_deo_uxn_device_h_l140_c3_77e4_d;
     file_deo_uxn_device_h_l140_c3_77e4_p <= VAR_file_deo_uxn_device_h_l140_c3_77e4_p;
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
