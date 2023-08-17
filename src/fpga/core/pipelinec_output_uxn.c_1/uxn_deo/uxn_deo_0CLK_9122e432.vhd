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
-- BIN_OP_AND[uxn_device_h_l112_c16_eaca]
signal BIN_OP_AND_uxn_device_h_l112_c16_eaca_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_eaca_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_6393]
signal BIN_OP_AND_uxn_device_h_l113_c17_6393_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_6393_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_ceb4]
signal BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_4629]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_f75f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_e09b]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_e09b]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l115_c14_dba0]
signal peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l115_c14_dba0_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l115_c14_dba0_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_789d]
signal system_deo_uxn_device_h_l115_c3_789d_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_789d_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_aecb]
signal BIN_OP_GT_uxn_device_h_l116_c27_aecb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_aecb_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_64c8]
signal MUX_uxn_device_h_l116_c27_64c8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_64c8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_64c8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_64c8_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_73cb]
signal BIN_OP_LT_uxn_device_h_l117_c27_73cb_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_73cb_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_0755]
signal MUX_uxn_device_h_l117_c27_0755_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_0755_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_0755_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_0755_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_9269]
signal BIN_OP_AND_uxn_device_h_l118_c7_9269_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_9269_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_e12f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l127_c19_3c36]
signal peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l127_c19_3c36_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l127_c19_3c36_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_7346]
signal screen_palette_uxn_device_h_l127_c4_7346_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_16bd]
signal BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_0363]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_e90b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l131_c15_3fb1]
signal peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l131_c15_3fb1_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l131_c15_3fb1_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_2c83]
signal console_deo_uxn_device_h_l131_c3_2c83_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_2c83_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_afd9]
signal BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_28cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_797e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l134_c14_3555]
signal peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l134_c14_3555_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l134_c14_3555_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_9ee9]
signal screen_deo_uxn_device_h_l134_c3_9ee9_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_9ee9_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_82b1]
signal BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_f4fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_a9c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l137_c15_a79e]
signal peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l137_c15_a79e_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l137_c15_a79e_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_94d6]
signal file_deo_uxn_device_h_l137_c3_94d6_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_94d6_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_94d6_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_fb6e]
signal BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_981e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l140_c15_57f6]
signal peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l140_c15_57f6_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l140_c15_57f6_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_a93f]
signal file_deo_uxn_device_h_l140_c3_a93f_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_a93f_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_a93f_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_eaca
BIN_OP_AND_uxn_device_h_l112_c16_eaca : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_eaca_left,
BIN_OP_AND_uxn_device_h_l112_c16_eaca_right,
BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_6393
BIN_OP_AND_uxn_device_h_l113_c17_6393 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_6393_left,
BIN_OP_AND_uxn_device_h_l113_c17_6393_right,
BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_ceb4
BIN_OP_EQ_uxn_device_h_l114_c6_ceb4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left,
BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right,
BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b
port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b
port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output);

-- peek_dev_uxn_device_h_l115_c14_dba0
peek_dev_uxn_device_h_l115_c14_dba0 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE,
peek_dev_uxn_device_h_l115_c14_dba0_address,
peek_dev_uxn_device_h_l115_c14_dba0_return_output);

-- system_deo_uxn_device_h_l115_c3_789d
system_deo_uxn_device_h_l115_c3_789d : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_789d_d,
system_deo_uxn_device_h_l115_c3_789d_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_aecb
BIN_OP_GT_uxn_device_h_l116_c27_aecb : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_aecb_left,
BIN_OP_GT_uxn_device_h_l116_c27_aecb_right,
BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output);

-- MUX_uxn_device_h_l116_c27_64c8
MUX_uxn_device_h_l116_c27_64c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_64c8_cond,
MUX_uxn_device_h_l116_c27_64c8_iftrue,
MUX_uxn_device_h_l116_c27_64c8_iffalse,
MUX_uxn_device_h_l116_c27_64c8_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_73cb
BIN_OP_LT_uxn_device_h_l117_c27_73cb : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_73cb_left,
BIN_OP_LT_uxn_device_h_l117_c27_73cb_right,
BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output);

