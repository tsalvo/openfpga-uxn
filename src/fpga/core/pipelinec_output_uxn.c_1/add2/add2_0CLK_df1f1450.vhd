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
-- Submodules: 114
entity add2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_df1f1450;
architecture arch of add2_0CLK_df1f1450 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l903_c6_b7b5]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l903_c1_c54d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c2_c5dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l904_c3_1d24[uxn_opcodes_h_l904_c3_1d24]
signal printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l908_c11_9d14]
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l908_c7_7df9]
signal tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l908_c7_7df9]
signal t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l908_c7_7df9]
signal n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_7df9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l911_c11_f7d9]
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_e5ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l916_c11_2aa7]
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l916_c7_b83b]
signal tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l916_c7_b83b]
signal t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l916_c7_b83b]
signal n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_b83b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l919_c11_12d6]
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l919_c7_1011]
signal tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l919_c7_1011]
signal t16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l919_c7_1011]
signal n16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_1011]
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l920_c3_04c8]
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_30b8]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l923_c7_cc24]
signal tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l923_c7_cc24]
signal n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_cc24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ff4d]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_27a2]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_27a2]
signal n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_27a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l931_c11_006c]
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l931_c7_8baa]
signal tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l931_c7_8baa]
signal n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_8baa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l934_c11_bc43]
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l934_c7_1894]
signal tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l934_c7_1894]
signal n16_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_1894]
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l935_c3_7cd2]
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l936_c11_ca81]
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l938_c32_e30a]
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l938_c32_c3e5]
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l938_c32_da65]
signal MUX_uxn_opcodes_h_l938_c32_da65_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_da65_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_da65_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l938_c32_da65_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_c71d]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_6a40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_6a40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_6a40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l940_c7_6a40]
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_6a40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l946_c11_6ba4]
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l946_c7_f593]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l946_c7_f593]
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_f593]
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_f593]
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l948_c34_411b]
signal CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l950_c11_2b02]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_7c67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_7c67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5
BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc
tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- t16_MUX_uxn_opcodes_h_l903_c2_c5dc
t16_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- n16_MUX_uxn_opcodes_h_l903_c2_c5dc
n16_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc
result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

-- printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24
printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24 : entity work.printf_uxn_opcodes_h_l904_c3_1d24_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output);

-- tmp16_MUX_uxn_opcodes_h_l908_c7_7df9
tmp16_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- t16_MUX_uxn_opcodes_h_l908_c7_7df9
t16_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- n16_MUX_uxn_opcodes_h_l908_c7_7df9
n16_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9
result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9
BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff
tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- t16_MUX_uxn_opcodes_h_l911_c7_e5ff
t16_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- n16_MUX_uxn_opcodes_h_l911_c7_e5ff
n16_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7
BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l916_c7_b83b
tmp16_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- t16_MUX_uxn_opcodes_h_l916_c7_b83b
t16_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- n16_MUX_uxn_opcodes_h_l916_c7_b83b
n16_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b
result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6
BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l919_c7_1011
tmp16_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond,
tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- t16_MUX_uxn_opcodes_h_l919_c7_1011
t16_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l919_c7_1011_cond,
t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- n16_MUX_uxn_opcodes_h_l919_c7_1011
n16_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l919_c7_1011_cond,
n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011
result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8
BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left,
BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right,
BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8
BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l923_c7_cc24
tmp16_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- n16_MUX_uxn_opcodes_h_l923_c7_cc24
n16_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24
result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_27a2
tmp16_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_27a2
n16_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2
result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c
BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l931_c7_8baa
tmp16_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- n16_MUX_uxn_opcodes_h_l931_c7_8baa
n16_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa
result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43
BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output);

-- tmp16_MUX_uxn_opcodes_h_l934_c7_1894
tmp16_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond,
tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- n16_MUX_uxn_opcodes_h_l934_c7_1894
n16_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l934_c7_1894_cond,
n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894
result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2
BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left,
BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right,
BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left,
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right,
BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a
BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left,
BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right,
BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5
BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left,
BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right,
BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output);

-- MUX_uxn_opcodes_h_l938_c32_da65
MUX_uxn_opcodes_h_l938_c32_da65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l938_c32_da65_cond,
MUX_uxn_opcodes_h_l938_c32_da65_iftrue,
MUX_uxn_opcodes_h_l938_c32_da65_iffalse,
MUX_uxn_opcodes_h_l938_c32_da65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d
BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4
BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593
result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output);

