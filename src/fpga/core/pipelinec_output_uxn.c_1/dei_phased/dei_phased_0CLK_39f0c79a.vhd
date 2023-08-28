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
-- Submodules: 69
entity dei_phased_0CLK_39f0c79a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(2 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_offset : in unsigned(7 downto 0);
 addr : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end dei_phased_0CLK_39f0c79a;
architecture arch of dei_phased_0CLK_39f0c79a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal dei_mask : uint16_t_16 := (
0 => to_unsigned(0, 16),
1 => to_unsigned(0, 16),
2 => to_unsigned(60, 16),
3 => to_unsigned(20, 16),
4 => to_unsigned(20, 16),
5 => to_unsigned(20, 16),
6 => to_unsigned(20, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(0, 16),
11 => to_unsigned(0, 16),
12 => to_unsigned(2047, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal is_event16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal d : unsigned(7 downto 0) := to_unsigned(0, 8);
signal dev_ram_at_addr : unsigned(7 downto 0) := to_unsigned(0, 8);
signal value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_event : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_dei_mask : uint16_t_16;
signal REG_COMB_is_event16 : unsigned(15 downto 0);
signal REG_COMB_d : unsigned(7 downto 0);
signal REG_COMB_dev_ram_at_addr : unsigned(7 downto 0);
signal REG_COMB_value : unsigned(7 downto 0);
signal REG_COMB_is_event : unsigned(0 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l88_c6_5e4c]
signal BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l88_c1_86a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l95_c7_5ace]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(0 downto 0);

-- is_event_MUX[uxn_device_h_l88_c2_8828]
signal is_event_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal is_event_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(0 downto 0);
signal is_event_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(0 downto 0);
signal is_event_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(0 downto 0);

-- dev_ram_at_addr_MUX[uxn_device_h_l88_c2_8828]
signal dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);

-- value_MUX[uxn_device_h_l88_c2_8828]
signal value_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);

-- is_event16_MUX[uxn_device_h_l88_c2_8828]
signal is_event16_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(15 downto 0);
signal is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(15 downto 0);
signal is_event16_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(15 downto 0);

-- d_MUX[uxn_device_h_l88_c2_8828]
signal d_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal d_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
signal d_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
signal d_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l88_c2_8828]
signal result_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l90_c7_dff4]
signal BIN_OP_AND_uxn_device_h_l90_c7_dff4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l90_c7_dff4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l91_c26_1a7b]
signal CONST_SR_4_uxn_device_h_l91_c26_1a7b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l91_c17_54fb]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l91_c42_361d]
signal BIN_OP_AND_uxn_device_h_l91_c42_361d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c42_361d_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l91_c17_4bba]
signal BIN_OP_SR_uxn_device_h_l91_c17_4bba_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l91_c17_4bba_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l91_c17_283b]
signal BIN_OP_AND_uxn_device_h_l91_c17_283b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c17_283b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output : unsigned(15 downto 0);

-- peek_dev[uxn_device_h_l93_c21_6fa4]
signal peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l93_c21_6fa4_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l93_c21_6fa4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l95_c11_6c9b]
signal BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l95_c1_83d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l111_c7_2403]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(0 downto 0);

-- dev_ram_at_addr_MUX[uxn_device_h_l95_c7_5ace]
signal dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(7 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(7 downto 0);
signal dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(7 downto 0);

-- value_MUX[uxn_device_h_l95_c7_5ace]
signal value_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l95_c7_5ace]
signal result_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_device_h_l96_c21_a1bf]
signal peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l96_c21_a1bf_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l96_c21_a1bf_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l97_c1_0426]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c1_17f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l97_c3_2da7]
signal value_MUX_uxn_device_h_l97_c3_2da7_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l97_c3_2da7_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l97_c3_2da7_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l97_c3_2da7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c8_6328]
signal BIN_OP_EQ_uxn_device_h_l98_c8_6328_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c8_6328_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c1_6431]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c9_d4ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l98_c4_db47]
signal value_MUX_uxn_device_h_l98_c4_db47_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l98_c4_db47_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l98_c4_db47_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l98_c4_db47_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l99_c13_3097]
signal screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l99_c13_3097_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l99_c13_3097_default_value : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l99_c13_3097_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c13_cee6]
signal BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c1_eb1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c1_4b87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l101_c9_d4ea]
signal value_MUX_uxn_device_h_l101_c9_d4ea_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l101_c9_d4ea_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l101_c9_d4ea_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l101_c9_d4ea_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l102_c13_1687]
signal datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l102_c13_1687_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l102_c13_1687_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l105_c5_4b57]
signal put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l105_c5_4b57_sp : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l105_c5_4b57_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l105_c5_4b57_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l105_c5_4b57_value : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l108_c4_1a74]
signal put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l108_c4_1a74_sp : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l108_c4_1a74_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l108_c4_1a74_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l108_c4_1a74_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l111_c11_c868]
signal BIN_OP_EQ_uxn_device_h_l111_c11_c868_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l111_c11_c868_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l111_c1_f6af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l111_c7_2403]
signal value_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l111_c7_2403]
signal result_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_e375]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l112_c3_9d72]
signal value_MUX_uxn_device_h_l112_c3_9d72_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l112_c3_9d72_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l112_c3_9d72_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l112_c3_9d72_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l112_c3_9d72]
signal result_MUX_uxn_device_h_l112_c3_9d72_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l112_c3_9d72_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l112_c3_9d72_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l112_c3_9d72_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c8_ce1a]
signal BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c1_c300]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c9_ab37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l113_c4_f695]
signal value_MUX_uxn_device_h_l113_c4_f695_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l113_c4_f695_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l113_c4_f695_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l113_c4_f695_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l113_c4_f695]
signal result_MUX_uxn_device_h_l113_c4_f695_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c4_f695_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c4_f695_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c4_f695_return_output : unsigned(0 downto 0);

-- screen_dei[uxn_device_h_l114_c13_9ad7]
signal screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l114_c13_9ad7_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l114_c13_9ad7_default_value : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l114_c13_9ad7_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l115_c5_3969]
signal put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l115_c5_3969_sp : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l115_c5_3969_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l115_c5_3969_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l115_c5_3969_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c13_6887]
signal BIN_OP_EQ_uxn_device_h_l117_c13_6887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c13_6887_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c1_7763]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output : unsigned(0 downto 0);

-- value_MUX[uxn_device_h_l117_c9_ab37]
signal value_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
signal value_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(7 downto 0);
signal value_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l117_c9_ab37]
signal result_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(0 downto 0);

-- datetime_dei[uxn_device_h_l118_c13_aeb1]
signal datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l118_c13_aeb1_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l118_c13_aeb1_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l119_c5_6ba9]
signal put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l119_c5_6ba9_sp : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l119_c5_6ba9_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l119_c5_6ba9_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l119_c5_6ba9_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l128_c11_1cbf]
signal BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l128_c7_63cd]
signal result_MUX_uxn_device_h_l128_c7_63cd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l128_c7_63cd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l128_c7_63cd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l128_c7_63cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c11_ff05]
signal BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l131_c7_2d62]
signal result_MUX_uxn_device_h_l131_c7_2d62_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l131_c7_2d62_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l131_c7_2d62_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l131_c7_2d62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_d122]
signal BIN_OP_EQ_uxn_device_h_l134_c11_d122_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_d122_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l134_c7_679a]
signal result_MUX_uxn_device_h_l134_c7_679a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l134_c7_679a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l134_c7_679a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l134_c7_679a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_996f]
signal BIN_OP_EQ_uxn_device_h_l137_c11_996f_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_996f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l137_c7_ef67]
signal result_MUX_uxn_device_h_l137_c7_ef67_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l137_c7_ef67_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l137_c7_ef67_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l137_c7_ef67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l140_c11_0cf3]
signal BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l140_c7_c1a7]
signal result_MUX_uxn_device_h_l140_c7_c1a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l140_c7_c1a7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l140_c7_c1a7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l140_c7_c1a7_return_output : unsigned(0 downto 0);