-- MUX_uxn_device_h_l117_c27_0755
MUX_uxn_device_h_l117_c27_0755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_0755_cond,
MUX_uxn_device_h_l117_c27_0755_iftrue,
MUX_uxn_device_h_l117_c27_0755_iffalse,
MUX_uxn_device_h_l117_c27_0755_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_9269
BIN_OP_AND_uxn_device_h_l118_c7_9269 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_9269_left,
BIN_OP_AND_uxn_device_h_l118_c7_9269_right,
BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output);

-- peek_dev_uxn_device_h_l127_c19_3c36
peek_dev_uxn_device_h_l127_c19_3c36 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE,
peek_dev_uxn_device_h_l127_c19_3c36_address,
peek_dev_uxn_device_h_l127_c19_3c36_return_output);

-- screen_palette_uxn_device_h_l127_c4_7346
screen_palette_uxn_device_h_l127_c4_7346 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_7346_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_16bd
BIN_OP_EQ_uxn_device_h_l130_c11_16bd : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left,
BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right,
BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output);

-- peek_dev_uxn_device_h_l131_c15_3fb1
peek_dev_uxn_device_h_l131_c15_3fb1 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE,
peek_dev_uxn_device_h_l131_c15_3fb1_address,
peek_dev_uxn_device_h_l131_c15_3fb1_return_output);

-- console_deo_uxn_device_h_l131_c3_2c83
console_deo_uxn_device_h_l131_c3_2c83 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_2c83_d,
console_deo_uxn_device_h_l131_c3_2c83_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_afd9
BIN_OP_EQ_uxn_device_h_l133_c11_afd9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left,
BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right,
BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output);

-- peek_dev_uxn_device_h_l134_c14_3555
peek_dev_uxn_device_h_l134_c14_3555 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE,
peek_dev_uxn_device_h_l134_c14_3555_address,
peek_dev_uxn_device_h_l134_c14_3555_return_output);

-- screen_deo_uxn_device_h_l134_c3_9ee9
screen_deo_uxn_device_h_l134_c3_9ee9 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_9ee9_d,
screen_deo_uxn_device_h_l134_c3_9ee9_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_82b1
BIN_OP_EQ_uxn_device_h_l136_c11_82b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left,
BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right,
BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output);

-- peek_dev_uxn_device_h_l137_c15_a79e
peek_dev_uxn_device_h_l137_c15_a79e : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE,
peek_dev_uxn_device_h_l137_c15_a79e_address,
peek_dev_uxn_device_h_l137_c15_a79e_return_output);

-- file_deo_uxn_device_h_l137_c3_94d6
file_deo_uxn_device_h_l137_c3_94d6 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_94d6_file_index,
file_deo_uxn_device_h_l137_c3_94d6_d,
file_deo_uxn_device_h_l137_c3_94d6_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_fb6e
BIN_OP_EQ_uxn_device_h_l139_c11_fb6e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left,
BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right,
BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output);

-- peek_dev_uxn_device_h_l140_c15_57f6
peek_dev_uxn_device_h_l140_c15_57f6 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE,
peek_dev_uxn_device_h_l140_c15_57f6_address,
peek_dev_uxn_device_h_l140_c15_57f6_return_output);

