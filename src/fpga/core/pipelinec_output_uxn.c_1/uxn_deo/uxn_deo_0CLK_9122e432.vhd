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
-- BIN_OP_AND[uxn_device_h_l112_c16_9328]
signal BIN_OP_AND_uxn_device_h_l112_c16_9328_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_9328_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l113_c17_c6a5]
signal BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c6_bf7d]
signal BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_eb95]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_0aaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output : unsigned(0 downto 0);

-- port_range_palette_lo_MUX[uxn_device_h_l114_c2_4636]
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse : unsigned(0 downto 0);
signal port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output : unsigned(0 downto 0);

-- port_range_palette_hi_MUX[uxn_device_h_l114_c2_4636]
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse : unsigned(0 downto 0);
signal port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l115_c14_d111]
signal peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l115_c14_d111_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l115_c14_d111_return_output : unsigned(7 downto 0);

-- system_deo[uxn_device_h_l115_c3_72eb]
signal system_deo_uxn_device_h_l115_c3_72eb_d : unsigned(7 downto 0);
signal system_deo_uxn_device_h_l115_c3_72eb_device_port : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l116_c27_5db0]
signal BIN_OP_GT_uxn_device_h_l116_c27_5db0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_5db0_right : unsigned(2 downto 0);
signal BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l116_c27_f5eb]
signal MUX_uxn_device_h_l116_c27_f5eb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_f5eb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_f5eb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l116_c27_f5eb_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l117_c27_6125]
signal BIN_OP_LT_uxn_device_h_l117_c27_6125_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_6125_right : unsigned(3 downto 0);
signal BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l117_c27_5ac3]
signal MUX_uxn_device_h_l117_c27_5ac3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_5ac3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_5ac3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l117_c27_5ac3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l118_c7_bd22]
signal BIN_OP_AND_uxn_device_h_l118_c7_bd22_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_bd22_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_4919]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l127_c19_4c67]
signal peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l127_c19_4c67_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l127_c19_4c67_return_output : unsigned(7 downto 0);

-- screen_palette[uxn_device_h_l127_c4_489c]
signal screen_palette_uxn_device_h_l127_c4_489c_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_b4ae]
signal BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_c3b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_cb5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l131_c15_e64b]
signal peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l131_c15_e64b_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l131_c15_e64b_return_output : unsigned(7 downto 0);

-- console_deo[uxn_device_h_l131_c3_ef01]
signal console_deo_uxn_device_h_l131_c3_ef01_d : unsigned(7 downto 0);
signal console_deo_uxn_device_h_l131_c3_ef01_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_d1b4]
signal BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_8f39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_58ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l134_c14_77e2]
signal peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l134_c14_77e2_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l134_c14_77e2_return_output : unsigned(7 downto 0);

-- screen_deo[uxn_device_h_l134_c3_d301]
signal screen_deo_uxn_device_h_l134_c3_d301_d : unsigned(7 downto 0);
signal screen_deo_uxn_device_h_l134_c3_d301_device_port : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_6baa]
signal BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c8b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_874a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l137_c15_8bf5]
signal peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l137_c15_8bf5_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l137_c15_8bf5_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l137_c3_3444]
signal file_deo_uxn_device_h_l137_c3_3444_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l137_c3_3444_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l137_c3_3444_p : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_0145]
signal BIN_OP_EQ_uxn_device_h_l139_c11_0145_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_0145_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_181c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l140_c15_18f0]
signal peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l140_c15_18f0_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l140_c15_18f0_return_output : unsigned(7 downto 0);

-- file_deo[uxn_device_h_l140_c3_4772]
signal file_deo_uxn_device_h_l140_c3_4772_file_index : unsigned(0 downto 0);
signal file_deo_uxn_device_h_l140_c3_4772_d : unsigned(7 downto 0);
signal file_deo_uxn_device_h_l140_c3_4772_p : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l112_c16_9328
BIN_OP_AND_uxn_device_h_l112_c16_9328 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l112_c16_9328_left,
BIN_OP_AND_uxn_device_h_l112_c16_9328_right,
BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output);

