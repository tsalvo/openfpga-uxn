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
-- BIN_OP_AND[uxn_device_h_l112_c16_de2c]
signal BIN_OP_AND_uxn_device_h_l112_c16_de2c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_de2c_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_a953]
signal BIN_OP_AND_uxn_device_h_l113_c17_a953_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_a953_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_6de9]
signal BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_4bc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_a4c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_615d]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_615d]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l115_c14_fffc]
signal peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l115_c14_fffc_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l115_c14_fffc_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_00aa]
signal system_deo_uxn_device_h_l115_c3_00aa_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_00aa_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_9643]
signal BIN_OP_GT_uxn_device_h_l116_c27_9643_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_9643_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_3ec5]
signal MUX_uxn_device_h_l116_c27_3ec5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_3ec5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_3ec5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_3ec5_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_59ee]
signal BIN_OP_LT_uxn_device_h_l117_c27_59ee_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_59ee_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_e87b]
signal MUX_uxn_device_h_l117_c27_e87b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_e87b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_e87b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_e87b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_b495]
signal BIN_OP_AND_uxn_device_h_l118_c7_b495_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_b495_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_f4c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l127_c19_fd6d]
signal peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l127_c19_fd6d_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l127_c19_fd6d_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_7dd1]
signal screen_palette_uxn_device_h_l127_c4_7dd1_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_c2b9]
signal BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_86e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_e3ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l131_c15_eff4]
signal peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l131_c15_eff4_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l131_c15_eff4_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_d022]
signal console_deo_uxn_device_h_l131_c3_d022_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_d022_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_b820]
signal BIN_OP_EQ_uxn_device_h_l133_c11_b820_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_b820_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_df60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_15cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l134_c14_17eb]
signal peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l134_c14_17eb_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l134_c14_17eb_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_5527]
signal screen_deo_uxn_device_h_l134_c3_5527_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_5527_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_d881]
signal BIN_OP_EQ_uxn_device_h_l136_c11_d881_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_d881_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c449]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_88ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l137_c15_76e8]
signal peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l137_c15_76e8_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l137_c15_76e8_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_8fe7]
signal file_deo_uxn_device_h_l137_c3_8fe7_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_8fe7_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_8fe7_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_2fc2]
signal BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_3c08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l140_c15_210b]
signal peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l140_c15_210b_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l140_c15_210b_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_aa3d]
signal file_deo_uxn_device_h_l140_c3_aa3d_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_aa3d_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_aa3d_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_de2c
BIN_OP_AND_uxn_device_h_l112_c16_de2c : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_de2c_left,
BIN_OP_AND_uxn_device_h_l112_c16_de2c_right,
BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_a953
BIN_OP_AND_uxn_device_h_l113_c17_a953 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_a953_left,
BIN_OP_AND_uxn_device_h_l113_c17_a953_right,
BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_6de9
BIN_OP_EQ_uxn_device_h_l114_c6_6de9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left,
BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right,
BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d
port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d
port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output);

-- peek_dev_uxn_device_h_l115_c14_fffc
peek_dev_uxn_device_h_l115_c14_fffc : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE,
peek_dev_uxn_device_h_l115_c14_fffc_address,
peek_dev_uxn_device_h_l115_c14_fffc_return_output);

-- system_deo_uxn_device_h_l115_c3_00aa
system_deo_uxn_device_h_l115_c3_00aa : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_00aa_d,
system_deo_uxn_device_h_l115_c3_00aa_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_9643
BIN_OP_GT_uxn_device_h_l116_c27_9643 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_9643_left,
BIN_OP_GT_uxn_device_h_l116_c27_9643_right,
BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output);

-- MUX_uxn_device_h_l116_c27_3ec5
MUX_uxn_device_h_l116_c27_3ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_3ec5_cond,
MUX_uxn_device_h_l116_c27_3ec5_iftrue,
MUX_uxn_device_h_l116_c27_3ec5_iffalse,
MUX_uxn_device_h_l116_c27_3ec5_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_59ee
BIN_OP_LT_uxn_device_h_l117_c27_59ee : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_59ee_left,
BIN_OP_LT_uxn_device_h_l117_c27_59ee_right,
BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output);