function CAST_TO_uint1_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l88_c6_5e4c
BIN_OP_EQ_uxn_device_h_l88_c6_5e4c : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left,
BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right,
BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output);

-- is_event_MUX_uxn_device_h_l88_c2_8828
is_event_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_event_MUX_uxn_device_h_l88_c2_8828_cond,
is_event_MUX_uxn_device_h_l88_c2_8828_iftrue,
is_event_MUX_uxn_device_h_l88_c2_8828_iffalse,
is_event_MUX_uxn_device_h_l88_c2_8828_return_output);

-- dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828
dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond,
dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue,
dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse,
dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output);

-- value_MUX_uxn_device_h_l88_c2_8828
value_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l88_c2_8828_cond,
value_MUX_uxn_device_h_l88_c2_8828_iftrue,
value_MUX_uxn_device_h_l88_c2_8828_iffalse,
value_MUX_uxn_device_h_l88_c2_8828_return_output);

-- is_event16_MUX_uxn_device_h_l88_c2_8828
is_event16_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
is_event16_MUX_uxn_device_h_l88_c2_8828_cond,
is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue,
is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse,
is_event16_MUX_uxn_device_h_l88_c2_8828_return_output);

-- d_MUX_uxn_device_h_l88_c2_8828
d_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
d_MUX_uxn_device_h_l88_c2_8828_cond,
d_MUX_uxn_device_h_l88_c2_8828_iftrue,
d_MUX_uxn_device_h_l88_c2_8828_iffalse,
d_MUX_uxn_device_h_l88_c2_8828_return_output);

-- result_MUX_uxn_device_h_l88_c2_8828
result_MUX_uxn_device_h_l88_c2_8828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_8828_cond,
result_MUX_uxn_device_h_l88_c2_8828_iftrue,
result_MUX_uxn_device_h_l88_c2_8828_iffalse,
result_MUX_uxn_device_h_l88_c2_8828_return_output);

-- BIN_OP_AND_uxn_device_h_l90_c7_dff4
BIN_OP_AND_uxn_device_h_l90_c7_dff4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l90_c7_dff4_left,
BIN_OP_AND_uxn_device_h_l90_c7_dff4_right,
BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output);

-- CONST_SR_4_uxn_device_h_l91_c26_1a7b
CONST_SR_4_uxn_device_h_l91_c26_1a7b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l91_c26_1a7b_x,
CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output);

-- BIN_OP_AND_uxn_device_h_l91_c42_361d
BIN_OP_AND_uxn_device_h_l91_c42_361d : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l91_c42_361d_left,
BIN_OP_AND_uxn_device_h_l91_c42_361d_right,
BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output);

-- BIN_OP_SR_uxn_device_h_l91_c17_4bba
BIN_OP_SR_uxn_device_h_l91_c17_4bba : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l91_c17_4bba_left,
BIN_OP_SR_uxn_device_h_l91_c17_4bba_right,
BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output);

-- BIN_OP_AND_uxn_device_h_l91_c17_283b
BIN_OP_AND_uxn_device_h_l91_c17_283b : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l91_c17_283b_left,
BIN_OP_AND_uxn_device_h_l91_c17_283b_right,
BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output);

-- peek_dev_uxn_device_h_l93_c21_6fa4
peek_dev_uxn_device_h_l93_c21_6fa4 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE,
peek_dev_uxn_device_h_l93_c21_6fa4_address,
peek_dev_uxn_device_h_l93_c21_6fa4_return_output);

-- BIN_OP_EQ_uxn_device_h_l95_c11_6c9b
BIN_OP_EQ_uxn_device_h_l95_c11_6c9b : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left,
BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right,
BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output);

-- dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace
dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond,
dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue,
dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse,
dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output);

-- value_MUX_uxn_device_h_l95_c7_5ace
value_MUX_uxn_device_h_l95_c7_5ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l95_c7_5ace_cond,
value_MUX_uxn_device_h_l95_c7_5ace_iftrue,
value_MUX_uxn_device_h_l95_c7_5ace_iffalse,
value_MUX_uxn_device_h_l95_c7_5ace_return_output);

-- result_MUX_uxn_device_h_l95_c7_5ace
result_MUX_uxn_device_h_l95_c7_5ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c7_5ace_cond,
result_MUX_uxn_device_h_l95_c7_5ace_iftrue,
result_MUX_uxn_device_h_l95_c7_5ace_iffalse,
result_MUX_uxn_device_h_l95_c7_5ace_return_output);

-- peek_dev_uxn_device_h_l96_c21_a1bf
peek_dev_uxn_device_h_l96_c21_a1bf : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE,
peek_dev_uxn_device_h_l96_c21_a1bf_address,
peek_dev_uxn_device_h_l96_c21_a1bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output);

-- value_MUX_uxn_device_h_l97_c3_2da7
value_MUX_uxn_device_h_l97_c3_2da7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l97_c3_2da7_cond,
value_MUX_uxn_device_h_l97_c3_2da7_iftrue,
value_MUX_uxn_device_h_l97_c3_2da7_iffalse,
value_MUX_uxn_device_h_l97_c3_2da7_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c8_6328
BIN_OP_EQ_uxn_device_h_l98_c8_6328 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c8_6328_left,
BIN_OP_EQ_uxn_device_h_l98_c8_6328_right,
BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output);

-- value_MUX_uxn_device_h_l98_c4_db47
value_MUX_uxn_device_h_l98_c4_db47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l98_c4_db47_cond,
value_MUX_uxn_device_h_l98_c4_db47_iftrue,
value_MUX_uxn_device_h_l98_c4_db47_iffalse,
value_MUX_uxn_device_h_l98_c4_db47_return_output);

-- screen_dei_uxn_device_h_l99_c13_3097
screen_dei_uxn_device_h_l99_c13_3097 : entity work.screen_dei_0CLK_b6546dec port map (
clk,
screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE,
screen_dei_uxn_device_h_l99_c13_3097_addr,
screen_dei_uxn_device_h_l99_c13_3097_default_value,
screen_dei_uxn_device_h_l99_c13_3097_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c13_cee6
BIN_OP_EQ_uxn_device_h_l101_c13_cee6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left,
BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right,
BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output);

-- value_MUX_uxn_device_h_l101_c9_d4ea
value_MUX_uxn_device_h_l101_c9_d4ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l101_c9_d4ea_cond,
value_MUX_uxn_device_h_l101_c9_d4ea_iftrue,
value_MUX_uxn_device_h_l101_c9_d4ea_iffalse,
value_MUX_uxn_device_h_l101_c9_d4ea_return_output);

-- datetime_dei_uxn_device_h_l102_c13_1687
datetime_dei_uxn_device_h_l102_c13_1687 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l102_c13_1687_addr,
datetime_dei_uxn_device_h_l102_c13_1687_return_output);

-- put_stack_uxn_device_h_l105_c5_4b57
put_stack_uxn_device_h_l105_c5_4b57 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE,
put_stack_uxn_device_h_l105_c5_4b57_sp,
put_stack_uxn_device_h_l105_c5_4b57_stack_index,
put_stack_uxn_device_h_l105_c5_4b57_offset,
put_stack_uxn_device_h_l105_c5_4b57_value);

