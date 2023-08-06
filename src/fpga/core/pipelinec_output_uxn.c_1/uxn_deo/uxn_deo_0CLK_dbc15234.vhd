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
-- BIN_OP_AND[uxn_device_h_l183_c16_0ecd]
signal BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l184_c17_eded]
signal BIN_OP_AND_uxn_device_h_l184_c17_eded_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l184_c17_eded_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l185_c6_2707]
signal BIN_OP_EQ_uxn_device_h_l185_c6_2707_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c6_2707_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c1_2e26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c7_7ddb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l185_c2_9809]
signal port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l185_c2_9809]
signal port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l186_c14_7b22]
signal device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l186_c14_7b22_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l186_c14_7b22_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l186_c3_de62]
signal system_deo_uxn_device_h_l186_c3_de62_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l186_c3_de62_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l187_c27_245a]
signal BIN_OP_GT_uxn_device_h_l187_c27_245a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l187_c27_245a_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l187_c27_ee14]
signal MUX_uxn_device_h_l187_c27_ee14_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l187_c27_ee14_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l187_c27_ee14_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l187_c27_ee14_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l188_c27_07b5]
signal BIN_OP_LT_uxn_device_h_l188_c27_07b5_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l188_c27_07b5_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l188_c27_31f2]
signal MUX_uxn_device_h_l188_c27_31f2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c27_31f2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c27_31f2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c27_31f2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l189_c7_4f8e]
signal BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l189_c1_f58a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l198_c19_14e6]
signal device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l198_c19_14e6_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l198_c19_14e6_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l198_c4_8868]
signal screen_palette_uxn_device_h_l198_c4_8868_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l201_c11_ebba]
signal BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_37f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_b9d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l202_c15_fb85]
signal device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l202_c15_fb85_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l202_c15_fb85_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l202_c3_7ec0]
signal console_deo_uxn_device_h_l202_c3_7ec0_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l202_c3_7ec0_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l204_c11_d9ee]
signal BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c1_8d26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c7_50a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l205_c14_3d3a]
signal device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l205_c14_3d3a_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l205_c14_3d3a_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l205_c3_0fbb]
signal screen_deo_uxn_device_h_l205_c3_0fbb_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l205_c3_0fbb_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l207_c11_884f]
signal BIN_OP_EQ_uxn_device_h_l207_c11_884f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l207_c11_884f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c1_9e74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l210_c7_b42e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l208_c15_7d23]
signal device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l208_c15_7d23_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l208_c15_7d23_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l208_c3_04af]
signal file_deo_uxn_device_h_l208_c3_04af_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l208_c3_04af_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l208_c3_04af_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l210_c11_b9f8]
signal BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l210_c1_8df8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_device_h_l211_c15_4608]
signal device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l211_c15_4608_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l211_c15_4608_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l211_c3_cc2f]
signal file_deo_uxn_device_h_l211_c3_cc2f_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l211_c3_cc2f_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l211_c3_cc2f_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l183_c16_0ecd
BIN_OP_AND_uxn_device_h_l183_c16_0ecd : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left,
BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right,
BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output);

-- BIN_OP_AND_uxn_device_h_l184_c17_eded
BIN_OP_AND_uxn_device_h_l184_c17_eded : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l184_c17_eded_left,
BIN_OP_AND_uxn_device_h_l184_c17_eded_right,
BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output);

-- BIN_OP_EQ_uxn_device_h_l185_c6_2707
BIN_OP_EQ_uxn_device_h_l185_c6_2707 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l185_c6_2707_left,
BIN_OP_EQ_uxn_device_h_l185_c6_2707_right,
BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809
port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond,
port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809
port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond,
port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output);

-- device_ram_read_uxn_device_h_l186_c14_7b22
device_ram_read_uxn_device_h_l186_c14_7b22 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l186_c14_7b22_address,
device_ram_read_uxn_device_h_l186_c14_7b22_return_output);

-- system_deo_uxn_device_h_l186_c3_de62
system_deo_uxn_device_h_l186_c3_de62 : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l186_c3_de62_d,
system_deo_uxn_device_h_l186_c3_de62_device_port);

