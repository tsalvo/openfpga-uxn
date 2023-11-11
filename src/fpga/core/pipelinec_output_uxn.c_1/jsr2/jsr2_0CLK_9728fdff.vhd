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
-- BIN_OP_EQ[uxn_opcodes_h_l753_c6_053a]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_61ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l753_c2_7889]
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l753_c2_7889]
signal t16_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l754_c3_a47c[uxn_opcodes_h_l754_c3_a47c]
signal printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_f4fc]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l758_c7_3ecd]
signal t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l761_c11_5015]
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l761_c7_85a6]
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l761_c7_85a6]
signal t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l763_c3_9f26]
signal CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l765_c11_cccd]
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l765_c7_e497]
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l765_c7_e497]
signal t16_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l766_c3_6e8c]
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l768_c30_899a]
signal sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l770_c11_25d1]
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l770_c7_1327]
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_f7b4]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_e89a]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l780_c31_417f]
signal CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_a3a9]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_1571]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_1571]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_1571]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_1571]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a
BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889
result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889
result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- t16_MUX_uxn_opcodes_h_l753_c2_7889
t16_MUX_uxn_opcodes_h_l753_c2_7889 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l753_c2_7889_cond,
t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue,
t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse,
t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

-- printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c
printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c : entity work.printf_uxn_opcodes_h_l754_c3_a47c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc
BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd
result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd
result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- t16_MUX_uxn_opcodes_h_l758_c7_3ecd
t16_MUX_uxn_opcodes_h_l758_c7_3ecd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond,
t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue,
t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse,
t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6
result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6
result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- t16_MUX_uxn_opcodes_h_l761_c7_85a6
t16_MUX_uxn_opcodes_h_l761_c7_85a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond,
t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue,
t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse,
t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l763_c3_9f26
CONST_SL_8_uxn_opcodes_h_l763_c3_9f26 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x,
CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd
BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497
result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497
result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- t16_MUX_uxn_opcodes_h_l765_c7_e497
t16_MUX_uxn_opcodes_h_l765_c7_e497 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l765_c7_e497_cond,
t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue,
t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse,
t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c
BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left,
BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right,
BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l768_c30_899a
sp_relative_shift_uxn_opcodes_h_l768_c30_899a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins,
sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x,
sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y,
sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1
BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327
result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327
result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4
BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a
result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a
result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l780_c31_417f
CONST_SR_8_uxn_opcodes_h_l780_c31_417f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x,
CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9
BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output,
 CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output,
 BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output,
 sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output,
 CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_dbb2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_fc5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_43e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_9b63 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_8aff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_4745 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_58fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_6c15_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l791_l749_DUPLICATE_ca12_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_43e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_43e6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_dbb2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_dbb2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_9b63 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_9b63;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_4745 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_4745;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_fc5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_fc5b;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l780_c31_417f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output := CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_f7b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_6c15 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_6c15_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_a3a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l770_c11_25d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_f4fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l765_c11_cccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l768_c30_899a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_ins;
     sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_x;
     sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output := sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c21_8aff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_8aff_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l753_c6_053a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l761_c11_5015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_left;
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output := BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_053a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_f4fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_cccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_25d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_f7b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_a3a9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_6c15_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_6c15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_8aff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l761_l753_l758_DUPLICATE_93aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l753_DUPLICATE_ac09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l770_l765_l761_l758_l784_DUPLICATE_42f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_b0fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l770_l761_l758_l753_DUPLICATE_5450_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_1087_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_l784_DUPLICATE_91ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l761_l777_l765_DUPLICATE_200b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l777_l765_l761_l758_l753_DUPLICATE_9c49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_899a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_1571] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_1571] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l766_c3_6e8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_left;
     BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output := BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_1571] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l780_c21_58fa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_58fa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_417f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l763_c3_9f26] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x <= VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output := CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_61ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_1571] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_6e8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_58fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_9f26_return_output;
     VAR_printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_61ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_1571_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_1571_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_1571_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_1571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- t16_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output := t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_e89a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- printf_uxn_opcodes_h_l754_c3_a47c[uxn_opcodes_h_l754_c3_a47c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l754_c3_a47c_uxn_opcodes_h_l754_c3_a47c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_e89a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- t16_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_1327] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_1327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_e497] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- t16_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_e497_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_t16_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l761_c7_85a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output := t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_85a6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l753_c2_7889_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_3ecd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_3ecd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_7889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l791_l749_DUPLICATE_ca12 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l791_l749_DUPLICATE_ca12_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_7889_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_7889_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l791_l749_DUPLICATE_ca12_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l791_l749_DUPLICATE_ca12_return_output;
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
