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
-- Submodules: 78
entity jsr2_0CLK_9728fdff is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_9728fdff;
architecture arch of jsr2_0CLK_9728fdff is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l753_c6_e8e0]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_e53c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l753_c2_e3cb]
signal t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l754_c3_23a7[uxn_opcodes_h_l754_c3_23a7]
signal printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_80ef]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l758_c7_4d28]
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l758_c7_4d28]
signal t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l761_c11_d52a]
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l761_c7_d048]
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l761_c7_d048]
signal t16_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l763_c3_d343]
signal CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l765_c11_6c5a]
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l765_c7_543a]
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l765_c7_543a]
signal t16_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l766_c3_ccb9]
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l768_c30_ec5a]
signal sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l770_c11_bdb0]
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l770_c7_8e31]
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_8b6d]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_7c68]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l780_c31_2f7d]
signal CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_3863]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_169d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_169d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_169d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_169d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c785( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0
BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb
result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb
result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- t16_MUX_uxn_opcodes_h_l753_c2_e3cb
t16_MUX_uxn_opcodes_h_l753_c2_e3cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond,
t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue,
t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse,
t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

-- printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7
printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7 : entity work.printf_uxn_opcodes_h_l754_c3_23a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef
BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28
result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28
result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- t16_MUX_uxn_opcodes_h_l758_c7_4d28
t16_MUX_uxn_opcodes_h_l758_c7_4d28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond,
t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue,
t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse,
t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a
BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048
result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048
result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- t16_MUX_uxn_opcodes_h_l761_c7_d048
t16_MUX_uxn_opcodes_h_l761_c7_d048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l761_c7_d048_cond,
t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue,
t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse,
t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output);

-- CONST_SL_8_uxn_opcodes_h_l763_c3_d343
CONST_SL_8_uxn_opcodes_h_l763_c3_d343 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x,
CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a
BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a
result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a
result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- t16_MUX_uxn_opcodes_h_l765_c7_543a
t16_MUX_uxn_opcodes_h_l765_c7_543a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l765_c7_543a_cond,
t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue,
t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse,
t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9
BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left,
BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right,
BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a
sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins,
sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x,
sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y,
sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0
BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31
result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31
result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68
result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68
result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output);

-- CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d
CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x,
CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output,
 CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output,
 sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output,
 CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_f5b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_a314 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_010e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_8ae0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_c42e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_7409 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_be00_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_5ca4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c785_uxn_opcodes_h_l791_l749_DUPLICATE_a594_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_7409 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_7409;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_010e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_010e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_a314 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_a314;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_f5b8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_f5b8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_8ae0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_8ae0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_5ca4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_5ca4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l780_c31_2f7d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output := CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l765_c11_6c5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l753_c6_e8e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l761_c11_d52a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_left;
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output := BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c21_c42e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_c42e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l770_c11_bdb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l768_c30_ec5a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_ins;
     sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_x;
     sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output := sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_3863] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_80ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_8b6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_e8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_80ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_d52a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_6c5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_bdb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8b6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3863_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_5ca4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_5ca4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_c42e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_638a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_6401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_4806_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_5127_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_85f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_12c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_d6a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_7fd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_7937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_ec5a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l766_c3_ccb9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_left;
     BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output := BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_169d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l780_c21_be00] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_be00_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_2f7d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l763_c3_d343] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x <= VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output := CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_169d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_e53c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_169d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_169d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_ccb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_be00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_d343_return_output;
     VAR_printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_e53c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_169d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_169d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_169d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_169d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- printf_uxn_opcodes_h_l754_c3_23a7[uxn_opcodes_h_l754_c3_23a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l754_c3_23a7_uxn_opcodes_h_l754_c3_23a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- t16_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output := t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_7c68] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_7c68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_t16_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- t16_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output := t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l770_c7_8e31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output := result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_8e31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_t16_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- t16_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_543a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_543a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- t16_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_d048] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_d048_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l758_c7_4d28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output := result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_4d28_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_e3cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c785_uxn_opcodes_h_l791_l749_DUPLICATE_a594 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c785_uxn_opcodes_h_l791_l749_DUPLICATE_a594_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c785(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_e3cb_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c785_uxn_opcodes_h_l791_l749_DUPLICATE_a594_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c785_uxn_opcodes_h_l791_l749_DUPLICATE_a594_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