-- MUX_uxn_device_h_l117_c27_e87b
MUX_uxn_device_h_l117_c27_e87b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_e87b_cond,
MUX_uxn_device_h_l117_c27_e87b_iftrue,
MUX_uxn_device_h_l117_c27_e87b_iffalse,
MUX_uxn_device_h_l117_c27_e87b_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_b495
BIN_OP_AND_uxn_device_h_l118_c7_b495 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_b495_left,
BIN_OP_AND_uxn_device_h_l118_c7_b495_right,
BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output);

-- peek_dev_uxn_device_h_l127_c19_fd6d
peek_dev_uxn_device_h_l127_c19_fd6d : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE,
peek_dev_uxn_device_h_l127_c19_fd6d_address,
peek_dev_uxn_device_h_l127_c19_fd6d_return_output);

-- screen_palette_uxn_device_h_l127_c4_7dd1
screen_palette_uxn_device_h_l127_c4_7dd1 : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_7dd1_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_c2b9
BIN_OP_EQ_uxn_device_h_l130_c11_c2b9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left,
BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right,
BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output);

-- peek_dev_uxn_device_h_l131_c15_eff4
peek_dev_uxn_device_h_l131_c15_eff4 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE,
peek_dev_uxn_device_h_l131_c15_eff4_address,
peek_dev_uxn_device_h_l131_c15_eff4_return_output);

-- console_deo_uxn_device_h_l131_c3_d022
console_deo_uxn_device_h_l131_c3_d022 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_d022_d,
console_deo_uxn_device_h_l131_c3_d022_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_b820
BIN_OP_EQ_uxn_device_h_l133_c11_b820 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_b820_left,
BIN_OP_EQ_uxn_device_h_l133_c11_b820_right,
BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output);

-- peek_dev_uxn_device_h_l134_c14_17eb
peek_dev_uxn_device_h_l134_c14_17eb : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE,
peek_dev_uxn_device_h_l134_c14_17eb_address,
peek_dev_uxn_device_h_l134_c14_17eb_return_output);

-- screen_deo_uxn_device_h_l134_c3_5527
screen_deo_uxn_device_h_l134_c3_5527 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_5527_d,
screen_deo_uxn_device_h_l134_c3_5527_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_d881
BIN_OP_EQ_uxn_device_h_l136_c11_d881 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_d881_left,
BIN_OP_EQ_uxn_device_h_l136_c11_d881_right,
BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output);

-- peek_dev_uxn_device_h_l137_c15_76e8
peek_dev_uxn_device_h_l137_c15_76e8 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE,
peek_dev_uxn_device_h_l137_c15_76e8_address,
peek_dev_uxn_device_h_l137_c15_76e8_return_output);

-- file_deo_uxn_device_h_l137_c3_8fe7
file_deo_uxn_device_h_l137_c3_8fe7 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_8fe7_file_index,
file_deo_uxn_device_h_l137_c3_8fe7_d,
file_deo_uxn_device_h_l137_c3_8fe7_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_2fc2
BIN_OP_EQ_uxn_device_h_l139_c11_2fc2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left,
BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right,
BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output);

-- peek_dev_uxn_device_h_l140_c15_210b
peek_dev_uxn_device_h_l140_c15_210b : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE,
peek_dev_uxn_device_h_l140_c15_210b_address,
peek_dev_uxn_device_h_l140_c15_210b_return_output);