-- BIN_OP_GT_uxn_device_h_l187_c27_245a
BIN_OP_GT_uxn_device_h_l187_c27_245a : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l187_c27_245a_left,
BIN_OP_GT_uxn_device_h_l187_c27_245a_right,
BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output);

-- MUX_uxn_device_h_l187_c27_ee14
MUX_uxn_device_h_l187_c27_ee14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l187_c27_ee14_cond,
MUX_uxn_device_h_l187_c27_ee14_iftrue,
MUX_uxn_device_h_l187_c27_ee14_iffalse,
MUX_uxn_device_h_l187_c27_ee14_return_output);

-- BIN_OP_LT_uxn_device_h_l188_c27_07b5
BIN_OP_LT_uxn_device_h_l188_c27_07b5 : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l188_c27_07b5_left,
BIN_OP_LT_uxn_device_h_l188_c27_07b5_right,
BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output);

-- MUX_uxn_device_h_l188_c27_31f2
MUX_uxn_device_h_l188_c27_31f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l188_c27_31f2_cond,
MUX_uxn_device_h_l188_c27_31f2_iftrue,
MUX_uxn_device_h_l188_c27_31f2_iffalse,
MUX_uxn_device_h_l188_c27_31f2_return_output);

-- BIN_OP_AND_uxn_device_h_l189_c7_4f8e
BIN_OP_AND_uxn_device_h_l189_c7_4f8e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left,
BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right,
BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output);

-- device_ram_read_uxn_device_h_l198_c19_14e6
device_ram_read_uxn_device_h_l198_c19_14e6 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l198_c19_14e6_address,
device_ram_read_uxn_device_h_l198_c19_14e6_return_output);

-- screen_palette_uxn_device_h_l198_c4_8868
screen_palette_uxn_device_h_l198_c4_8868 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l198_c4_8868_device_port);

-- BIN_OP_EQ_uxn_device_h_l201_c11_ebba
BIN_OP_EQ_uxn_device_h_l201_c11_ebba : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left,
BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right,
BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output);

-- device_ram_read_uxn_device_h_l202_c15_fb85
device_ram_read_uxn_device_h_l202_c15_fb85 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l202_c15_fb85_address,
device_ram_read_uxn_device_h_l202_c15_fb85_return_output);

-- console_deo_uxn_device_h_l202_c3_7ec0
console_deo_uxn_device_h_l202_c3_7ec0 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l202_c3_7ec0_d,
console_deo_uxn_device_h_l202_c3_7ec0_device_port);

-- BIN_OP_EQ_uxn_device_h_l204_c11_d9ee
BIN_OP_EQ_uxn_device_h_l204_c11_d9ee : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left,
BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right,
BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output);

-- device_ram_read_uxn_device_h_l205_c14_3d3a
device_ram_read_uxn_device_h_l205_c14_3d3a : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l205_c14_3d3a_address,
device_ram_read_uxn_device_h_l205_c14_3d3a_return_output);

-- screen_deo_uxn_device_h_l205_c3_0fbb
screen_deo_uxn_device_h_l205_c3_0fbb : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l205_c3_0fbb_d,
screen_deo_uxn_device_h_l205_c3_0fbb_device_port);

-- BIN_OP_EQ_uxn_device_h_l207_c11_884f
BIN_OP_EQ_uxn_device_h_l207_c11_884f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l207_c11_884f_left,
BIN_OP_EQ_uxn_device_h_l207_c11_884f_right,
BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output);

-- device_ram_read_uxn_device_h_l208_c15_7d23
device_ram_read_uxn_device_h_l208_c15_7d23 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l208_c15_7d23_address,
device_ram_read_uxn_device_h_l208_c15_7d23_return_output);

-- file_deo_uxn_device_h_l208_c3_04af
file_deo_uxn_device_h_l208_c3_04af : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l208_c3_04af_file_index,
file_deo_uxn_device_h_l208_c3_04af_d,
file_deo_uxn_device_h_l208_c3_04af_p);

-- BIN_OP_EQ_uxn_device_h_l210_c11_b9f8
BIN_OP_EQ_uxn_device_h_l210_c11_b9f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left,
BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right,
BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output);

-- device_ram_read_uxn_device_h_l211_c15_4608
device_ram_read_uxn_device_h_l211_c15_4608 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l211_c15_4608_address,
device_ram_read_uxn_device_h_l211_c15_4608_return_output);