-- CONST_SR_8_uxn_opcodes_h_l948_c34_411b
CONST_SR_8_uxn_opcodes_h_l948_c34_411b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x,
CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02
BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output,
 tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output,
 tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output,
 tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output,
 BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output,
 tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output,
 tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output,
 BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output,
 BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output,
 MUX_uxn_opcodes_h_l938_c32_da65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output,
 CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_6445 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_b2e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_8192 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_daa5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_bff5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6ea1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_a6a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_d249 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l936_c3_0f6b : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_da65_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_da65_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_da65_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l938_c32_da65_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_4665 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_aabb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_277c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_0420_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_34dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l955_l899_DUPLICATE_c52b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l938_c32_da65_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_6445 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_6445;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_b2e4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_b2e4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_277c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l947_c3_277c;
     VAR_MUX_uxn_opcodes_h_l938_c32_da65_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6ea1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6ea1;
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_bff5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_bff5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_daa5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_daa5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_8192 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_8192;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_d249 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_d249;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_a6a7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_a6a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_4665 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_4665;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l919_c11_12d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_c71d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l946_c11_6ba4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_left;
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output := BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l931_c11_006c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_left;
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output := BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_30b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l934_c11_bc43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_left;
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output := BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l944_c24_aabb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_aabb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ff4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c11_2b02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l916_c11_2aa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l938_c32_e30a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_left;
     BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output := BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_34dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_34dd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l911_c11_f7d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c6_b7b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l948_c34_411b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output := CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l908_c11_9d14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_left;
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output := BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l938_c32_e30a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c6_b7b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9d14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_f7d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_2aa7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_12d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_30b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ff4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_006c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_bc43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_c71d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_6ba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_2b02_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l920_l935_l912_l927_DUPLICATE_26cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_aabb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l911_l934_DUPLICATE_5b5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l908_l931_l926_l923_l950_l919_l946_l916_l940_l911_l934_DUPLICATE_63d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l916_l940_l911_DUPLICATE_7b29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l950_l919_l946_l916_l911_l934_DUPLICATE_1993_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_34dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l946_l934_DUPLICATE_34dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l908_l931_l903_l926_l923_l919_l946_l916_l911_l934_DUPLICATE_6ade_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_6a40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l920_c3_04c8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_left;
     BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output := BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l935_c3_7cd2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_left;
     BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output := BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_7c67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l938_c32_c3e5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_left;
     BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output := BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_7c67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l946_c7_f593] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l903_c1_c54d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l948_c24_0420] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_0420_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l948_c34_411b_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l938_c32_da65_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l938_c32_c3e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l920_c3_04c8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right := VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l935_c3_7cd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l948_c24_0420_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l913_DUPLICATE_1bc3_return_output;
     VAR_printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l903_c1_c54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_7c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_7c67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l946_c7_f593_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_6a40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;

     -- n16_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output := n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- MUX[uxn_opcodes_h_l938_c32_da65] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l938_c32_da65_cond <= VAR_MUX_uxn_opcodes_h_l938_c32_da65_cond;
     MUX_uxn_opcodes_h_l938_c32_da65_iftrue <= VAR_MUX_uxn_opcodes_h_l938_c32_da65_iftrue;
     MUX_uxn_opcodes_h_l938_c32_da65_iffalse <= VAR_MUX_uxn_opcodes_h_l938_c32_da65_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l938_c32_da65_return_output := MUX_uxn_opcodes_h_l938_c32_da65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_f593] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_f593] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l946_c7_f593] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_cond;
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output := result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l936_c11_ca81] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_left;
     BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output := BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output;

     -- t16_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output := t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- printf_uxn_opcodes_h_l904_c3_1d24[uxn_opcodes_h_l904_c3_1d24] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l904_c3_1d24_uxn_opcodes_h_l904_c3_1d24_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l936_c3_0f6b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l936_c11_ca81_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_MUX_uxn_opcodes_h_l938_c32_da65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_f593_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_f593_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l946_c7_f593_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue := VAR_tmp16_uxn_opcodes_h_l936_c3_0f6b;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_6a40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_6a40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;

     -- n16_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- t16_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output := tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l940_c7_6a40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output := result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6a40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     -- n16_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_1894] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c7_1894_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     -- n16_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_8baa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_n16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c7_8baa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     -- n16_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output := n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- t16_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_27a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_27a2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output := tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- n16_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_cc24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l923_c7_cc24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- n16_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_1011] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_1011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- n16_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_b83b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_b83b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_e5ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e5ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_7df9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l908_c7_7df9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l903_c2_c5dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l955_l899_DUPLICATE_c52b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l955_l899_DUPLICATE_c52b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c2_c5dc_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l955_l899_DUPLICATE_c52b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l955_l899_DUPLICATE_c52b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
