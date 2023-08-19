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
entity uxn_deo_0CLK_9122e432 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr : in unsigned(7 downto 0));
end uxn_deo_0CLK_9122e432;
architecture arch of uxn_deo_0CLK_9122e432 is
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
-- BIN_OP_AND[uxn_device_h_l112_c16_badb]
signal BIN_OP_AND_uxn_device_h_l112_c16_badb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_badb_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_3657]
signal BIN_OP_AND_uxn_device_h_l113_c17_3657_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_3657_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_8472]
signal BIN_OP_EQ_uxn_device_h_l114_c6_8472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_8472_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_6338]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_6c77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_1b43]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_1b43]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l115_c14_bad2]
signal peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l115_c14_bad2_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l115_c14_bad2_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_667e]
signal system_deo_uxn_device_h_l115_c3_667e_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_667e_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_059d]
signal BIN_OP_GT_uxn_device_h_l116_c27_059d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_059d_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_14d7]
signal MUX_uxn_device_h_l116_c27_14d7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_14d7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_14d7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_14d7_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_4bc1]
signal BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_8d5c]
signal MUX_uxn_device_h_l117_c27_8d5c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_8d5c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_8d5c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_8d5c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_f187]
signal BIN_OP_AND_uxn_device_h_l118_c7_f187_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_f187_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_e187]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l127_c19_40d7]
signal peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l127_c19_40d7_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l127_c19_40d7_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_0f4d]
signal screen_palette_uxn_device_h_l127_c4_0f4d_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_91c1]
signal BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_17be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_8c1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l131_c15_3e2d]
signal peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l131_c15_3e2d_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l131_c15_3e2d_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_acc1]
signal console_deo_uxn_device_h_l131_c3_acc1_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_acc1_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_a002]
signal BIN_OP_EQ_uxn_device_h_l133_c11_a002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_a002_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_ef73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_060e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l134_c14_49ef]
signal peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l134_c14_49ef_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l134_c14_49ef_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_7991]
signal screen_deo_uxn_device_h_l134_c3_7991_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_7991_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_ae3f]
signal BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_0648]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_94c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l137_c15_ea7f]
signal peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l137_c15_ea7f_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l137_c15_ea7f_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_e1d5]
signal file_deo_uxn_device_h_l137_c3_e1d5_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_e1d5_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_e1d5_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_2501]
signal BIN_OP_EQ_uxn_device_h_l139_c11_2501_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_2501_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_8355]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l140_c15_46c5]
signal peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l140_c15_46c5_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l140_c15_46c5_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_9dcc]
signal file_deo_uxn_device_h_l140_c3_9dcc_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_9dcc_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_9dcc_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_badb
BIN_OP_AND_uxn_device_h_l112_c16_badb : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_badb_left,
BIN_OP_AND_uxn_device_h_l112_c16_badb_right,
BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_3657
BIN_OP_AND_uxn_device_h_l113_c17_3657 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_3657_left,
BIN_OP_AND_uxn_device_h_l113_c17_3657_right,
BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_8472
BIN_OP_EQ_uxn_device_h_l114_c6_8472 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_8472_left,
BIN_OP_EQ_uxn_device_h_l114_c6_8472_right,
BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43
port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43
port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output);

-- peek_dev_uxn_device_h_l115_c14_bad2
peek_dev_uxn_device_h_l115_c14_bad2 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE,
peek_dev_uxn_device_h_l115_c14_bad2_address,
peek_dev_uxn_device_h_l115_c14_bad2_return_output);

-- system_deo_uxn_device_h_l115_c3_667e
system_deo_uxn_device_h_l115_c3_667e : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_667e_d,
system_deo_uxn_device_h_l115_c3_667e_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_059d
BIN_OP_GT_uxn_device_h_l116_c27_059d : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_059d_left,
BIN_OP_GT_uxn_device_h_l116_c27_059d_right,
BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output);

-- MUX_uxn_device_h_l116_c27_14d7
MUX_uxn_device_h_l116_c27_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_14d7_cond,
MUX_uxn_device_h_l116_c27_14d7_iftrue,
MUX_uxn_device_h_l116_c27_14d7_iffalse,
MUX_uxn_device_h_l116_c27_14d7_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_4bc1
BIN_OP_LT_uxn_device_h_l117_c27_4bc1 : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left,
BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right,
BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output);