-- BIN_OP_AND_uxn_device_h_l113_c17_c6a5
BIN_OP_AND_uxn_device_h_l113_c17_c6a5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left,
BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right,
BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c6_bf7d
BIN_OP_EQ_uxn_device_h_l114_c6_bf7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left,
BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right,
BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output);

-- port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636
port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse,
port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output);

-- port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636
port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse,
port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output);

-- peek_dev_uxn_device_h_l115_c14_d111
peek_dev_uxn_device_h_l115_c14_d111 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE,
peek_dev_uxn_device_h_l115_c14_d111_address,
peek_dev_uxn_device_h_l115_c14_d111_return_output);

-- system_deo_uxn_device_h_l115_c3_72eb
system_deo_uxn_device_h_l115_c3_72eb : entity work.system_deo_0CLK_de264c78 port map (
system_deo_uxn_device_h_l115_c3_72eb_d,
system_deo_uxn_device_h_l115_c3_72eb_device_port);

-- BIN_OP_GT_uxn_device_h_l116_c27_5db0
BIN_OP_GT_uxn_device_h_l116_c27_5db0 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l116_c27_5db0_left,
BIN_OP_GT_uxn_device_h_l116_c27_5db0_right,
BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output);

-- MUX_uxn_device_h_l116_c27_f5eb
MUX_uxn_device_h_l116_c27_f5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l116_c27_f5eb_cond,
MUX_uxn_device_h_l116_c27_f5eb_iftrue,
MUX_uxn_device_h_l116_c27_f5eb_iffalse,
MUX_uxn_device_h_l116_c27_f5eb_return_output);

-- BIN_OP_LT_uxn_device_h_l117_c27_6125
BIN_OP_LT_uxn_device_h_l117_c27_6125 : entity work.BIN_OP_LT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l117_c27_6125_left,
BIN_OP_LT_uxn_device_h_l117_c27_6125_right,
BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output);

-- MUX_uxn_device_h_l117_c27_5ac3
MUX_uxn_device_h_l117_c27_5ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l117_c27_5ac3_cond,
MUX_uxn_device_h_l117_c27_5ac3_iftrue,
MUX_uxn_device_h_l117_c27_5ac3_iffalse,
MUX_uxn_device_h_l117_c27_5ac3_return_output);

-- BIN_OP_AND_uxn_device_h_l118_c7_bd22
BIN_OP_AND_uxn_device_h_l118_c7_bd22 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l118_c7_bd22_left,
BIN_OP_AND_uxn_device_h_l118_c7_bd22_right,
BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output);

-- peek_dev_uxn_device_h_l127_c19_4c67
peek_dev_uxn_device_h_l127_c19_4c67 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE,
peek_dev_uxn_device_h_l127_c19_4c67_address,
peek_dev_uxn_device_h_l127_c19_4c67_return_output);

-- screen_palette_uxn_device_h_l127_c4_489c
screen_palette_uxn_device_h_l127_c4_489c : entity work.screen_palette_0CLK_de264c78 port map (
screen_palette_uxn_device_h_l127_c4_489c_device_port);

-- BIN_OP_EQ_uxn_device_h_l130_c11_b4ae
BIN_OP_EQ_uxn_device_h_l130_c11_b4ae : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left,
BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right,
BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output);

-- peek_dev_uxn_device_h_l131_c15_e64b
peek_dev_uxn_device_h_l131_c15_e64b : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE,
peek_dev_uxn_device_h_l131_c15_e64b_address,
peek_dev_uxn_device_h_l131_c15_e64b_return_output);

-- console_deo_uxn_device_h_l131_c3_ef01
console_deo_uxn_device_h_l131_c3_ef01 : entity work.console_deo_0CLK_de264c78 port map (
console_deo_uxn_device_h_l131_c3_ef01_d,
console_deo_uxn_device_h_l131_c3_ef01_device_port);