-- file_deo_uxn_device_h_l140_c3_a93f
file_deo_uxn_device_h_l140_c3_a93f : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_a93f_file_index,
file_deo_uxn_device_h_l140_c3_a93f_d,
file_deo_uxn_device_h_l140_c3_a93f_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output,
 peek_dev_uxn_device_h_l115_c14_dba0_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output,
 MUX_uxn_device_h_l116_c27_64c8_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output,
 MUX_uxn_device_h_l117_c27_0755_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output,
 peek_dev_uxn_device_h_l127_c19_3c36_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output,
 peek_dev_uxn_device_h_l131_c15_3fb1_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output,
 peek_dev_uxn_device_h_l134_c14_3555_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output,
 peek_dev_uxn_device_h_l137_c15_a79e_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output,
 peek_dev_uxn_device_h_l140_c15_57f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_789d_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_789d_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_dba0_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_dba0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_64c8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_64c8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_64c8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_64c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_0755_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_0755_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_0755_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_0755_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_7346_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_3c36_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_3c36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_2c83_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_2c83_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3fb1_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_3fb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_9ee9_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_9ee9_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_3555_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_3555_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_94d6_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_94d6_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_94d6_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_a79e_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_a79e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_a93f_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_a93f_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_a93f_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_57f6_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_57f6_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right := to_unsigned(160, 8);
     VAR_MUX_uxn_device_h_l117_c27_0755_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right := to_unsigned(176, 8);
     VAR_file_deo_uxn_device_h_l140_c3_a93f_file_index := to_unsigned(1, 1);
     VAR_peek_dev_uxn_device_h_l127_c19_3c36_address := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l116_c27_64c8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l116_c27_64c8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l117_c27_0755_iftrue := to_unsigned(1, 1);
     VAR_file_deo_uxn_device_h_l137_c3_94d6_file_index := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l112_c16_eaca] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_eaca_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_left;
     BIN_OP_AND_uxn_device_h_l112_c16_eaca_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output := BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;

     -- BIN_OP_AND[uxn_device_h_l113_c17_6393] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_6393_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_left;
     BIN_OP_AND_uxn_device_h_l113_c17_6393_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output := BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_2c83_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_94d6_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_a93f_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_9ee9_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_789d_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_eaca_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_dba0_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_3fb1_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_3555_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_a79e_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     VAR_peek_dev_uxn_device_h_l140_c15_57f6_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_6393_return_output;
     -- BIN_OP_GT[uxn_device_h_l116_c27_aecb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_aecb_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_left;
     BIN_OP_GT_uxn_device_h_l116_c27_aecb_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output := BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_fb6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_afd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c6_ceb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output;

     -- BIN_OP_LT[uxn_device_h_l117_c27_73cb] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_73cb_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_left;
     BIN_OP_LT_uxn_device_h_l117_c27_73cb_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output := BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_16bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_82b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_ceb4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_16bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_afd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_82b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_fb6e_return_output;
     VAR_MUX_uxn_device_h_l116_c27_64c8_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_aecb_return_output;
     VAR_MUX_uxn_device_h_l117_c27_0755_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_73cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_f75f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output;

     -- MUX[uxn_device_h_l117_c27_0755] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_0755_cond <= VAR_MUX_uxn_device_h_l117_c27_0755_cond;
     MUX_uxn_device_h_l117_c27_0755_iftrue <= VAR_MUX_uxn_device_h_l117_c27_0755_iftrue;
     MUX_uxn_device_h_l117_c27_0755_iffalse <= VAR_MUX_uxn_device_h_l117_c27_0755_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_0755_return_output := MUX_uxn_device_h_l117_c27_0755_return_output;

     -- MUX[uxn_device_h_l116_c27_64c8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_64c8_cond <= VAR_MUX_uxn_device_h_l116_c27_64c8_cond;
     MUX_uxn_device_h_l116_c27_64c8_iftrue <= VAR_MUX_uxn_device_h_l116_c27_64c8_iftrue;
     MUX_uxn_device_h_l116_c27_64c8_iffalse <= VAR_MUX_uxn_device_h_l116_c27_64c8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_64c8_return_output := MUX_uxn_device_h_l116_c27_64c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_4629] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_f75f_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_left := VAR_MUX_uxn_device_h_l116_c27_64c8_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue := VAR_MUX_uxn_device_h_l116_c27_64c8_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_right := VAR_MUX_uxn_device_h_l117_c27_0755_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue := VAR_MUX_uxn_device_h_l117_c27_0755_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4629_return_output;
     -- peek_dev[uxn_device_h_l115_c14_dba0] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l115_c14_dba0_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l115_c14_dba0_address <= VAR_peek_dev_uxn_device_h_l115_c14_dba0_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l115_c14_dba0_return_output := peek_dev_uxn_device_h_l115_c14_dba0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_e90b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_e09b] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_e09b] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output;

     -- BIN_OP_AND[uxn_device_h_l118_c7_9269] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_9269_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_left;
     BIN_OP_AND_uxn_device_h_l118_c7_9269_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output := BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_0363] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_9269_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e90b_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_0363_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_789d_d := VAR_peek_dev_uxn_device_h_l115_c14_dba0_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_e09b_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_e09b_return_output;
     -- system_deo[uxn_device_h_l115_c3_789d] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_789d_d <= VAR_system_deo_uxn_device_h_l115_c3_789d_d;
     system_deo_uxn_device_h_l115_c3_789d_device_port <= VAR_system_deo_uxn_device_h_l115_c3_789d_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_797e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output;

     -- peek_dev[uxn_device_h_l131_c15_3fb1] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l131_c15_3fb1_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l131_c15_3fb1_address <= VAR_peek_dev_uxn_device_h_l131_c15_3fb1_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l131_c15_3fb1_return_output := peek_dev_uxn_device_h_l131_c15_3fb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_28cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_e12f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_797e_return_output;
     VAR_peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_e12f_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_28cb_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_2c83_d := VAR_peek_dev_uxn_device_h_l131_c15_3fb1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_f4fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output;

     -- peek_dev[uxn_device_h_l127_c19_3c36] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l127_c19_3c36_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l127_c19_3c36_address <= VAR_peek_dev_uxn_device_h_l127_c19_3c36_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l127_c19_3c36_return_output := peek_dev_uxn_device_h_l127_c19_3c36_return_output;

     -- console_deo[uxn_device_h_l131_c3_2c83] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_2c83_d <= VAR_console_deo_uxn_device_h_l131_c3_2c83_d;
     console_deo_uxn_device_h_l131_c3_2c83_device_port <= VAR_console_deo_uxn_device_h_l131_c3_2c83_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_a9c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output;

     -- peek_dev[uxn_device_h_l134_c14_3555] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l134_c14_3555_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l134_c14_3555_address <= VAR_peek_dev_uxn_device_h_l134_c14_3555_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l134_c14_3555_return_output := peek_dev_uxn_device_h_l134_c14_3555_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_a9c0_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_f4fd_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_7346_device_port := VAR_peek_dev_uxn_device_h_l127_c19_3c36_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_9ee9_d := VAR_peek_dev_uxn_device_h_l134_c14_3555_return_output;
     -- screen_deo[uxn_device_h_l134_c3_9ee9] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_9ee9_d <= VAR_screen_deo_uxn_device_h_l134_c3_9ee9_d;
     screen_deo_uxn_device_h_l134_c3_9ee9_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_9ee9_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l127_c4_7346] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_7346_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_7346_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_981e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output;

     -- peek_dev[uxn_device_h_l137_c15_a79e] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l137_c15_a79e_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l137_c15_a79e_address <= VAR_peek_dev_uxn_device_h_l137_c15_a79e_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l137_c15_a79e_return_output := peek_dev_uxn_device_h_l137_c15_a79e_return_output;

     -- Submodule level 7
     VAR_peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_981e_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_94d6_d := VAR_peek_dev_uxn_device_h_l137_c15_a79e_return_output;
     -- file_deo[uxn_device_h_l137_c3_94d6] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_94d6_file_index <= VAR_file_deo_uxn_device_h_l137_c3_94d6_file_index;
     file_deo_uxn_device_h_l137_c3_94d6_d <= VAR_file_deo_uxn_device_h_l137_c3_94d6_d;
     file_deo_uxn_device_h_l137_c3_94d6_p <= VAR_file_deo_uxn_device_h_l137_c3_94d6_p;
     -- Outputs

     -- peek_dev[uxn_device_h_l140_c15_57f6] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l140_c15_57f6_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l140_c15_57f6_address <= VAR_peek_dev_uxn_device_h_l140_c15_57f6_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l140_c15_57f6_return_output := peek_dev_uxn_device_h_l140_c15_57f6_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_a93f_d := VAR_peek_dev_uxn_device_h_l140_c15_57f6_return_output;
     -- file_deo[uxn_device_h_l140_c3_a93f] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_a93f_file_index <= VAR_file_deo_uxn_device_h_l140_c3_a93f_file_index;
     file_deo_uxn_device_h_l140_c3_a93f_d <= VAR_file_deo_uxn_device_h_l140_c3_a93f_d;
     file_deo_uxn_device_h_l140_c3_a93f_p <= VAR_file_deo_uxn_device_h_l140_c3_a93f_p;
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
