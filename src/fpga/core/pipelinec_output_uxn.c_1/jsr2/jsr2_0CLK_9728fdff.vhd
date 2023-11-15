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
-- BIN_OP_EQ[uxn_opcodes_h_l745_c6_9572]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l745_c1_93f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l745_c2_efd6]
signal result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l745_c2_efd6]
signal t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l746_c3_cfd9[uxn_opcodes_h_l746_c3_cfd9]
signal printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l750_c11_c6ab]
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l750_c7_2d8e]
signal t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l753_c11_49a1]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l753_c7_3c81]
signal result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l753_c7_3c81]
signal t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l755_c3_2902]
signal CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l757_c11_8c37]
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l757_c7_c216]
signal result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l757_c7_c216]
signal t16_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l758_c3_4dad]
signal BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l760_c30_3d3b]
signal sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l762_c11_b30d]
signal BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l762_c7_1762]
signal result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l769_c11_f020]
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l769_c7_07db]
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l772_c31_905c]
signal CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l776_c11_1c55]
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_7e61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_7e61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_7e61]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_7e61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u16_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572
BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6
result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6
result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6
result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6
result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6
result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- t16_MUX_uxn_opcodes_h_l745_c2_efd6
t16_MUX_uxn_opcodes_h_l745_c2_efd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond,
t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue,
t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse,
t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

-- printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9
printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9 : entity work.printf_uxn_opcodes_h_l746_c3_cfd9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab
BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left,
BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right,
BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e
result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e
result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- t16_MUX_uxn_opcodes_h_l750_c7_2d8e
t16_MUX_uxn_opcodes_h_l750_c7_2d8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond,
t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue,
t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse,
t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1
BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81
result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81
result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- t16_MUX_uxn_opcodes_h_l753_c7_3c81
t16_MUX_uxn_opcodes_h_l753_c7_3c81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond,
t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue,
t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse,
t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output);

-- CONST_SL_8_uxn_opcodes_h_l755_c3_2902
CONST_SL_8_uxn_opcodes_h_l755_c3_2902 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x,
CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left,
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right,
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216
result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216
result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216
result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond,
result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- t16_MUX_uxn_opcodes_h_l757_c7_c216
t16_MUX_uxn_opcodes_h_l757_c7_c216 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l757_c7_c216_cond,
t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue,
t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse,
t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad
BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left,
BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right,
BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output);

-- sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b
sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins,
sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x,
sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y,
sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d
BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left,
BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right,
BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762
result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762
result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762
result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762
result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond,
result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020
BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db
result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db
result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output);

-- CONST_SR_8_uxn_opcodes_h_l772_c31_905c
CONST_SR_8_uxn_opcodes_h_l772_c31_905c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x,
CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55
BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output,
 CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output,
 BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output,
 sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output,
 CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6ad6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_6b46 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_0671 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l764_c3_6e74 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l767_c21_e40e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_4ab3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l772_c21_c9a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l754_l758_DUPLICATE_0d0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc_uxn_opcodes_h_l783_l741_DUPLICATE_576e_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_0671 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_0671;
     VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_4ab3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_4ab3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_6b46 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_6b46;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6ad6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_6ad6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l764_c3_6e74 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l764_c3_6e74;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l760_c30_3d3b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_ins;
     sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_x;
     sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output := sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l767_c21_e40e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l767_c21_e40e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l776_c11_1c55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_left;
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output := BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l750_c11_c6ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l769_c11_f020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_left;
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output := BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l745_c6_9572] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l772_c31_905c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output := CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l762_c11_b30d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_left;
     BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output := BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l753_c11_49a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l757_c11_8c37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_left;
     BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output := BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l754_l758_DUPLICATE_0d0b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l754_l758_DUPLICATE_0d0b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c6_9572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_c6ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_49a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8c37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c11_b30d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_f020_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_1c55_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l754_l758_DUPLICATE_0d0b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l754_l758_DUPLICATE_0d0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l767_c21_e40e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l750_l762_l753_l745_DUPLICATE_e3dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l769_l762_l757_l753_l750_l745_DUPLICATE_7e12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l776_l769_l762_l757_l753_l750_DUPLICATE_92ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l762_l757_l753_l750_l745_DUPLICATE_4d32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l769_l762_l753_l750_l745_DUPLICATE_af46_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_cebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l776_l769_l757_l753_l750_l745_DUPLICATE_ebc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l769_l757_DUPLICATE_d6b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l769_l757_l753_l750_l745_DUPLICATE_ed63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l760_c30_3d3b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_7e61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l772_c21_c9a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l772_c21_c9a8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l772_c31_905c_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l755_c3_2902] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x <= VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output := CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_7e61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l758_c3_4dad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_left;
     BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output := BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_7e61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_7e61] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l745_c1_93f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l758_c3_4dad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l772_c21_c9a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l755_c3_2902_return_output;
     VAR_printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l745_c1_93f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_7e61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- t16_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output := t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- printf_uxn_opcodes_h_l746_c3_cfd9[uxn_opcodes_h_l746_c3_cfd9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l746_c3_cfd9_uxn_opcodes_h_l746_c3_cfd9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_07db] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_07db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_t16_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- t16_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l762_c7_1762] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_cond;
     result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output := result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l762_c7_1762_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l757_c7_c216] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- t16_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l757_c7_c216_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- t16_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c7_3c81] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c7_3c81_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l750_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l750_c7_2d8e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l745_c2_efd6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output := result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc_uxn_opcodes_h_l783_l741_DUPLICATE_576e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc_uxn_opcodes_h_l783_l741_DUPLICATE_576e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l745_c2_efd6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l745_c2_efd6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc_uxn_opcodes_h_l783_l741_DUPLICATE_576e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dbc_uxn_opcodes_h_l783_l741_DUPLICATE_576e_return_output;
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