-- BIN_OP_EQ_uxn_device_h_l133_c11_d1b4
BIN_OP_EQ_uxn_device_h_l133_c11_d1b4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left,
BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right,
BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output);

-- peek_dev_uxn_device_h_l134_c14_77e2
peek_dev_uxn_device_h_l134_c14_77e2 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE,
peek_dev_uxn_device_h_l134_c14_77e2_address,
peek_dev_uxn_device_h_l134_c14_77e2_return_output);

-- screen_deo_uxn_device_h_l134_c3_d301
screen_deo_uxn_device_h_l134_c3_d301 : entity work.screen_deo_0CLK_de264c78 port map (
screen_deo_uxn_device_h_l134_c3_d301_d,
screen_deo_uxn_device_h_l134_c3_d301_device_port);

-- BIN_OP_EQ_uxn_device_h_l136_c11_6baa
BIN_OP_EQ_uxn_device_h_l136_c11_6baa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left,
BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right,
BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output);

-- peek_dev_uxn_device_h_l137_c15_8bf5
peek_dev_uxn_device_h_l137_c15_8bf5 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE,
peek_dev_uxn_device_h_l137_c15_8bf5_address,
peek_dev_uxn_device_h_l137_c15_8bf5_return_output);

-- file_deo_uxn_device_h_l137_c3_3444
file_deo_uxn_device_h_l137_c3_3444 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l137_c3_3444_file_index,
file_deo_uxn_device_h_l137_c3_3444_d,
file_deo_uxn_device_h_l137_c3_3444_p);

-- BIN_OP_EQ_uxn_device_h_l139_c11_0145
BIN_OP_EQ_uxn_device_h_l139_c11_0145 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_0145_left,
BIN_OP_EQ_uxn_device_h_l139_c11_0145_right,
BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output);

-- peek_dev_uxn_device_h_l140_c15_18f0
peek_dev_uxn_device_h_l140_c15_18f0 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE,
peek_dev_uxn_device_h_l140_c15_18f0_address,
peek_dev_uxn_device_h_l140_c15_18f0_return_output);