-- MUX_uxn_device_h_l117_c27_8d5c
MUX_uxn_device_h_l117_c27_8d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_8d5c_cond,
MUX_uxn_device_h_l117_c27_8d5c_iftrue,
MUX_uxn_device_h_l117_c27_8d5c_iffalse,
MUX_uxn_device_h_l117_c27_8d5c_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_f187
BIN_OP_AND_uxn_device_h_l118_c7_f187 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_f187_left,
BIN_OP_AND_uxn_device_h_l118_c7_f187_right,
BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output);

-- peek_dev_uxn_device_h_l127_c19_40d7
peek_dev_uxn_device_h_l127_c19_40d7 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE,
peek_dev_uxn_device_h_l127_c19_40d7_address,
peek_dev_uxn_device_h_l127_c19_40d7_return_output);

-- screen_palette_uxn_device_h_l127_c4_0f4d
screen_palette_uxn_device_h_l127_c4_0f4d : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_0f4d_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_91c1
BIN_OP_EQ_uxn_device_h_l130_c11_91c1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left,
BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right,
BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output);

-- peek_dev_uxn_device_h_l131_c15_3e2d
peek_dev_uxn_device_h_l131_c15_3e2d : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE,
peek_dev_uxn_device_h_l131_c15_3e2d_address,
peek_dev_uxn_device_h_l131_c15_3e2d_return_output);

-- console_deo_uxn_device_h_l131_c3_acc1
console_deo_uxn_device_h_l131_c3_acc1 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_acc1_d,
console_deo_uxn_device_h_l131_c3_acc1_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_a002
BIN_OP_EQ_uxn_device_h_l133_c11_a002 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_a002_left,
BIN_OP_EQ_uxn_device_h_l133_c11_a002_right,
BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output);

-- peek_dev_uxn_device_h_l134_c14_49ef
peek_dev_uxn_device_h_l134_c14_49ef : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE,
peek_dev_uxn_device_h_l134_c14_49ef_address,
peek_dev_uxn_device_h_l134_c14_49ef_return_output);

-- screen_deo_uxn_device_h_l134_c3_7991
screen_deo_uxn_device_h_l134_c3_7991 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_7991_d,
screen_deo_uxn_device_h_l134_c3_7991_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_ae3f
BIN_OP_EQ_uxn_device_h_l136_c11_ae3f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left,
BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right,
BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output);

-- peek_dev_uxn_device_h_l137_c15_ea7f
peek_dev_uxn_device_h_l137_c15_ea7f : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE,
peek_dev_uxn_device_h_l137_c15_ea7f_address,
peek_dev_uxn_device_h_l137_c15_ea7f_return_output);

-- file_deo_uxn_device_h_l137_c3_e1d5
file_deo_uxn_device_h_l137_c3_e1d5 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_e1d5_file_index,
file_deo_uxn_device_h_l137_c3_e1d5_d,
file_deo_uxn_device_h_l137_c3_e1d5_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_2501
BIN_OP_EQ_uxn_device_h_l139_c11_2501 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_2501_left,
BIN_OP_EQ_uxn_device_h_l139_c11_2501_right,
BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output);

-- peek_dev_uxn_device_h_l140_c15_46c5
peek_dev_uxn_device_h_l140_c15_46c5 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE,
peek_dev_uxn_device_h_l140_c15_46c5_address,
peek_dev_uxn_device_h_l140_c15_46c5_return_output);