-- put_stack_uxn_device_h_l108_c4_1a74
put_stack_uxn_device_h_l108_c4_1a74 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE,
put_stack_uxn_device_h_l108_c4_1a74_sp,
put_stack_uxn_device_h_l108_c4_1a74_stack_index,
put_stack_uxn_device_h_l108_c4_1a74_offset,
put_stack_uxn_device_h_l108_c4_1a74_value);

-- BIN_OP_EQ_uxn_device_h_l111_c11_c868
BIN_OP_EQ_uxn_device_h_l111_c11_c868 : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l111_c11_c868_left,
BIN_OP_EQ_uxn_device_h_l111_c11_c868_right,
BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output);

-- value_MUX_uxn_device_h_l111_c7_2403
value_MUX_uxn_device_h_l111_c7_2403 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l111_c7_2403_cond,
value_MUX_uxn_device_h_l111_c7_2403_iftrue,
value_MUX_uxn_device_h_l111_c7_2403_iffalse,
value_MUX_uxn_device_h_l111_c7_2403_return_output);

-- result_MUX_uxn_device_h_l111_c7_2403
result_MUX_uxn_device_h_l111_c7_2403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l111_c7_2403_cond,
result_MUX_uxn_device_h_l111_c7_2403_iftrue,
result_MUX_uxn_device_h_l111_c7_2403_iffalse,
result_MUX_uxn_device_h_l111_c7_2403_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output);

-- value_MUX_uxn_device_h_l112_c3_9d72
value_MUX_uxn_device_h_l112_c3_9d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l112_c3_9d72_cond,
value_MUX_uxn_device_h_l112_c3_9d72_iftrue,
value_MUX_uxn_device_h_l112_c3_9d72_iffalse,
value_MUX_uxn_device_h_l112_c3_9d72_return_output);

-- result_MUX_uxn_device_h_l112_c3_9d72
result_MUX_uxn_device_h_l112_c3_9d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l112_c3_9d72_cond,
result_MUX_uxn_device_h_l112_c3_9d72_iftrue,
result_MUX_uxn_device_h_l112_c3_9d72_iffalse,
result_MUX_uxn_device_h_l112_c3_9d72_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c8_ce1a
BIN_OP_EQ_uxn_device_h_l113_c8_ce1a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left,
BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right,
BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output);

-- value_MUX_uxn_device_h_l113_c4_f695
value_MUX_uxn_device_h_l113_c4_f695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l113_c4_f695_cond,
value_MUX_uxn_device_h_l113_c4_f695_iftrue,
value_MUX_uxn_device_h_l113_c4_f695_iffalse,
value_MUX_uxn_device_h_l113_c4_f695_return_output);

-- result_MUX_uxn_device_h_l113_c4_f695
result_MUX_uxn_device_h_l113_c4_f695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c4_f695_cond,
result_MUX_uxn_device_h_l113_c4_f695_iftrue,
result_MUX_uxn_device_h_l113_c4_f695_iffalse,
result_MUX_uxn_device_h_l113_c4_f695_return_output);

-- screen_dei_uxn_device_h_l114_c13_9ad7
screen_dei_uxn_device_h_l114_c13_9ad7 : entity work.screen_dei_0CLK_b6546dec port map (
clk,
screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE,
screen_dei_uxn_device_h_l114_c13_9ad7_addr,
screen_dei_uxn_device_h_l114_c13_9ad7_default_value,
screen_dei_uxn_device_h_l114_c13_9ad7_return_output);

-- put_stack_uxn_device_h_l115_c5_3969
put_stack_uxn_device_h_l115_c5_3969 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE,
put_stack_uxn_device_h_l115_c5_3969_sp,
put_stack_uxn_device_h_l115_c5_3969_stack_index,
put_stack_uxn_device_h_l115_c5_3969_offset,
put_stack_uxn_device_h_l115_c5_3969_value);

-- BIN_OP_EQ_uxn_device_h_l117_c13_6887
BIN_OP_EQ_uxn_device_h_l117_c13_6887 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c13_6887_left,
BIN_OP_EQ_uxn_device_h_l117_c13_6887_right,
BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output);

-- value_MUX_uxn_device_h_l117_c9_ab37
value_MUX_uxn_device_h_l117_c9_ab37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
value_MUX_uxn_device_h_l117_c9_ab37_cond,
value_MUX_uxn_device_h_l117_c9_ab37_iftrue,
value_MUX_uxn_device_h_l117_c9_ab37_iffalse,
value_MUX_uxn_device_h_l117_c9_ab37_return_output);

-- result_MUX_uxn_device_h_l117_c9_ab37
result_MUX_uxn_device_h_l117_c9_ab37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c9_ab37_cond,
result_MUX_uxn_device_h_l117_c9_ab37_iftrue,
result_MUX_uxn_device_h_l117_c9_ab37_iffalse,
result_MUX_uxn_device_h_l117_c9_ab37_return_output);

-- datetime_dei_uxn_device_h_l118_c13_aeb1
datetime_dei_uxn_device_h_l118_c13_aeb1 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l118_c13_aeb1_addr,
datetime_dei_uxn_device_h_l118_c13_aeb1_return_output);

-- put_stack_uxn_device_h_l119_c5_6ba9
put_stack_uxn_device_h_l119_c5_6ba9 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE,
put_stack_uxn_device_h_l119_c5_6ba9_sp,
put_stack_uxn_device_h_l119_c5_6ba9_stack_index,
put_stack_uxn_device_h_l119_c5_6ba9_offset,
put_stack_uxn_device_h_l119_c5_6ba9_value);

-- BIN_OP_EQ_uxn_device_h_l128_c11_1cbf
BIN_OP_EQ_uxn_device_h_l128_c11_1cbf : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left,
BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right,
BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output);

-- result_MUX_uxn_device_h_l128_c7_63cd
result_MUX_uxn_device_h_l128_c7_63cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l128_c7_63cd_cond,
result_MUX_uxn_device_h_l128_c7_63cd_iftrue,
result_MUX_uxn_device_h_l128_c7_63cd_iffalse,
result_MUX_uxn_device_h_l128_c7_63cd_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c11_ff05
BIN_OP_EQ_uxn_device_h_l131_c11_ff05 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left,
BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right,
BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output);

-- result_MUX_uxn_device_h_l131_c7_2d62
result_MUX_uxn_device_h_l131_c7_2d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l131_c7_2d62_cond,
result_MUX_uxn_device_h_l131_c7_2d62_iftrue,
result_MUX_uxn_device_h_l131_c7_2d62_iffalse,
result_MUX_uxn_device_h_l131_c7_2d62_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_d122
BIN_OP_EQ_uxn_device_h_l134_c11_d122 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_d122_left,
BIN_OP_EQ_uxn_device_h_l134_c11_d122_right,
BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output);

-- result_MUX_uxn_device_h_l134_c7_679a
result_MUX_uxn_device_h_l134_c7_679a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l134_c7_679a_cond,
result_MUX_uxn_device_h_l134_c7_679a_iftrue,
result_MUX_uxn_device_h_l134_c7_679a_iffalse,
result_MUX_uxn_device_h_l134_c7_679a_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_996f
BIN_OP_EQ_uxn_device_h_l137_c11_996f : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_996f_left,
BIN_OP_EQ_uxn_device_h_l137_c11_996f_right,
BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output);

-- result_MUX_uxn_device_h_l137_c7_ef67
result_MUX_uxn_device_h_l137_c7_ef67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l137_c7_ef67_cond,
result_MUX_uxn_device_h_l137_c7_ef67_iftrue,
result_MUX_uxn_device_h_l137_c7_ef67_iffalse,
result_MUX_uxn_device_h_l137_c7_ef67_return_output);