-- file_deo_uxn_device_h_l140_c3_4772
file_deo_uxn_device_h_l140_c3_4772 : entity work.file_deo_0CLK_de264c78 port map (
file_deo_uxn_device_h_l140_c3_4772_file_index,
file_deo_uxn_device_h_l140_c3_4772_d,
file_deo_uxn_device_h_l140_c3_4772_p);



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
 BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output,
 BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output,
 port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output,
 port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output,
 peek_dev_uxn_device_h_l115_c14_d111_return_output,
 BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output,
 MUX_uxn_device_h_l116_c27_f5eb_return_output,
 BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output,
 MUX_uxn_device_h_l117_c27_5ac3_return_output,
 BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output,
 peek_dev_uxn_device_h_l127_c19_4c67_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output,
 peek_dev_uxn_device_h_l131_c15_e64b_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output,
 peek_dev_uxn_device_h_l134_c14_77e2_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output,
 peek_dev_uxn_device_h_l137_c15_8bf5_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output,
 peek_dev_uxn_device_h_l140_c15_18f0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output : unsigned(0 downto 0);
 variable VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond : unsigned(0 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_72eb_d : unsigned(7 downto 0);
 variable VAR_system_deo_uxn_device_h_l115_c3_72eb_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_d111_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l115_c14_d111_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_f5eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_f5eb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_f5eb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l116_c27_f5eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_5ac3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_5ac3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_5ac3_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l117_c27_5ac3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse : unsigned(0 downto 0);
 variable VAR_screen_palette_uxn_device_h_l127_c4_489c_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_4c67_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l127_c19_4c67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse : unsigned(0 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_ef01_d : unsigned(7 downto 0);
 variable VAR_console_deo_uxn_device_h_l131_c3_ef01_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_e64b_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l131_c15_e64b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse : unsigned(0 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_d301_d : unsigned(7 downto 0);
 variable VAR_screen_deo_uxn_device_h_l134_c3_d301_device_port : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_77e2_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l134_c14_77e2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_3444_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_3444_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l137_c3_3444_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_8bf5_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l137_c15_8bf5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_4772_file_index : unsigned(0 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_4772_d : unsigned(7 downto 0);
 variable VAR_file_deo_uxn_device_h_l140_c3_4772_p : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_18f0_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l140_c15_18f0_return_output : unsigned(7 downto 0);
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
     VAR_file_deo_uxn_device_h_l140_c3_4772_file_index := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right := to_unsigned(16, 5);
     VAR_MUX_uxn_device_h_l116_c27_f5eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right := to_unsigned(0, 1);
     VAR_peek_dev_uxn_device_h_l127_c19_4c67_address := resize(to_unsigned(8, 4), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_right := to_unsigned(176, 8);
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l117_c27_5ac3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right := to_unsigned(160, 8);
     VAR_MUX_uxn_device_h_l116_c27_f5eb_iftrue := to_unsigned(1, 1);
     VAR_file_deo_uxn_device_h_l137_c3_3444_file_index := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l117_c27_5ac3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_right := to_unsigned(7, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left := VAR_addr;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse := port_range_palette_hi;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse := port_range_palette_lo;
     -- BIN_OP_AND[uxn_device_h_l112_c16_9328] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l112_c16_9328_left <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_left;
     BIN_OP_AND_uxn_device_h_l112_c16_9328_right <= VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output := BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;

     -- BIN_OP_AND[uxn_device_h_l113_c17_c6a5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_left;
     BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right <= VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output := BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_left := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_ef01_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     REG_VAR_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_3444_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_file_deo_uxn_device_h_l140_c3_4772_p := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_d301_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_72eb_device_port := VAR_BIN_OP_AND_uxn_device_h_l112_c16_9328_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_left := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     REG_VAR_device_index := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_d111_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_e64b_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_77e2_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_8bf5_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     VAR_peek_dev_uxn_device_h_l140_c15_18f0_address := VAR_BIN_OP_AND_uxn_device_h_l113_c17_c6a5_return_output;
     -- BIN_OP_GT[uxn_device_h_l116_c27_5db0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l116_c27_5db0_left <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_left;
     BIN_OP_GT_uxn_device_h_l116_c27_5db0_right <= VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output := BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_6baa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_b4ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c6_bf7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_left;
     BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output := BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_0145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_0145_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_0145_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output;

     -- BIN_OP_LT[uxn_device_h_l117_c27_6125] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l117_c27_6125_left <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_left;
     BIN_OP_LT_uxn_device_h_l117_c27_6125_right <= VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output := BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_d1b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c6_bf7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b4ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_d1b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_6baa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_0145_return_output;
     VAR_MUX_uxn_device_h_l116_c27_f5eb_cond := VAR_BIN_OP_GT_uxn_device_h_l116_c27_5db0_return_output;
     VAR_MUX_uxn_device_h_l117_c27_5ac3_cond := VAR_BIN_OP_LT_uxn_device_h_l117_c27_6125_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c1_eb95] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output;

     -- MUX[uxn_device_h_l116_c27_f5eb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l116_c27_f5eb_cond <= VAR_MUX_uxn_device_h_l116_c27_f5eb_cond;
     MUX_uxn_device_h_l116_c27_f5eb_iftrue <= VAR_MUX_uxn_device_h_l116_c27_f5eb_iftrue;
     MUX_uxn_device_h_l116_c27_f5eb_iffalse <= VAR_MUX_uxn_device_h_l116_c27_f5eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l116_c27_f5eb_return_output := MUX_uxn_device_h_l116_c27_f5eb_return_output;

     -- MUX[uxn_device_h_l117_c27_5ac3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l117_c27_5ac3_cond <= VAR_MUX_uxn_device_h_l117_c27_5ac3_cond;
     MUX_uxn_device_h_l117_c27_5ac3_iftrue <= VAR_MUX_uxn_device_h_l117_c27_5ac3_iftrue;
     MUX_uxn_device_h_l117_c27_5ac3_iffalse <= VAR_MUX_uxn_device_h_l117_c27_5ac3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l117_c27_5ac3_return_output := MUX_uxn_device_h_l117_c27_5ac3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_0aaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_0aaf_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_left := VAR_MUX_uxn_device_h_l116_c27_f5eb_return_output;
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue := VAR_MUX_uxn_device_h_l116_c27_f5eb_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_right := VAR_MUX_uxn_device_h_l117_c27_5ac3_return_output;
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue := VAR_MUX_uxn_device_h_l117_c27_5ac3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output;
     VAR_peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c1_eb95_return_output;
     -- port_range_palette_hi_MUX[uxn_device_h_l114_c2_4636] LATENCY=0
     -- Inputs
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_cond;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iftrue;
     port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse <= VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_iffalse;
     -- Outputs
     VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output := port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output;

     -- BIN_OP_AND[uxn_device_h_l118_c7_bd22] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l118_c7_bd22_left <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_left;
     BIN_OP_AND_uxn_device_h_l118_c7_bd22_right <= VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output := BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output;

     -- port_range_palette_lo_MUX[uxn_device_h_l114_c2_4636] LATENCY=0
     -- Inputs
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_cond;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iftrue;
     port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse <= VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_iffalse;
     -- Outputs
     VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output := port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output;

     -- peek_dev[uxn_device_h_l115_c14_d111] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l115_c14_d111_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l115_c14_d111_address <= VAR_peek_dev_uxn_device_h_l115_c14_d111_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l115_c14_d111_return_output := peek_dev_uxn_device_h_l115_c14_d111_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_cb5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c1_c3b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond := VAR_BIN_OP_AND_uxn_device_h_l118_c7_bd22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_cb5d_return_output;
     VAR_peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c1_c3b4_return_output;
     VAR_system_deo_uxn_device_h_l115_c3_72eb_d := VAR_peek_dev_uxn_device_h_l115_c14_d111_return_output;
     REG_VAR_port_range_palette_hi := VAR_port_range_palette_hi_MUX_uxn_device_h_l114_c2_4636_return_output;
     REG_VAR_port_range_palette_lo := VAR_port_range_palette_lo_MUX_uxn_device_h_l114_c2_4636_return_output;
     -- system_deo[uxn_device_h_l115_c3_72eb] LATENCY=0
     -- Inputs
     system_deo_uxn_device_h_l115_c3_72eb_d <= VAR_system_deo_uxn_device_h_l115_c3_72eb_d;
     system_deo_uxn_device_h_l115_c3_72eb_device_port <= VAR_system_deo_uxn_device_h_l115_c3_72eb_device_port;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c1_4919] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_58ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c1_8f39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output;

     -- peek_dev[uxn_device_h_l131_c15_e64b] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l131_c15_e64b_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l131_c15_e64b_address <= VAR_peek_dev_uxn_device_h_l131_c15_e64b_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l131_c15_e64b_return_output := peek_dev_uxn_device_h_l131_c15_e64b_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_58ac_return_output;
     VAR_peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c1_4919_return_output;
     VAR_peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c1_8f39_return_output;
     VAR_console_deo_uxn_device_h_l131_c3_ef01_d := VAR_peek_dev_uxn_device_h_l131_c15_e64b_return_output;
     -- peek_dev[uxn_device_h_l134_c14_77e2] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l134_c14_77e2_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l134_c14_77e2_address <= VAR_peek_dev_uxn_device_h_l134_c14_77e2_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l134_c14_77e2_return_output := peek_dev_uxn_device_h_l134_c14_77e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c1_c8b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output;

     -- peek_dev[uxn_device_h_l127_c19_4c67] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l127_c19_4c67_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l127_c19_4c67_address <= VAR_peek_dev_uxn_device_h_l127_c19_4c67_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l127_c19_4c67_return_output := peek_dev_uxn_device_h_l127_c19_4c67_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_874a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output;

     -- console_deo[uxn_device_h_l131_c3_ef01] LATENCY=0
     -- Inputs
     console_deo_uxn_device_h_l131_c3_ef01_d <= VAR_console_deo_uxn_device_h_l131_c3_ef01_d;
     console_deo_uxn_device_h_l131_c3_ef01_device_port <= VAR_console_deo_uxn_device_h_l131_c3_ef01_device_port;
     -- Outputs

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_874a_return_output;
     VAR_peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c1_c8b2_return_output;
     VAR_screen_palette_uxn_device_h_l127_c4_489c_device_port := VAR_peek_dev_uxn_device_h_l127_c19_4c67_return_output;
     VAR_screen_deo_uxn_device_h_l134_c3_d301_d := VAR_peek_dev_uxn_device_h_l134_c14_77e2_return_output;
     -- peek_dev[uxn_device_h_l137_c15_8bf5] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l137_c15_8bf5_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l137_c15_8bf5_address <= VAR_peek_dev_uxn_device_h_l137_c15_8bf5_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l137_c15_8bf5_return_output := peek_dev_uxn_device_h_l137_c15_8bf5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c1_181c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output;

     -- screen_deo[uxn_device_h_l134_c3_d301] LATENCY=0
     -- Inputs
     screen_deo_uxn_device_h_l134_c3_d301_d <= VAR_screen_deo_uxn_device_h_l134_c3_d301_d;
     screen_deo_uxn_device_h_l134_c3_d301_device_port <= VAR_screen_deo_uxn_device_h_l134_c3_d301_device_port;
     -- Outputs

     -- screen_palette[uxn_device_h_l127_c4_489c] LATENCY=0
     -- Inputs
     screen_palette_uxn_device_h_l127_c4_489c_device_port <= VAR_screen_palette_uxn_device_h_l127_c4_489c_device_port;
     -- Outputs

     -- Submodule level 7
     VAR_peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c1_181c_return_output;
     VAR_file_deo_uxn_device_h_l137_c3_3444_d := VAR_peek_dev_uxn_device_h_l137_c15_8bf5_return_output;
     -- file_deo[uxn_device_h_l137_c3_3444] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l137_c3_3444_file_index <= VAR_file_deo_uxn_device_h_l137_c3_3444_file_index;
     file_deo_uxn_device_h_l137_c3_3444_d <= VAR_file_deo_uxn_device_h_l137_c3_3444_d;
     file_deo_uxn_device_h_l137_c3_3444_p <= VAR_file_deo_uxn_device_h_l137_c3_3444_p;
     -- Outputs

     -- peek_dev[uxn_device_h_l140_c15_18f0] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l140_c15_18f0_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l140_c15_18f0_address <= VAR_peek_dev_uxn_device_h_l140_c15_18f0_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l140_c15_18f0_return_output := peek_dev_uxn_device_h_l140_c15_18f0_return_output;

     -- Submodule level 8
     VAR_file_deo_uxn_device_h_l140_c3_4772_d := VAR_peek_dev_uxn_device_h_l140_c15_18f0_return_output;
     -- file_deo[uxn_device_h_l140_c3_4772] LATENCY=0
     -- Inputs
     file_deo_uxn_device_h_l140_c3_4772_file_index <= VAR_file_deo_uxn_device_h_l140_c3_4772_file_index;
     file_deo_uxn_device_h_l140_c3_4772_d <= VAR_file_deo_uxn_device_h_l140_c3_4772_d;
     file_deo_uxn_device_h_l140_c3_4772_p <= VAR_file_deo_uxn_device_h_l140_c3_4772_p;
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