-- file_deo_uxn_device_h_l140_c3_9dcc
file_deo_uxn_device_h_l140_c3_9dcc : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_9dcc_file_index,
file_deo_uxn_device_h_l140_c3_9dcc_d,
file_deo_uxn_device_h_l140_c3_9dcc_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output,
 peek_dev_uxn_device_h_l115_c14_bad2_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output,
 MUX_uxn_device_h_l116_c27_14d7_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output,
 MUX_uxn_device_h_l117_c27_8d5c_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output,
 peek_dev_uxn_device_h_l127_c19_40d7_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output,
 peek_dev_uxn_device_h_l131_c15_3e2d_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output,
 peek_dev_uxn_device_h_l134_c14_49ef_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output,
 peek_dev_uxn_device_h_l137_c15_ea7f_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output,
 peek_dev_uxn_device_h_l140_c15_46c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_667e_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_667e_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_bad2_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_bad2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_14d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_14d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_8d5c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_8d5c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_8d5c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_8d5c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_0f4d_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_40d7_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_40d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_acc1_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_acc1_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3e2d_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3e2d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_7991_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_7991_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_49ef_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_49ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_e1d5_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_e1d5_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_e1d5_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_ea7f_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_ea7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_9dcc_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_9dcc_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_9dcc_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_46c5_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_46c5_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right := to_unsigned(16, 5);
     VAR_MUX_uxn_device_h_l116_c27_14d7_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_right := to_unsigned(32, 6);
     VAR_MUX_uxn_device_h_l116_c27_14d7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l117_c27_8d5c_iftrue := to_unsigned(1, 1);
     VAR_file_deo_uxn_device_h_l137_c3_e1d5_file_index := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l140_c3_9dcc_file_index := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l117_c27_8d5c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_right := to_unsigned(176, 8);
     VAR_peek_dev_uxn_device_h_l127_c19_40d7_address := resize(to_unsigned(8, 4), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l112_c16_badb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_badb_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_left;
     BIN_OP_AND_uxn_device_h_l112_c16_badb_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output := BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;

     -- BIN_OP_AND[uxn_device_h_l113_c17_3657] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_3657_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_left;
     BIN_OP_AND_uxn_device_h_l113_c17_3657_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output := BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_acc1_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_e1d5_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_9dcc_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_7991_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_667e_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_badb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_bad2_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_3e2d_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_49ef_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_ea7f_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     VAR_peek_dev_uxn_device_h_l140_c15_46c5_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_3657_return_output;
     -- BIN_OP_EQ[uxn_device_h_l136_c11_ae3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output;

     -- BIN_OP_LT[uxn_device_h_l117_c27_4bc1] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_left;
     BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output := BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_a002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_a002_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_a002_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c6_8472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_8472_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_8472_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_91c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_2501] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_2501_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_2501_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output;

     -- BIN_OP_GT[uxn_device_h_l116_c27_059d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_059d_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_left;
     BIN_OP_GT_uxn_device_h_l116_c27_059d_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output := BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_8472_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_91c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_a002_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_ae3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2501_return_output;
     VAR_MUX_uxn_device_h_l116_c27_14d7_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_059d_return_output;
     VAR_MUX_uxn_device_h_l117_c27_8d5c_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_4bc1_return_output;
     -- MUX[uxn_device_h_l117_c27_8d5c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_8d5c_cond <= VAR_MUX_uxn_device_h_l117_c27_8d5c_cond;
     MUX_uxn_device_h_l117_c27_8d5c_iftrue <= VAR_MUX_uxn_device_h_l117_c27_8d5c_iftrue;
     MUX_uxn_device_h_l117_c27_8d5c_iffalse <= VAR_MUX_uxn_device_h_l117_c27_8d5c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_8d5c_return_output := MUX_uxn_device_h_l117_c27_8d5c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_6c77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_6338] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output;

     -- MUX[uxn_device_h_l116_c27_14d7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_14d7_cond <= VAR_MUX_uxn_device_h_l116_c27_14d7_cond;
     MUX_uxn_device_h_l116_c27_14d7_iftrue <= VAR_MUX_uxn_device_h_l116_c27_14d7_iftrue;
     MUX_uxn_device_h_l116_c27_14d7_iffalse <= VAR_MUX_uxn_device_h_l116_c27_14d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_14d7_return_output := MUX_uxn_device_h_l116_c27_14d7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_6c77_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_left := VAR_MUX_uxn_device_h_l116_c27_14d7_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue := VAR_MUX_uxn_device_h_l116_c27_14d7_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_right := VAR_MUX_uxn_device_h_l117_c27_8d5c_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue := VAR_MUX_uxn_device_h_l117_c27_8d5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_6338_return_output;
     -- BIN_OP_AND[uxn_device_h_l118_c7_f187] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_f187_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_left;
     BIN_OP_AND_uxn_device_h_l118_c7_f187_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output := BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_1b43] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output;

     -- peek_dev[uxn_device_h_l115_c14_bad2] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l115_c14_bad2_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l115_c14_bad2_address <= VAR_peek_dev_uxn_device_h_l115_c14_bad2_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l115_c14_bad2_return_output := peek_dev_uxn_device_h_l115_c14_bad2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_8c1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_17be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_1b43] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_f187_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_8c1d_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_17be_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_667e_d := VAR_peek_dev_uxn_device_h_l115_c14_bad2_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_1b43_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_1b43_return_output;
     -- peek_dev[uxn_device_h_l131_c15_3e2d] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l131_c15_3e2d_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l131_c15_3e2d_address <= VAR_peek_dev_uxn_device_h_l131_c15_3e2d_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l131_c15_3e2d_return_output := peek_dev_uxn_device_h_l131_c15_3e2d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_ef73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_e187] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output;

     -- system_deo[uxn_device_h_l115_c3_667e] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_667e_d <= VAR_system_deo_uxn_device_h_l115_c3_667e_d;
     system_deo_uxn_device_h_l115_c3_667e_device_port <= VAR_system_deo_uxn_device_h_l115_c3_667e_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_060e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_060e_return_output;
     VAR_peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e187_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_ef73_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_acc1_d := VAR_peek_dev_uxn_device_h_l131_c15_3e2d_return_output;
     -- peek_dev[uxn_device_h_l127_c19_40d7] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l127_c19_40d7_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l127_c19_40d7_address <= VAR_peek_dev_uxn_device_h_l127_c19_40d7_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l127_c19_40d7_return_output := peek_dev_uxn_device_h_l127_c19_40d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_0648] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_94c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output;

     -- peek_dev[uxn_device_h_l134_c14_49ef] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l134_c14_49ef_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l134_c14_49ef_address <= VAR_peek_dev_uxn_device_h_l134_c14_49ef_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l134_c14_49ef_return_output := peek_dev_uxn_device_h_l134_c14_49ef_return_output;

     -- console_deo[uxn_device_h_l131_c3_acc1] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_acc1_d <= VAR_console_deo_uxn_device_h_l131_c3_acc1_d;
     console_deo_uxn_device_h_l131_c3_acc1_device_port <= VAR_console_deo_uxn_device_h_l131_c3_acc1_device_port;
     -- Outputs

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_94c8_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_0648_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_0f4d_device_port := VAR_peek_dev_uxn_device_h_l127_c19_40d7_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_7991_d := VAR_peek_dev_uxn_device_h_l134_c14_49ef_return_output;
     -- peek_dev[uxn_device_h_l137_c15_ea7f] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l137_c15_ea7f_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l137_c15_ea7f_address <= VAR_peek_dev_uxn_device_h_l137_c15_ea7f_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l137_c15_ea7f_return_output := peek_dev_uxn_device_h_l137_c15_ea7f_return_output;

     -- screen_deo[uxn_device_h_l134_c3_7991] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_7991_d <= VAR_screen_deo_uxn_device_h_l134_c3_7991_d;
     screen_deo_uxn_device_h_l134_c3_7991_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_7991_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l127_c4_0f4d] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_0f4d_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_0f4d_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_8355] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output;

     -- Submodule level 7
     VAR_peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_8355_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_e1d5_d := VAR_peek_dev_uxn_device_h_l137_c15_ea7f_return_output;
     -- file_deo[uxn_device_h_l137_c3_e1d5] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_e1d5_file_index <= VAR_file_deo_uxn_device_h_l137_c3_e1d5_file_index;
     file_deo_uxn_device_h_l137_c3_e1d5_d <= VAR_file_deo_uxn_device_h_l137_c3_e1d5_d;
     file_deo_uxn_device_h_l137_c3_e1d5_p <= VAR_file_deo_uxn_device_h_l137_c3_e1d5_p;
     -- Outputs

     -- peek_dev[uxn_device_h_l140_c15_46c5] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l140_c15_46c5_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l140_c15_46c5_address <= VAR_peek_dev_uxn_device_h_l140_c15_46c5_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l140_c15_46c5_return_output := peek_dev_uxn_device_h_l140_c15_46c5_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_9dcc_d := VAR_peek_dev_uxn_device_h_l140_c15_46c5_return_output;
     -- file_deo[uxn_device_h_l140_c3_9dcc] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_9dcc_file_index <= VAR_file_deo_uxn_device_h_l140_c3_9dcc_file_index;
     file_deo_uxn_device_h_l140_c3_9dcc_d <= VAR_file_deo_uxn_device_h_l140_c3_9dcc_d;
     file_deo_uxn_device_h_l140_c3_9dcc_p <= VAR_file_deo_uxn_device_h_l140_c3_9dcc_p;
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