-- file_deo_uxn_device_h_l211_c3_cc2f
file_deo_uxn_device_h_l211_c3_cc2f : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l211_c3_cc2f_file_index,
file_deo_uxn_device_h_l211_c3_cc2f_d,
file_deo_uxn_device_h_l211_c3_cc2f_p);



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
 BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output,
 BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output,
 BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output,
 device_ram_read_uxn_device_h_l186_c14_7b22_return_output,
 BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output,
 MUX_uxn_device_h_l187_c27_ee14_return_output,
 BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output,
 MUX_uxn_device_h_l188_c27_31f2_return_output,
 BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output,
 device_ram_read_uxn_device_h_l198_c19_14e6_return_output,
 BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output,
 device_ram_read_uxn_device_h_l202_c15_fb85_return_output,
 BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output,
 device_ram_read_uxn_device_h_l205_c14_3d3a_return_output,
 BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output,
 device_ram_read_uxn_device_h_l208_c15_7d23_return_output,
 BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output,
 device_ram_read_uxn_device_h_l211_c15_4608_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l186_c3_de62_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l186_c3_de62_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l186_c14_7b22_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l186_c14_7b22_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l187_c27_ee14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l187_c27_ee14_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l187_c27_ee14_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l187_c27_ee14_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c27_31f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c27_31f2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c27_31f2_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c27_31f2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l198_c4_8868_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l198_c19_14e6_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l198_c19_14e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l202_c3_7ec0_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l202_c3_7ec0_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l202_c15_fb85_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l202_c15_fb85_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l205_c3_0fbb_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l205_c3_0fbb_device_port : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l208_c3_04af_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l208_c3_04af_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l208_c3_04af_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l208_c15_7d23_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l208_c15_7d23_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l211_c3_cc2f_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l211_c3_cc2f_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l211_c3_cc2f_p : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l211_c15_4608_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l211_c15_4608_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_device_h_l187_c27_ee14_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right := to_unsigned(176, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l188_c27_31f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l188_c27_31f2_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l211_c3_cc2f_file_index := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right := to_unsigned(32, 6);
     VAR_MUX_uxn_device_h_l187_c27_ee14_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_right := to_unsigned(7, 3);
     VAR_device_ram_read_uxn_device_h_l198_c19_14e6_address := resize(to_unsigned(8, 4), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_right := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l208_c3_04af_file_index := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l184_c17_eded] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l184_c17_eded_left <= VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_left;
     BIN_OP_AND_uxn_device_h_l184_c17_eded_right <= VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output := BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;

     -- BIN_OP_AND[uxn_device_h_l183_c16_0ecd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left <= VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_left;
     BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right <= VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output := BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_left := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_left := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_console_deo_uxn_device_h_l202_c3_7ec0_device_port := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_file_deo_uxn_device_h_l208_c3_04af_p := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_file_deo_uxn_device_h_l211_c3_cc2f_p := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_screen_deo_uxn_device_h_l205_c3_0fbb_device_port := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_system_deo_uxn_device_h_l186_c3_de62_device_port := VAR_BIN_OP_AND_uxn_device_h_l183_c16_0ecd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_left := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_left := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_device_ram_read_uxn_device_h_l186_c14_7b22_address := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_device_ram_read_uxn_device_h_l202_c15_fb85_address := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_address := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_device_ram_read_uxn_device_h_l208_c15_7d23_address := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     VAR_device_ram_read_uxn_device_h_l211_c15_4608_address := VAR_BIN_OP_AND_uxn_device_h_l184_c17_eded_return_output;
     -- BIN_OP_EQ[uxn_device_h_l185_c6_2707] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l185_c6_2707_left <= VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_left;
     BIN_OP_EQ_uxn_device_h_l185_c6_2707_right <= VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output := BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output;

     -- BIN_OP_EQ[uxn_device_h_l201_c11_ebba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_left;
     BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output := BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output;

     -- BIN_OP_EQ[uxn_device_h_l207_c11_884f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l207_c11_884f_left <= VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_left;
     BIN_OP_EQ_uxn_device_h_l207_c11_884f_right <= VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output := BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l204_c11_d9ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_left;
     BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output := BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output;

     -- BIN_OP_LT[uxn_device_h_l188_c27_07b5] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l188_c27_07b5_left <= VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_left;
     BIN_OP_LT_uxn_device_h_l188_c27_07b5_right <= VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output := BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output;

     -- BIN_OP_GT[uxn_device_h_l187_c27_245a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l187_c27_245a_left <= VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_left;
     BIN_OP_GT_uxn_device_h_l187_c27_245a_right <= VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output := BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l210_c11_b9f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left <= VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_left;
     BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right <= VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output := BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c6_2707_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_ebba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d9ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c11_884f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond := VAR_BIN_OP_EQ_uxn_device_h_l210_c11_b9f8_return_output;
     VAR_MUX_uxn_device_h_l187_c27_ee14_cond := VAR_BIN_OP_GT_uxn_device_h_l187_c27_245a_return_output;
     VAR_MUX_uxn_device_h_l188_c27_31f2_cond := VAR_BIN_OP_LT_uxn_device_h_l188_c27_07b5_return_output;
     -- MUX[uxn_device_h_l188_c27_31f2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l188_c27_31f2_cond <= VAR_MUX_uxn_device_h_l188_c27_31f2_cond;
     MUX_uxn_device_h_l188_c27_31f2_iftrue <= VAR_MUX_uxn_device_h_l188_c27_31f2_iftrue;
     MUX_uxn_device_h_l188_c27_31f2_iffalse <= VAR_MUX_uxn_device_h_l188_c27_31f2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l188_c27_31f2_return_output := MUX_uxn_device_h_l188_c27_31f2_return_output;

     -- MUX[uxn_device_h_l187_c27_ee14] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l187_c27_ee14_cond <= VAR_MUX_uxn_device_h_l187_c27_ee14_cond;
     MUX_uxn_device_h_l187_c27_ee14_iftrue <= VAR_MUX_uxn_device_h_l187_c27_ee14_iftrue;
     MUX_uxn_device_h_l187_c27_ee14_iffalse <= VAR_MUX_uxn_device_h_l187_c27_ee14_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l187_c27_ee14_return_output := MUX_uxn_device_h_l187_c27_ee14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c1_2e26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c7_7ddb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c7_7ddb_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left := VAR_MUX_uxn_device_h_l187_c27_ee14_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue := VAR_MUX_uxn_device_h_l187_c27_ee14_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right := VAR_MUX_uxn_device_h_l188_c27_31f2_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue := VAR_MUX_uxn_device_h_l188_c27_31f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output;
     VAR_device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_2e26_return_output;
     -- port_range_palette_lo_MUX[uxn_device_h_l185_c2_9809] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_cond;
     port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output := port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output;

     -- device_ram_read[uxn_device_h_l186_c14_7b22] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l186_c14_7b22_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l186_c14_7b22_address <= VAR_device_ram_read_uxn_device_h_l186_c14_7b22_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l186_c14_7b22_return_output := device_ram_read_uxn_device_h_l186_c14_7b22_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l185_c2_9809] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_cond;
     port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output := port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output;

     -- BIN_OP_AND[uxn_device_h_l189_c7_4f8e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left <= VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_left;
     BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right <= VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output := BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_37f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_b9d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond := VAR_BIN_OP_AND_uxn_device_h_l189_c7_4f8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_b9d3_return_output;
     VAR_device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_37f5_return_output;
     VAR_system_deo_uxn_device_h_l186_c3_de62_d := VAR_device_ram_read_uxn_device_h_l186_c14_7b22_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l185_c2_9809_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l185_c2_9809_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l189_c1_f58a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c7_50a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output;

     -- device_ram_read[uxn_device_h_l202_c15_fb85] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l202_c15_fb85_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l202_c15_fb85_address <= VAR_device_ram_read_uxn_device_h_l202_c15_fb85_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l202_c15_fb85_return_output := device_ram_read_uxn_device_h_l202_c15_fb85_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c1_8d26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output;

     -- system_deo[uxn_device_h_l186_c3_de62] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l186_c3_de62_d <= VAR_system_deo_uxn_device_h_l186_c3_de62_d;
     system_deo_uxn_device_h_l186_c3_de62_device_port <= VAR_system_deo_uxn_device_h_l186_c3_de62_device_port;
     -- Outputs

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c7_50a4_return_output;
     VAR_device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l189_c1_f58a_return_output;
     VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c1_8d26_return_output;
     VAR_console_deo_uxn_device_h_l202_c3_7ec0_d := VAR_device_ram_read_uxn_device_h_l202_c15_fb85_return_output;
     -- device_ram_read[uxn_device_h_l198_c19_14e6] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l198_c19_14e6_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l198_c19_14e6_address <= VAR_device_ram_read_uxn_device_h_l198_c19_14e6_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l198_c19_14e6_return_output := device_ram_read_uxn_device_h_l198_c19_14e6_return_output;

     -- device_ram_read[uxn_device_h_l205_c14_3d3a] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l205_c14_3d3a_address <= VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_return_output := device_ram_read_uxn_device_h_l205_c14_3d3a_return_output;

     -- console_deo[uxn_device_h_l202_c3_7ec0] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l202_c3_7ec0_d <= VAR_console_deo_uxn_device_h_l202_c3_7ec0_d;
     console_deo_uxn_device_h_l202_c3_7ec0_device_port <= VAR_console_deo_uxn_device_h_l202_c3_7ec0_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l210_c7_b42e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c1_9e74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c7_b42e_return_output;
     VAR_device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_9e74_return_output;
     VAR_screen_palette_uxn_device_h_l198_c4_8868_device_port := VAR_device_ram_read_uxn_device_h_l198_c19_14e6_return_output;
     VAR_screen_deo_uxn_device_h_l205_c3_0fbb_d := VAR_device_ram_read_uxn_device_h_l205_c14_3d3a_return_output;
     -- device_ram_read[uxn_device_h_l208_c15_7d23] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l208_c15_7d23_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l208_c15_7d23_address <= VAR_device_ram_read_uxn_device_h_l208_c15_7d23_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l208_c15_7d23_return_output := device_ram_read_uxn_device_h_l208_c15_7d23_return_output;

     -- screen_deo[uxn_device_h_l205_c3_0fbb] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l205_c3_0fbb_d <= VAR_screen_deo_uxn_device_h_l205_c3_0fbb_d;
     screen_deo_uxn_device_h_l205_c3_0fbb_device_port <= VAR_screen_deo_uxn_device_h_l205_c3_0fbb_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l198_c4_8868] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l198_c4_8868_device_port <= VAR_screen_palette_uxn_device_h_l198_c4_8868_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l210_c1_8df8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output;

     -- Submodule level 7
     VAR_device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l210_c1_8df8_return_output;
     VAR_file_deo_uxn_device_h_l208_c3_04af_d := VAR_device_ram_read_uxn_device_h_l208_c15_7d23_return_output;
     -- device_ram_read[uxn_device_h_l211_c15_4608] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l211_c15_4608_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l211_c15_4608_address <= VAR_device_ram_read_uxn_device_h_l211_c15_4608_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l211_c15_4608_return_output := device_ram_read_uxn_device_h_l211_c15_4608_return_output;

     -- file_deo[uxn_device_h_l208_c3_04af] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l208_c3_04af_file_index <= VAR_file_deo_uxn_device_h_l208_c3_04af_file_index;
     file_deo_uxn_device_h_l208_c3_04af_d <= VAR_file_deo_uxn_device_h_l208_c3_04af_d;
     file_deo_uxn_device_h_l208_c3_04af_p <= VAR_file_deo_uxn_device_h_l208_c3_04af_p;
     -- Outputs

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l211_c3_cc2f_d := VAR_device_ram_read_uxn_device_h_l211_c15_4608_return_output;
     -- file_deo[uxn_device_h_l211_c3_cc2f] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l211_c3_cc2f_file_index <= VAR_file_deo_uxn_device_h_l211_c3_cc2f_file_index;
     file_deo_uxn_device_h_l211_c3_cc2f_d <= VAR_file_deo_uxn_device_h_l211_c3_cc2f_d;
     file_deo_uxn_device_h_l211_c3_cc2f_p <= VAR_file_deo_uxn_device_h_l211_c3_cc2f_p;
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
