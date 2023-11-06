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
-- BIN_OP_EQ[uxn_opcodes_h_l753_c6_0312]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_3002]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_8915]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l753_c2_8915]
signal t16_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l754_c3_e184[uxn_opcodes_h_l754_c3_e184]
signal printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_5545]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_62f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l758_c7_62f0]
signal t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l761_c11_51dd]
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_325a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l761_c7_325a]
signal t16_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l763_c3_4e70]
signal CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l765_c11_8a29]
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_cb20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l765_c7_cb20]
signal t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l766_c3_4626]
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l768_c30_cf7a]
signal sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l770_c11_5e60]
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_334a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_7f67]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_ff4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l780_c31_6a0e]
signal CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_c91f]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_909d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_909d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_909d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_909d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3b30( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312
BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- t16_MUX_uxn_opcodes_h_l753_c2_8915
t16_MUX_uxn_opcodes_h_l753_c2_8915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l753_c2_8915_cond,
t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue,
t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse,
t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

-- printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184
printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184 : entity work.printf_uxn_opcodes_h_l754_c3_e184_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545
BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0
result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0
result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- t16_MUX_uxn_opcodes_h_l758_c7_62f0
t16_MUX_uxn_opcodes_h_l758_c7_62f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond,
t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue,
t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse,
t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd
BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a
result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a
result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- t16_MUX_uxn_opcodes_h_l761_c7_325a
t16_MUX_uxn_opcodes_h_l761_c7_325a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l761_c7_325a_cond,
t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue,
t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse,
t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l763_c3_4e70
CONST_SL_8_uxn_opcodes_h_l763_c3_4e70 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x,
CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29
BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20
result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20
result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- t16_MUX_uxn_opcodes_h_l765_c7_cb20
t16_MUX_uxn_opcodes_h_l765_c7_cb20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond,
t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue,
t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse,
t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l766_c3_4626
BIN_OP_OR_uxn_opcodes_h_l766_c3_4626 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left,
BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right,
BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output);

-- sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a
sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins,
sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x,
sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y,
sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60
BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a
result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a
result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67
BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f
result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f
result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e
CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x,
CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output,
 CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output,
 BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output,
 sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output,
 CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_51df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_870c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_0073 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_bb4c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_5a3b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ffbf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_6724_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_2735_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l791_l749_DUPLICATE_1f44_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_bb4c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_bb4c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_870c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_870c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ffbf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ffbf;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_51df := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_51df;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_0073 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_0073;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l753_c6_0312] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_c91f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l765_c11_8a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l770_c11_5e60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_left;
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output := BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l768_c30_cf7a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_ins;
     sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_x;
     sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output := sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l761_c11_51dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_2735 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_2735_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l780_c31_6a0e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output := CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_7f67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_5545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c21_5a3b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_5a3b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_0312_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_5545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_51dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_8a29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_5e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_7f67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c91f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_2735_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l762_l766_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_5a3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l758_l770_l761_l753_DUPLICATE_7594_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l777_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l765_l761_l758_l784_l777_DUPLICATE_f24a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l765_l761_l758_l753_l784_DUPLICATE_24a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l770_l761_l758_l753_l777_DUPLICATE_dfbe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_2896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_20ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l765_l761_l777_DUPLICATE_ed2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_cdc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_cf7a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l766_c3_4626] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_left;
     BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output := BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l763_c3_4e70] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x <= VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output := CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_3002] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_909d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_909d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l780_c21_6724] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_6724_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_6a0e_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_909d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_909d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_4626_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_6724_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_4e70_return_output;
     VAR_printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_3002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_909d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_909d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_909d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_909d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- printf_uxn_opcodes_h_l754_c3_e184[uxn_opcodes_h_l754_c3_e184] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l754_c3_e184_uxn_opcodes_h_l754_c3_e184_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- t16_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_ff4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_ff4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_334a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- t16_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output := t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_334a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l765_c7_cb20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output := result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_cb20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_t16_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     -- t16_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output := t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_325a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_325a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l753_c2_8915_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_62f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_62f0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l753_c2_8915] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_cond;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output := result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l791_l749_DUPLICATE_1f44 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l791_l749_DUPLICATE_1f44_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3b30(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8915_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8915_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l791_l749_DUPLICATE_1f44_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l791_l749_DUPLICATE_1f44_return_output;
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
