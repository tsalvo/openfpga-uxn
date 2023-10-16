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
-- Submodules: 66
entity jsr_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_4f993427;
architecture arch of jsr_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l764_c6_1393]
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l764_c1_61f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c2_ce56]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l764_c2_ce56]
signal t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l765_c3_8cd8[uxn_opcodes_h_l765_c3_8cd8]
signal printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l769_c11_ab09]
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_298c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l769_c7_298c]
signal t8_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_4e0d]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l772_c7_0ec6]
signal t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l775_c30_cae9]
signal sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_5b0b]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_8991]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_3380]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_ff5c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l787_c31_cd8b]
signal CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l789_c22_93ea]
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l791_c11_62a4]
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_fd47]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l791_c7_fd47]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_fd47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_fd47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393
BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left,
BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right,
BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56
result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56
result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- t8_MUX_uxn_opcodes_h_l764_c2_ce56
t8_MUX_uxn_opcodes_h_l764_c2_ce56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond,
t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue,
t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse,
t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

-- printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8
printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8 : entity work.printf_uxn_opcodes_h_l765_c3_8cd8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09
BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c
result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c
result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- t8_MUX_uxn_opcodes_h_l769_c7_298c
t8_MUX_uxn_opcodes_h_l769_c7_298c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l769_c7_298c_cond,
t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue,
t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse,
t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d
BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6
result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6
result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- t8_MUX_uxn_opcodes_h_l772_c7_0ec6
t8_MUX_uxn_opcodes_h_l772_c7_0ec6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond,
t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue,
t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse,
t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l775_c30_cae9
sp_relative_shift_uxn_opcodes_h_l775_c30_cae9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins,
sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x,
sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y,
sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b
BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991
result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991
result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c
result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c
result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b
CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x,
CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left,
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right,
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4
BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output,
 sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output,
 CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_68c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_df45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_2d2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_99b2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_419c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l789_c3_df6e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_a454 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_423a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_92f5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l784_DUPLICATE_bca1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l798_l760_DUPLICATE_0470_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_a454 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_a454;
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_99b2 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_99b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_2d2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_2d2f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_68c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_68c8;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_df45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_df45;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output := result.is_sp_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l789_c27_92f5] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_92f5_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_5b0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l769_c11_ab09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_left;
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output := BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l787_c31_cd8b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output := CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_3380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l782_c21_419c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_419c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- sp_relative_shift[uxn_opcodes_h_l775_c30_cae9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_ins;
     sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_x;
     sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output := sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l764_c6_1393] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_left;
     BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output := BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_4e0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l784_DUPLICATE_bca1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l784_DUPLICATE_bca1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l791_c11_62a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_1393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_ab09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_4e0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_5b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_3380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_62a4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_92f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_419c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l764_l769_DUPLICATE_a34a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l784_l769_l772_l764_DUPLICATE_c186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l784_l791_l769_l772_DUPLICATE_d2d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l791_l769_l772_l764_DUPLICATE_4315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l764_l769_DUPLICATE_4e8f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_943e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l791_l769_l772_l764_DUPLICATE_01a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l784_DUPLICATE_bca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l772_l784_DUPLICATE_bca1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l772_l764_l769_DUPLICATE_3dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_cae9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_fd47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- t8_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_fd47] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l789_c22_93ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l764_c1_61f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l787_c21_423a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_423a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_cd8b_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_fd47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l791_c7_fd47] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l789_c3_df6e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_93ea_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_423a_return_output;
     VAR_printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_61f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_fd47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l789_c3_df6e;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- t8_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output := t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- printf_uxn_opcodes_h_l765_c3_8cd8[uxn_opcodes_h_l765_c3_8cd8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l765_c3_8cd8_uxn_opcodes_h_l765_c3_8cd8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_ff5c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_ff5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_t8_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- t8_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_8991] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_8991_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l772_c7_0ec6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output := result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_0ec6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_298c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_298c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c2_ce56] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l798_l760_DUPLICATE_0470 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l798_l760_DUPLICATE_0470_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_ce56_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_ce56_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l798_l760_DUPLICATE_0470_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l798_l760_DUPLICATE_0470_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