-- BIN_OP_EQ_uxn_device_h_l140_c11_0cf3
BIN_OP_EQ_uxn_device_h_l140_c11_0cf3 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left,
BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right,
BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output);

-- result_MUX_uxn_device_h_l140_c7_c1a7
result_MUX_uxn_device_h_l140_c7_c1a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l140_c7_c1a7_cond,
result_MUX_uxn_device_h_l140_c7_c1a7_iftrue,
result_MUX_uxn_device_h_l140_c7_c1a7_iffalse,
result_MUX_uxn_device_h_l140_c7_c1a7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 sp,
 stack_index,
 stack_offset,
 addr,
 -- Registers
 dei_mask,
 is_event16,
 d,
 dev_ram_at_addr,
 value,
 is_event,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output,
 is_event_MUX_uxn_device_h_l88_c2_8828_return_output,
 dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output,
 value_MUX_uxn_device_h_l88_c2_8828_return_output,
 is_event16_MUX_uxn_device_h_l88_c2_8828_return_output,
 d_MUX_uxn_device_h_l88_c2_8828_return_output,
 result_MUX_uxn_device_h_l88_c2_8828_return_output,
 BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output,
 CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output,
 BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output,
 BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output,
 BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output,
 peek_dev_uxn_device_h_l93_c21_6fa4_return_output,
 BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output,
 dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output,
 value_MUX_uxn_device_h_l95_c7_5ace_return_output,
 result_MUX_uxn_device_h_l95_c7_5ace_return_output,
 peek_dev_uxn_device_h_l96_c21_a1bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output,
 value_MUX_uxn_device_h_l97_c3_2da7_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output,
 value_MUX_uxn_device_h_l98_c4_db47_return_output,
 screen_dei_uxn_device_h_l99_c13_3097_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output,
 value_MUX_uxn_device_h_l101_c9_d4ea_return_output,
 datetime_dei_uxn_device_h_l102_c13_1687_return_output,
 BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output,
 value_MUX_uxn_device_h_l111_c7_2403_return_output,
 result_MUX_uxn_device_h_l111_c7_2403_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output,
 value_MUX_uxn_device_h_l112_c3_9d72_return_output,
 result_MUX_uxn_device_h_l112_c3_9d72_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output,
 value_MUX_uxn_device_h_l113_c4_f695_return_output,
 result_MUX_uxn_device_h_l113_c4_f695_return_output,
 screen_dei_uxn_device_h_l114_c13_9ad7_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output,
 value_MUX_uxn_device_h_l117_c9_ab37_return_output,
 result_MUX_uxn_device_h_l117_c9_ab37_return_output,
 datetime_dei_uxn_device_h_l118_c13_aeb1_return_output,
 BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output,
 result_MUX_uxn_device_h_l128_c7_63cd_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output,
 result_MUX_uxn_device_h_l131_c7_2d62_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output,
 result_MUX_uxn_device_h_l134_c7_679a_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output,
 result_MUX_uxn_device_h_l137_c7_ef67_return_output,
 BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output,
 result_MUX_uxn_device_h_l140_c7_c1a7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(2 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_offset : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(0 downto 0);
 variable VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(0 downto 0);
 variable VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(0 downto 0);
 variable VAR_is_event_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(0 downto 0);
 variable VAR_is_event_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(15 downto 0);
 variable VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(15 downto 0);
 variable VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(15 downto 0);
 variable VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_d_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(7 downto 0);
 variable VAR_d_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(7 downto 0);
 variable VAR_d_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(7 downto 0);
 variable VAR_d_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_8828_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_8828_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c7_5ace_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_8828_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_8828_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l92_c14_09b2_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l93_c21_6fa4_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l93_c21_6fa4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(0 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(7 downto 0);
 variable VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l97_c3_2da7_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c7_5ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c7_5ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l111_c7_2403_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l96_c21_a1bf_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l97_c3_2da7_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l98_c4_db47_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l97_c3_2da7_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l97_c3_2da7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l98_c4_db47_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l98_c4_db47_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l101_c9_d4ea_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l98_c4_db47_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l99_c13_3097_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l99_c13_3097_default_value : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l99_c13_3097_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l101_c9_d4ea_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l102_c13_1687_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l102_c13_1687_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l105_c5_4b57_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l105_c5_4b57_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l105_c5_4b57_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l105_c5_4b57_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l108_c4_1a74_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l108_c4_1a74_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l108_c4_1a74_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l108_c4_1a74_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l112_c3_9d72_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l111_c7_2403_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l112_c3_9d72_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l111_c7_2403_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l128_c7_63cd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l111_c7_2403_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l112_c3_9d72_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l113_c4_f695_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l112_c3_9d72_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l112_c3_9d72_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l112_c3_9d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c4_f695_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l112_c3_9d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l112_c3_9d72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l113_c4_f695_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l113_c4_f695_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l113_c4_f695_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c4_f695_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c4_f695_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c9_ab37_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c4_f695_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l114_c13_9ad7_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l114_c13_9ad7_default_value : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l114_c13_9ad7_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l115_c5_3969_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l115_c5_3969_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l115_c5_3969_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l115_c5_3969_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse : unsigned(0 downto 0);
 variable VAR_value_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(7 downto 0);
 variable VAR_value_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c9_ab37_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c9_ab37_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c9_ab37_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l119_c5_6ba9_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l119_c5_6ba9_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l119_c5_6ba9_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l119_c5_6ba9_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l128_c7_63cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l128_c7_63cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l131_c7_2d62_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l128_c7_63cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l131_c7_2d62_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l131_c7_2d62_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l134_c7_679a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l131_c7_2d62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l134_c7_679a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l134_c7_679a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_ef67_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l134_c7_679a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_ef67_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_ef67_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l140_c7_c1a7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_ef67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l140_c7_c1a7_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_dei_mask : uint16_t_16;
variable REG_VAR_is_event16 : unsigned(15 downto 0);
variable REG_VAR_d : unsigned(7 downto 0);
variable REG_VAR_dev_ram_at_addr : unsigned(7 downto 0);
variable REG_VAR_value : unsigned(7 downto 0);
variable REG_VAR_is_event : unsigned(0 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_dei_mask := dei_mask;
  REG_VAR_is_event16 := is_event16;
  REG_VAR_d := d;
  REG_VAR_dev_ram_at_addr := dev_ram_at_addr;
  REG_VAR_value := value;
  REG_VAR_is_event := is_event;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right := to_unsigned(192, 8);
     VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right := to_unsigned(32, 6);
     VAR_result_MUX_uxn_device_h_l128_c7_63cd_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l88_c2_8828_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l112_c3_9d72_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_right := to_unsigned(240, 8);
     VAR_result_MUX_uxn_device_h_l117_c9_ab37_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_stack_offset := stack_offset;
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_left := VAR_addr;
     VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l102_c13_1687_addr := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_addr := VAR_addr;
     VAR_peek_dev_uxn_device_h_l93_c21_6fa4_address := VAR_addr;
     VAR_peek_dev_uxn_device_h_l96_c21_a1bf_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l114_c13_9ad7_addr := VAR_addr;
     VAR_screen_dei_uxn_device_h_l99_c13_3097_addr := VAR_addr;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left := d;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left := d;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_left := d;
     VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_left := d;
     VAR_d_MUX_uxn_device_h_l88_c2_8828_iffalse := d;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0 := dei_mask;
     REG_VAR_dei_mask := dei_mask;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse := dev_ram_at_addr;
     VAR_screen_dei_uxn_device_h_l114_c13_9ad7_default_value := dev_ram_at_addr;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond := is_event;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond := is_event;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond := is_event;
     VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iffalse := is_event;
     VAR_result_MUX_uxn_device_h_l112_c3_9d72_cond := is_event;
     VAR_value_MUX_uxn_device_h_l112_c3_9d72_cond := is_event;
     VAR_value_MUX_uxn_device_h_l97_c3_2da7_cond := is_event;
     VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse := is_event16;
     VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left := VAR_phase;
     VAR_result_MUX_uxn_device_h_l113_c4_f695_iftrue := result;
     VAR_result_MUX_uxn_device_h_l117_c9_ab37_iftrue := result;
     VAR_result_MUX_uxn_device_h_l131_c7_2d62_iftrue := result;
     VAR_result_MUX_uxn_device_h_l134_c7_679a_iftrue := result;
     VAR_result_MUX_uxn_device_h_l137_c7_ef67_iftrue := result;
     VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iffalse := result;
     VAR_result_MUX_uxn_device_h_l95_c7_5ace_iftrue := result;
     VAR_put_stack_uxn_device_h_l105_c5_4b57_sp := VAR_sp;
     VAR_put_stack_uxn_device_h_l108_c4_1a74_sp := VAR_sp;
     VAR_put_stack_uxn_device_h_l115_c5_3969_sp := VAR_sp;
     VAR_put_stack_uxn_device_h_l119_c5_6ba9_sp := VAR_sp;
     VAR_put_stack_uxn_device_h_l105_c5_4b57_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l108_c4_1a74_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l115_c5_3969_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l119_c5_6ba9_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l105_c5_4b57_offset := VAR_stack_offset;
     VAR_put_stack_uxn_device_h_l108_c4_1a74_offset := VAR_stack_offset;
     VAR_put_stack_uxn_device_h_l115_c5_3969_offset := VAR_stack_offset;
     VAR_put_stack_uxn_device_h_l119_c5_6ba9_offset := VAR_stack_offset;
     VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_x := value;
     VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iffalse := value;
     VAR_value_MUX_uxn_device_h_l111_c7_2403_iffalse := value;
     VAR_value_MUX_uxn_device_h_l112_c3_9d72_iffalse := value;
     VAR_value_MUX_uxn_device_h_l117_c9_ab37_iffalse := value;
     VAR_value_MUX_uxn_device_h_l88_c2_8828_iftrue := value;
     VAR_value_MUX_uxn_device_h_l97_c3_2da7_iffalse := value;
     -- BIN_OP_EQ[uxn_device_h_l131_c11_ff05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_left;
     BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output := BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c13_6887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c13_6887_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_left;
     BIN_OP_EQ_uxn_device_h_l117_c13_6887_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output := BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_5e4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l98_c8_6328] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c8_6328_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_left;
     BIN_OP_EQ_uxn_device_h_l98_c8_6328_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output := BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_d122] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_d122_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_d122_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output;

     -- BIN_OP_AND[uxn_device_h_l90_c7_dff4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l90_c7_dff4_left <= VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_left;
     BIN_OP_AND_uxn_device_h_l90_c7_dff4_right <= VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output := BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l128_c11_1cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_left;
     BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right <= VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output := BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c13_cee6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_left;
     BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output := BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_996f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_996f_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_996f_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l111_c11_c868] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l111_c11_c868_left <= VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_left;
     BIN_OP_EQ_uxn_device_h_l111_c11_c868_right <= VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output := BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output;

     -- BIN_OP_AND[uxn_device_h_l91_c42_361d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l91_c42_361d_left <= VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_left;
     BIN_OP_AND_uxn_device_h_l91_c42_361d_right <= VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output := BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c8_ce1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_left;
     BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output := BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l95_c11_6c9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_left;
     BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output := BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l140_c11_0cf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left <= VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_left;
     BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right <= VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output := BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output;

     -- CONST_SR_4[uxn_device_h_l91_c26_1a7b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l91_c26_1a7b_x <= VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output := CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output;

     -- Submodule level 1
     VAR_d_MUX_uxn_device_h_l88_c2_8828_iftrue := VAR_BIN_OP_AND_uxn_device_h_l90_c7_dff4_return_output;
     VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_right := VAR_BIN_OP_AND_uxn_device_h_l91_c42_361d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output;
     VAR_value_MUX_uxn_device_h_l101_c9_d4ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c13_cee6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond := VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output;
     VAR_result_MUX_uxn_device_h_l111_c7_2403_cond := VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output;
     VAR_value_MUX_uxn_device_h_l111_c7_2403_cond := VAR_BIN_OP_EQ_uxn_device_h_l111_c11_c868_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output;
     VAR_result_MUX_uxn_device_h_l113_c4_f695_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output;
     VAR_value_MUX_uxn_device_h_l113_c4_f695_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c8_ce1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output;
     VAR_result_MUX_uxn_device_h_l117_c9_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output;
     VAR_value_MUX_uxn_device_h_l117_c9_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c13_6887_return_output;
     VAR_result_MUX_uxn_device_h_l128_c7_63cd_cond := VAR_BIN_OP_EQ_uxn_device_h_l128_c11_1cbf_return_output;
     VAR_result_MUX_uxn_device_h_l131_c7_2d62_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c11_ff05_return_output;
     VAR_result_MUX_uxn_device_h_l134_c7_679a_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d122_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_ef67_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_996f_return_output;
     VAR_result_MUX_uxn_device_h_l140_c7_c1a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l140_c11_0cf3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_d_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_is_event_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_value_MUX_uxn_device_h_l88_c2_8828_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5e4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;
     VAR_result_MUX_uxn_device_h_l95_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;
     VAR_value_MUX_uxn_device_h_l95_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_6c9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output;
     VAR_value_MUX_uxn_device_h_l98_c4_db47_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c8_6328_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l91_c26_1a7b_return_output, 4);
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l88_c1_86a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l95_c7_5ace] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output;

     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l91_c17_54fb] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output;

     -- d_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     d_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_d_MUX_uxn_device_h_l88_c2_8828_cond;
     d_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_d_MUX_uxn_device_h_l88_c2_8828_iftrue;
     d_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_d_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_d_MUX_uxn_device_h_l88_c2_8828_return_output := d_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- result_MUX[uxn_device_h_l117_c9_ab37] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c9_ab37_cond <= VAR_result_MUX_uxn_device_h_l117_c9_ab37_cond;
     result_MUX_uxn_device_h_l117_c9_ab37_iftrue <= VAR_result_MUX_uxn_device_h_l117_c9_ab37_iftrue;
     result_MUX_uxn_device_h_l117_c9_ab37_iffalse <= VAR_result_MUX_uxn_device_h_l117_c9_ab37_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c9_ab37_return_output := result_MUX_uxn_device_h_l117_c9_ab37_return_output;

     -- result_MUX[uxn_device_h_l140_c7_c1a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l140_c7_c1a7_cond <= VAR_result_MUX_uxn_device_h_l140_c7_c1a7_cond;
     result_MUX_uxn_device_h_l140_c7_c1a7_iftrue <= VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iftrue;
     result_MUX_uxn_device_h_l140_c7_c1a7_iffalse <= VAR_result_MUX_uxn_device_h_l140_c7_c1a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l140_c7_c1a7_return_output := result_MUX_uxn_device_h_l140_c7_c1a7_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c7_5ace_return_output;
     VAR_peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l88_c1_86a2_return_output;
     VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l91_c17_54fb_return_output;
     REG_VAR_d := VAR_d_MUX_uxn_device_h_l88_c2_8828_return_output;
     VAR_result_MUX_uxn_device_h_l113_c4_f695_iffalse := VAR_result_MUX_uxn_device_h_l117_c9_ab37_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_ef67_iffalse := VAR_result_MUX_uxn_device_h_l140_c7_c1a7_return_output;
     -- result_MUX[uxn_device_h_l113_c4_f695] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c4_f695_cond <= VAR_result_MUX_uxn_device_h_l113_c4_f695_cond;
     result_MUX_uxn_device_h_l113_c4_f695_iftrue <= VAR_result_MUX_uxn_device_h_l113_c4_f695_iftrue;
     result_MUX_uxn_device_h_l113_c4_f695_iffalse <= VAR_result_MUX_uxn_device_h_l113_c4_f695_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c4_f695_return_output := result_MUX_uxn_device_h_l113_c4_f695_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l95_c1_83d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output;

     -- peek_dev[uxn_device_h_l93_c21_6fa4] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l93_c21_6fa4_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l93_c21_6fa4_address <= VAR_peek_dev_uxn_device_h_l93_c21_6fa4_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l93_c21_6fa4_return_output := peek_dev_uxn_device_h_l93_c21_6fa4_return_output;

     -- result_MUX[uxn_device_h_l137_c7_ef67] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l137_c7_ef67_cond <= VAR_result_MUX_uxn_device_h_l137_c7_ef67_cond;
     result_MUX_uxn_device_h_l137_c7_ef67_iftrue <= VAR_result_MUX_uxn_device_h_l137_c7_ef67_iftrue;
     result_MUX_uxn_device_h_l137_c7_ef67_iffalse <= VAR_result_MUX_uxn_device_h_l137_c7_ef67_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l137_c7_ef67_return_output := result_MUX_uxn_device_h_l137_c7_ef67_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l111_c7_2403] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output;

     -- BIN_OP_SR[uxn_device_h_l91_c17_4bba] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l91_c17_4bba_left <= VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_left;
     BIN_OP_SR_uxn_device_h_l91_c17_4bba_right <= VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output := BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_left := VAR_BIN_OP_SR_uxn_device_h_l91_c17_4bba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c7_2403_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output;
     VAR_peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l95_c1_83d6_return_output;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue := VAR_peek_dev_uxn_device_h_l93_c21_6fa4_return_output;
     VAR_result_MUX_uxn_device_h_l112_c3_9d72_iftrue := VAR_result_MUX_uxn_device_h_l113_c4_f695_return_output;
     VAR_result_MUX_uxn_device_h_l134_c7_679a_iffalse := VAR_result_MUX_uxn_device_h_l137_c7_ef67_return_output;
     -- peek_dev[uxn_device_h_l96_c21_a1bf] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l96_c21_a1bf_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l96_c21_a1bf_address <= VAR_peek_dev_uxn_device_h_l96_c21_a1bf_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output := peek_dev_uxn_device_h_l96_c21_a1bf_return_output;

     -- result_MUX[uxn_device_h_l112_c3_9d72] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l112_c3_9d72_cond <= VAR_result_MUX_uxn_device_h_l112_c3_9d72_cond;
     result_MUX_uxn_device_h_l112_c3_9d72_iftrue <= VAR_result_MUX_uxn_device_h_l112_c3_9d72_iftrue;
     result_MUX_uxn_device_h_l112_c3_9d72_iffalse <= VAR_result_MUX_uxn_device_h_l112_c3_9d72_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l112_c3_9d72_return_output := result_MUX_uxn_device_h_l112_c3_9d72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l111_c1_f6af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c1_17f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output;

     -- BIN_OP_AND[uxn_device_h_l91_c17_283b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l91_c17_283b_left <= VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_left;
     BIN_OP_AND_uxn_device_h_l91_c17_283b_right <= VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output := BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output;

     -- result_MUX[uxn_device_h_l134_c7_679a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l134_c7_679a_cond <= VAR_result_MUX_uxn_device_h_l134_c7_679a_cond;
     result_MUX_uxn_device_h_l134_c7_679a_iftrue <= VAR_result_MUX_uxn_device_h_l134_c7_679a_iftrue;
     result_MUX_uxn_device_h_l134_c7_679a_iffalse <= VAR_result_MUX_uxn_device_h_l134_c7_679a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l134_c7_679a_return_output := result_MUX_uxn_device_h_l134_c7_679a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l97_c1_0426] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output;

     -- Submodule level 4
     VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue := VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output;
     VAR_put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c1_17f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l111_c1_f6af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l97_c1_0426_return_output;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue := VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output;
     VAR_put_stack_uxn_device_h_l105_c5_4b57_value := VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output;
     VAR_put_stack_uxn_device_h_l108_c4_1a74_value := VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output;
     VAR_screen_dei_uxn_device_h_l99_c13_3097_default_value := VAR_peek_dev_uxn_device_h_l96_c21_a1bf_return_output;
     VAR_result_MUX_uxn_device_h_l111_c7_2403_iftrue := VAR_result_MUX_uxn_device_h_l112_c3_9d72_return_output;
     VAR_result_MUX_uxn_device_h_l131_c7_2d62_iffalse := VAR_result_MUX_uxn_device_h_l134_c7_679a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l112_c1_e375] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output;

     -- dev_ram_at_addr_MUX[uxn_device_h_l95_c7_5ace] LATENCY=0
     -- Inputs
     dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_cond;
     dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iftrue;
     dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_iffalse;
     -- Outputs
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output := dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output;

     -- is_event16_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     is_event16_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_cond;
     is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iftrue;
     is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_return_output := is_event16_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c9_d4ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output;

     -- put_stack[uxn_device_h_l108_c4_1a74] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l108_c4_1a74_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l108_c4_1a74_sp <= VAR_put_stack_uxn_device_h_l108_c4_1a74_sp;
     put_stack_uxn_device_h_l108_c4_1a74_stack_index <= VAR_put_stack_uxn_device_h_l108_c4_1a74_stack_index;
     put_stack_uxn_device_h_l108_c4_1a74_offset <= VAR_put_stack_uxn_device_h_l108_c4_1a74_offset;
     put_stack_uxn_device_h_l108_c4_1a74_value <= VAR_put_stack_uxn_device_h_l108_c4_1a74_value;
     -- Outputs

     -- CAST_TO_uint1_t[uxn_device_h_l92_c14_09b2] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l92_c14_09b2_return_output := CAST_TO_uint1_t_uint16_t(
     VAR_BIN_OP_AND_uxn_device_h_l91_c17_283b_return_output);

     -- result_MUX[uxn_device_h_l131_c7_2d62] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l131_c7_2d62_cond <= VAR_result_MUX_uxn_device_h_l131_c7_2d62_cond;
     result_MUX_uxn_device_h_l131_c7_2d62_iftrue <= VAR_result_MUX_uxn_device_h_l131_c7_2d62_iftrue;
     result_MUX_uxn_device_h_l131_c7_2d62_iffalse <= VAR_result_MUX_uxn_device_h_l131_c7_2d62_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l131_c7_2d62_return_output := result_MUX_uxn_device_h_l131_c7_2d62_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c1_6431] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output;

     -- Submodule level 5
     VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l92_c14_09b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c9_d4ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l112_c1_e375_return_output;
     VAR_screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c1_6431_return_output;
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse := VAR_dev_ram_at_addr_MUX_uxn_device_h_l95_c7_5ace_return_output;
     REG_VAR_is_event16 := VAR_is_event16_MUX_uxn_device_h_l88_c2_8828_return_output;
     VAR_result_MUX_uxn_device_h_l128_c7_63cd_iffalse := VAR_result_MUX_uxn_device_h_l131_c7_2d62_return_output;
     -- is_event_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     is_event_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_is_event_MUX_uxn_device_h_l88_c2_8828_cond;
     is_event_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iftrue;
     is_event_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_is_event_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_is_event_MUX_uxn_device_h_l88_c2_8828_return_output := is_event_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- result_MUX[uxn_device_h_l128_c7_63cd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l128_c7_63cd_cond <= VAR_result_MUX_uxn_device_h_l128_c7_63cd_cond;
     result_MUX_uxn_device_h_l128_c7_63cd_iftrue <= VAR_result_MUX_uxn_device_h_l128_c7_63cd_iftrue;
     result_MUX_uxn_device_h_l128_c7_63cd_iffalse <= VAR_result_MUX_uxn_device_h_l128_c7_63cd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l128_c7_63cd_return_output := result_MUX_uxn_device_h_l128_c7_63cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c1_4b87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c1_c300] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output;

     -- dev_ram_at_addr_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_cond;
     dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iftrue;
     dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output := dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c9_ab37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c1_eb1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output;

     -- screen_dei[uxn_device_h_l99_c13_3097] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l99_c13_3097_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l99_c13_3097_addr <= VAR_screen_dei_uxn_device_h_l99_c13_3097_addr;
     screen_dei_uxn_device_h_l99_c13_3097_default_value <= VAR_screen_dei_uxn_device_h_l99_c13_3097_default_value;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l99_c13_3097_return_output := screen_dei_uxn_device_h_l99_c13_3097_return_output;

     -- Submodule level 6
     VAR_put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c1_4b87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c9_ab37_return_output;
     VAR_datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c1_eb1c_return_output;
     VAR_put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output;
     VAR_screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c1_c300_return_output;
     REG_VAR_dev_ram_at_addr := VAR_dev_ram_at_addr_MUX_uxn_device_h_l88_c2_8828_return_output;
     REG_VAR_is_event := VAR_is_event_MUX_uxn_device_h_l88_c2_8828_return_output;
     VAR_result_MUX_uxn_device_h_l111_c7_2403_iffalse := VAR_result_MUX_uxn_device_h_l128_c7_63cd_return_output;
     VAR_value_MUX_uxn_device_h_l98_c4_db47_iftrue := VAR_screen_dei_uxn_device_h_l99_c13_3097_return_output;
     -- result_MUX[uxn_device_h_l111_c7_2403] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l111_c7_2403_cond <= VAR_result_MUX_uxn_device_h_l111_c7_2403_cond;
     result_MUX_uxn_device_h_l111_c7_2403_iftrue <= VAR_result_MUX_uxn_device_h_l111_c7_2403_iftrue;
     result_MUX_uxn_device_h_l111_c7_2403_iffalse <= VAR_result_MUX_uxn_device_h_l111_c7_2403_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l111_c7_2403_return_output := result_MUX_uxn_device_h_l111_c7_2403_return_output;

     -- screen_dei[uxn_device_h_l114_c13_9ad7] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l114_c13_9ad7_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l114_c13_9ad7_addr <= VAR_screen_dei_uxn_device_h_l114_c13_9ad7_addr;
     screen_dei_uxn_device_h_l114_c13_9ad7_default_value <= VAR_screen_dei_uxn_device_h_l114_c13_9ad7_default_value;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l114_c13_9ad7_return_output := screen_dei_uxn_device_h_l114_c13_9ad7_return_output;

     -- datetime_dei[uxn_device_h_l102_c13_1687] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l102_c13_1687_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l102_c13_1687_addr <= VAR_datetime_dei_uxn_device_h_l102_c13_1687_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l102_c13_1687_return_output := datetime_dei_uxn_device_h_l102_c13_1687_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c1_7763] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output;

     -- put_stack[uxn_device_h_l105_c5_4b57] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l105_c5_4b57_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l105_c5_4b57_sp <= VAR_put_stack_uxn_device_h_l105_c5_4b57_sp;
     put_stack_uxn_device_h_l105_c5_4b57_stack_index <= VAR_put_stack_uxn_device_h_l105_c5_4b57_stack_index;
     put_stack_uxn_device_h_l105_c5_4b57_offset <= VAR_put_stack_uxn_device_h_l105_c5_4b57_offset;
     put_stack_uxn_device_h_l105_c5_4b57_value <= VAR_put_stack_uxn_device_h_l105_c5_4b57_value;
     -- Outputs

     -- Submodule level 7
     VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output;
     VAR_put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c1_7763_return_output;
     VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iftrue := VAR_datetime_dei_uxn_device_h_l102_c13_1687_return_output;
     VAR_result_MUX_uxn_device_h_l95_c7_5ace_iffalse := VAR_result_MUX_uxn_device_h_l111_c7_2403_return_output;
     VAR_put_stack_uxn_device_h_l115_c5_3969_value := VAR_screen_dei_uxn_device_h_l114_c13_9ad7_return_output;
     VAR_value_MUX_uxn_device_h_l113_c4_f695_iftrue := VAR_screen_dei_uxn_device_h_l114_c13_9ad7_return_output;
     -- put_stack[uxn_device_h_l115_c5_3969] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l115_c5_3969_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l115_c5_3969_sp <= VAR_put_stack_uxn_device_h_l115_c5_3969_sp;
     put_stack_uxn_device_h_l115_c5_3969_stack_index <= VAR_put_stack_uxn_device_h_l115_c5_3969_stack_index;
     put_stack_uxn_device_h_l115_c5_3969_offset <= VAR_put_stack_uxn_device_h_l115_c5_3969_offset;
     put_stack_uxn_device_h_l115_c5_3969_value <= VAR_put_stack_uxn_device_h_l115_c5_3969_value;
     -- Outputs

     -- result_MUX[uxn_device_h_l95_c7_5ace] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c7_5ace_cond <= VAR_result_MUX_uxn_device_h_l95_c7_5ace_cond;
     result_MUX_uxn_device_h_l95_c7_5ace_iftrue <= VAR_result_MUX_uxn_device_h_l95_c7_5ace_iftrue;
     result_MUX_uxn_device_h_l95_c7_5ace_iffalse <= VAR_result_MUX_uxn_device_h_l95_c7_5ace_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c7_5ace_return_output := result_MUX_uxn_device_h_l95_c7_5ace_return_output;

     -- datetime_dei[uxn_device_h_l118_c13_aeb1] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l118_c13_aeb1_addr <= VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_return_output := datetime_dei_uxn_device_h_l118_c13_aeb1_return_output;

     -- value_MUX[uxn_device_h_l101_c9_d4ea] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l101_c9_d4ea_cond <= VAR_value_MUX_uxn_device_h_l101_c9_d4ea_cond;
     value_MUX_uxn_device_h_l101_c9_d4ea_iftrue <= VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iftrue;
     value_MUX_uxn_device_h_l101_c9_d4ea_iffalse <= VAR_value_MUX_uxn_device_h_l101_c9_d4ea_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l101_c9_d4ea_return_output := value_MUX_uxn_device_h_l101_c9_d4ea_return_output;

     -- Submodule level 8
     VAR_put_stack_uxn_device_h_l119_c5_6ba9_value := VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_return_output;
     VAR_value_MUX_uxn_device_h_l117_c9_ab37_iftrue := VAR_datetime_dei_uxn_device_h_l118_c13_aeb1_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_8828_iffalse := VAR_result_MUX_uxn_device_h_l95_c7_5ace_return_output;
     VAR_value_MUX_uxn_device_h_l98_c4_db47_iffalse := VAR_value_MUX_uxn_device_h_l101_c9_d4ea_return_output;
     -- value_MUX[uxn_device_h_l117_c9_ab37] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l117_c9_ab37_cond <= VAR_value_MUX_uxn_device_h_l117_c9_ab37_cond;
     value_MUX_uxn_device_h_l117_c9_ab37_iftrue <= VAR_value_MUX_uxn_device_h_l117_c9_ab37_iftrue;
     value_MUX_uxn_device_h_l117_c9_ab37_iffalse <= VAR_value_MUX_uxn_device_h_l117_c9_ab37_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l117_c9_ab37_return_output := value_MUX_uxn_device_h_l117_c9_ab37_return_output;

     -- value_MUX[uxn_device_h_l98_c4_db47] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l98_c4_db47_cond <= VAR_value_MUX_uxn_device_h_l98_c4_db47_cond;
     value_MUX_uxn_device_h_l98_c4_db47_iftrue <= VAR_value_MUX_uxn_device_h_l98_c4_db47_iftrue;
     value_MUX_uxn_device_h_l98_c4_db47_iffalse <= VAR_value_MUX_uxn_device_h_l98_c4_db47_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l98_c4_db47_return_output := value_MUX_uxn_device_h_l98_c4_db47_return_output;

     -- put_stack[uxn_device_h_l119_c5_6ba9] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l119_c5_6ba9_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l119_c5_6ba9_sp <= VAR_put_stack_uxn_device_h_l119_c5_6ba9_sp;
     put_stack_uxn_device_h_l119_c5_6ba9_stack_index <= VAR_put_stack_uxn_device_h_l119_c5_6ba9_stack_index;
     put_stack_uxn_device_h_l119_c5_6ba9_offset <= VAR_put_stack_uxn_device_h_l119_c5_6ba9_offset;
     put_stack_uxn_device_h_l119_c5_6ba9_value <= VAR_put_stack_uxn_device_h_l119_c5_6ba9_value;
     -- Outputs

     -- result_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_result_MUX_uxn_device_h_l88_c2_8828_cond;
     result_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_8828_iftrue;
     result_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_8828_return_output := result_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_8828_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_8828_return_output;
     VAR_value_MUX_uxn_device_h_l113_c4_f695_iffalse := VAR_value_MUX_uxn_device_h_l117_c9_ab37_return_output;
     VAR_value_MUX_uxn_device_h_l97_c3_2da7_iftrue := VAR_value_MUX_uxn_device_h_l98_c4_db47_return_output;
     -- value_MUX[uxn_device_h_l97_c3_2da7] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l97_c3_2da7_cond <= VAR_value_MUX_uxn_device_h_l97_c3_2da7_cond;
     value_MUX_uxn_device_h_l97_c3_2da7_iftrue <= VAR_value_MUX_uxn_device_h_l97_c3_2da7_iftrue;
     value_MUX_uxn_device_h_l97_c3_2da7_iffalse <= VAR_value_MUX_uxn_device_h_l97_c3_2da7_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l97_c3_2da7_return_output := value_MUX_uxn_device_h_l97_c3_2da7_return_output;

     -- value_MUX[uxn_device_h_l113_c4_f695] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l113_c4_f695_cond <= VAR_value_MUX_uxn_device_h_l113_c4_f695_cond;
     value_MUX_uxn_device_h_l113_c4_f695_iftrue <= VAR_value_MUX_uxn_device_h_l113_c4_f695_iftrue;
     value_MUX_uxn_device_h_l113_c4_f695_iffalse <= VAR_value_MUX_uxn_device_h_l113_c4_f695_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l113_c4_f695_return_output := value_MUX_uxn_device_h_l113_c4_f695_return_output;

     -- Submodule level 10
     VAR_value_MUX_uxn_device_h_l112_c3_9d72_iftrue := VAR_value_MUX_uxn_device_h_l113_c4_f695_return_output;
     VAR_value_MUX_uxn_device_h_l95_c7_5ace_iftrue := VAR_value_MUX_uxn_device_h_l97_c3_2da7_return_output;
     -- value_MUX[uxn_device_h_l112_c3_9d72] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l112_c3_9d72_cond <= VAR_value_MUX_uxn_device_h_l112_c3_9d72_cond;
     value_MUX_uxn_device_h_l112_c3_9d72_iftrue <= VAR_value_MUX_uxn_device_h_l112_c3_9d72_iftrue;
     value_MUX_uxn_device_h_l112_c3_9d72_iffalse <= VAR_value_MUX_uxn_device_h_l112_c3_9d72_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l112_c3_9d72_return_output := value_MUX_uxn_device_h_l112_c3_9d72_return_output;

     -- Submodule level 11
     VAR_value_MUX_uxn_device_h_l111_c7_2403_iftrue := VAR_value_MUX_uxn_device_h_l112_c3_9d72_return_output;
     -- value_MUX[uxn_device_h_l111_c7_2403] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l111_c7_2403_cond <= VAR_value_MUX_uxn_device_h_l111_c7_2403_cond;
     value_MUX_uxn_device_h_l111_c7_2403_iftrue <= VAR_value_MUX_uxn_device_h_l111_c7_2403_iftrue;
     value_MUX_uxn_device_h_l111_c7_2403_iffalse <= VAR_value_MUX_uxn_device_h_l111_c7_2403_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l111_c7_2403_return_output := value_MUX_uxn_device_h_l111_c7_2403_return_output;

     -- Submodule level 12
     VAR_value_MUX_uxn_device_h_l95_c7_5ace_iffalse := VAR_value_MUX_uxn_device_h_l111_c7_2403_return_output;
     -- value_MUX[uxn_device_h_l95_c7_5ace] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l95_c7_5ace_cond <= VAR_value_MUX_uxn_device_h_l95_c7_5ace_cond;
     value_MUX_uxn_device_h_l95_c7_5ace_iftrue <= VAR_value_MUX_uxn_device_h_l95_c7_5ace_iftrue;
     value_MUX_uxn_device_h_l95_c7_5ace_iffalse <= VAR_value_MUX_uxn_device_h_l95_c7_5ace_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l95_c7_5ace_return_output := value_MUX_uxn_device_h_l95_c7_5ace_return_output;

     -- Submodule level 13
     VAR_value_MUX_uxn_device_h_l88_c2_8828_iffalse := VAR_value_MUX_uxn_device_h_l95_c7_5ace_return_output;
     -- value_MUX[uxn_device_h_l88_c2_8828] LATENCY=0
     -- Inputs
     value_MUX_uxn_device_h_l88_c2_8828_cond <= VAR_value_MUX_uxn_device_h_l88_c2_8828_cond;
     value_MUX_uxn_device_h_l88_c2_8828_iftrue <= VAR_value_MUX_uxn_device_h_l88_c2_8828_iftrue;
     value_MUX_uxn_device_h_l88_c2_8828_iffalse <= VAR_value_MUX_uxn_device_h_l88_c2_8828_iffalse;
     -- Outputs
     VAR_value_MUX_uxn_device_h_l88_c2_8828_return_output := value_MUX_uxn_device_h_l88_c2_8828_return_output;

     -- Submodule level 14
     REG_VAR_value := VAR_value_MUX_uxn_device_h_l88_c2_8828_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_dei_mask <= REG_VAR_dei_mask;
REG_COMB_is_event16 <= REG_VAR_is_event16;
REG_COMB_d <= REG_VAR_d;
REG_COMB_dev_ram_at_addr <= REG_VAR_dev_ram_at_addr;
REG_COMB_value <= REG_VAR_value;
REG_COMB_is_event <= REG_VAR_is_event;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     dei_mask <= REG_COMB_dei_mask;
     is_event16 <= REG_COMB_is_event16;
     d <= REG_COMB_d;
     dev_ram_at_addr <= REG_COMB_dev_ram_at_addr;
     value <= REG_COMB_value;
     is_event <= REG_COMB_is_event;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