-- file_deo_uxn_device_h_l140_c3_aa3d
file_deo_uxn_device_h_l140_c3_aa3d : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_aa3d_file_index,
file_deo_uxn_device_h_l140_c3_aa3d_d,
file_deo_uxn_device_h_l140_c3_aa3d_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output,
 peek_dev_uxn_device_h_l115_c14_fffc_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output,
 MUX_uxn_device_h_l116_c27_3ec5_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output,
 MUX_uxn_device_h_l117_c27_e87b_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output,
 peek_dev_uxn_device_h_l127_c19_fd6d_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output,
 peek_dev_uxn_device_h_l131_c15_eff4_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output,
 peek_dev_uxn_device_h_l134_c14_17eb_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output,
 peek_dev_uxn_device_h_l137_c15_76e8_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output,
 peek_dev_uxn_device_h_l140_c15_210b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_00aa_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_00aa_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_fffc_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_fffc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_3ec5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_3ec5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_3ec5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_3ec5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_e87b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_e87b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_e87b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_e87b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_7dd1_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_fd6d_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_fd6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_d022_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_d022_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_eff4_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_eff4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_5527_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_5527_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_17eb_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_17eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_8fe7_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_8fe7_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_8fe7_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_76e8_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_76e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_aa3d_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_aa3d_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_aa3d_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_210b_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_210b_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l116_c27_3ec5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_right := to_unsigned(7, 3);
     VAR_file_deo_uxn_device_h_l137_c3_8fe7_file_index := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue := to_unsigned(0, 1);
     VAR_peek_dev_uxn_device_h_l127_c19_fd6d_address := resize(to_unsigned(8, 4), 8);
     VAR_MUX_uxn_device_h_l117_c27_e87b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right := to_unsigned(176, 8);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l117_c27_e87b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l116_c27_3ec5_iffalse := to_unsigned(0, 1);
     VAR_file_deo_uxn_device_h_l140_c3_aa3d_file_index := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l112_c16_de2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_de2c_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_left;
     BIN_OP_AND_uxn_device_h_l112_c16_de2c_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output := BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;

     -- BIN_OP_AND[uxn_device_h_l113_c17_a953] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_a953_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_left;
     BIN_OP_AND_uxn_device_h_l113_c17_a953_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output := BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_d022_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_8fe7_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_aa3d_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_5527_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_00aa_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_de2c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_fffc_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_eff4_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_17eb_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_76e8_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     VAR_peek_dev_uxn_device_h_l140_c15_210b_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_a953_return_output;
     -- BIN_OP_LT[uxn_device_h_l117_c27_59ee] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_59ee_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_left;
     BIN_OP_LT_uxn_device_h_l117_c27_59ee_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output := BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output;

     -- BIN_OP_GT[uxn_device_h_l116_c27_9643] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_9643_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_left;
     BIN_OP_GT_uxn_device_h_l116_c27_9643_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output := BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_2fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_b820] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_b820_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_b820_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_c2b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_d881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_d881_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_d881_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c6_6de9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_6de9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_c2b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_b820_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_d881_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_2fc2_return_output;
     VAR_MUX_uxn_device_h_l116_c27_3ec5_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_9643_return_output;
     VAR_MUX_uxn_device_h_l117_c27_e87b_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_59ee_return_output;
     -- MUX[uxn_device_h_l116_c27_3ec5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_3ec5_cond <= VAR_MUX_uxn_device_h_l116_c27_3ec5_cond;
     MUX_uxn_device_h_l116_c27_3ec5_iftrue <= VAR_MUX_uxn_device_h_l116_c27_3ec5_iftrue;
     MUX_uxn_device_h_l116_c27_3ec5_iffalse <= VAR_MUX_uxn_device_h_l116_c27_3ec5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_3ec5_return_output := MUX_uxn_device_h_l116_c27_3ec5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_a4c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_4bc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output;

     -- MUX[uxn_device_h_l117_c27_e87b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_e87b_cond <= VAR_MUX_uxn_device_h_l117_c27_e87b_cond;
     MUX_uxn_device_h_l117_c27_e87b_iftrue <= VAR_MUX_uxn_device_h_l117_c27_e87b_iftrue;
     MUX_uxn_device_h_l117_c27_e87b_iffalse <= VAR_MUX_uxn_device_h_l117_c27_e87b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_e87b_return_output := MUX_uxn_device_h_l117_c27_e87b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_a4c2_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_left := VAR_MUX_uxn_device_h_l116_c27_3ec5_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue := VAR_MUX_uxn_device_h_l116_c27_3ec5_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_right := VAR_MUX_uxn_device_h_l117_c27_e87b_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue := VAR_MUX_uxn_device_h_l117_c27_e87b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_4bc0_return_output;
     -- BIN_OP_AND[uxn_device_h_l118_c7_b495] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_b495_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_left;
     BIN_OP_AND_uxn_device_h_l118_c7_b495_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output := BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_e3ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output;

     -- peek_dev[uxn_device_h_l115_c14_fffc] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l115_c14_fffc_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l115_c14_fffc_address <= VAR_peek_dev_uxn_device_h_l115_c14_fffc_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l115_c14_fffc_return_output := peek_dev_uxn_device_h_l115_c14_fffc_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_615d] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output;

     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_615d] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_86e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_b495_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_e3ac_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_86e3_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_00aa_d := VAR_peek_dev_uxn_device_h_l115_c14_fffc_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_615d_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_615d_return_output;
     -- peek_dev[uxn_device_h_l131_c15_eff4] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l131_c15_eff4_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l131_c15_eff4_address <= VAR_peek_dev_uxn_device_h_l131_c15_eff4_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l131_c15_eff4_return_output := peek_dev_uxn_device_h_l131_c15_eff4_return_output;

     -- system_deo[uxn_device_h_l115_c3_00aa] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_00aa_d <= VAR_system_deo_uxn_device_h_l115_c3_00aa_d;
     system_deo_uxn_device_h_l115_c3_00aa_device_port <= VAR_system_deo_uxn_device_h_l115_c3_00aa_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_f4c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_15cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_df60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_15cc_return_output;
     VAR_peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_f4c0_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_df60_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_d022_d := VAR_peek_dev_uxn_device_h_l131_c15_eff4_return_output;
     -- peek_dev[uxn_device_h_l134_c14_17eb] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l134_c14_17eb_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l134_c14_17eb_address <= VAR_peek_dev_uxn_device_h_l134_c14_17eb_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l134_c14_17eb_return_output := peek_dev_uxn_device_h_l134_c14_17eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c449] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output;

     -- console_deo[uxn_device_h_l131_c3_d022] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_d022_d <= VAR_console_deo_uxn_device_h_l131_c3_d022_d;
     console_deo_uxn_device_h_l131_c3_d022_device_port <= VAR_console_deo_uxn_device_h_l131_c3_d022_device_port;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_88ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output;

     -- peek_dev[uxn_device_h_l127_c19_fd6d] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l127_c19_fd6d_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l127_c19_fd6d_address <= VAR_peek_dev_uxn_device_h_l127_c19_fd6d_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l127_c19_fd6d_return_output := peek_dev_uxn_device_h_l127_c19_fd6d_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_88ac_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c449_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_7dd1_device_port := VAR_peek_dev_uxn_device_h_l127_c19_fd6d_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_5527_d := VAR_peek_dev_uxn_device_h_l134_c14_17eb_return_output;
     -- screen_palette[uxn_device_h_l127_c4_7dd1] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_7dd1_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_7dd1_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_3c08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output;

     -- peek_dev[uxn_device_h_l137_c15_76e8] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l137_c15_76e8_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l137_c15_76e8_address <= VAR_peek_dev_uxn_device_h_l137_c15_76e8_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l137_c15_76e8_return_output := peek_dev_uxn_device_h_l137_c15_76e8_return_output;

     -- screen_deo[uxn_device_h_l134_c3_5527] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_5527_d <= VAR_screen_deo_uxn_device_h_l134_c3_5527_d;
     screen_deo_uxn_device_h_l134_c3_5527_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_5527_device_port;
     -- Outputs

     -- Submodule level 7
     VAR_peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_3c08_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_8fe7_d := VAR_peek_dev_uxn_device_h_l137_c15_76e8_return_output;
     -- peek_dev[uxn_device_h_l140_c15_210b] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l140_c15_210b_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l140_c15_210b_address <= VAR_peek_dev_uxn_device_h_l140_c15_210b_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l140_c15_210b_return_output := peek_dev_uxn_device_h_l140_c15_210b_return_output;

     -- file_deo[uxn_device_h_l137_c3_8fe7] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_8fe7_file_index <= VAR_file_deo_uxn_device_h_l137_c3_8fe7_file_index;
     file_deo_uxn_device_h_l137_c3_8fe7_d <= VAR_file_deo_uxn_device_h_l137_c3_8fe7_d;
     file_deo_uxn_device_h_l137_c3_8fe7_p <= VAR_file_deo_uxn_device_h_l137_c3_8fe7_p;
     -- Outputs

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_aa3d_d := VAR_peek_dev_uxn_device_h_l140_c15_210b_return_output;
     -- file_deo[uxn_device_h_l140_c3_aa3d] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_aa3d_file_index <= VAR_file_deo_uxn_device_h_l140_c3_aa3d_file_index;
     file_deo_uxn_device_h_l140_c3_aa3d_d <= VAR_file_deo_uxn_device_h_l140_c3_aa3d_d;
     file_deo_uxn_device_h_l140_c3_aa3d_p <= VAR_file_deo_uxn_device_h_l140_c3_aa3d_p;
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
