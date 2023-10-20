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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 72
entity sth2_0CLK_862e49ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_862e49ca;
architecture arch of sth2_0CLK_862e49ca is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2574_c6_5efc]
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2574_c2_ca01]
signal t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9cb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_539e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2579_c7_539e]
signal t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_59b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_771c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2582_c7_771c]
signal t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2584_c3_6d7f]
signal CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_28e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_1366]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2587_c7_1366]
signal t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_c9f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2590_c7_50d8]
signal t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2591_c3_347e]
signal BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2593_c30_79fa]
signal sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_4e1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2595_c7_44a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_e8a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2602_c7_6f5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2605_c31_8b97]
signal CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_9dd3]
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_440a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2607_c7_440a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_440a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4605( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc
BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left,
BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right,
BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01
result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- t16_MUX_uxn_opcodes_h_l2574_c2_ca01
t16_MUX_uxn_opcodes_h_l2574_c2_ca01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond,
t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue,
t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse,
t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- t16_MUX_uxn_opcodes_h_l2579_c7_539e
t16_MUX_uxn_opcodes_h_l2579_c7_539e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond,
t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue,
t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse,
t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- t16_MUX_uxn_opcodes_h_l2582_c7_771c
t16_MUX_uxn_opcodes_h_l2582_c7_771c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond,
t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue,
t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse,
t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f
CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x,
CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- t16_MUX_uxn_opcodes_h_l2587_c7_1366
t16_MUX_uxn_opcodes_h_l2587_c7_1366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond,
t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue,
t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse,
t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8
result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8
result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- t16_MUX_uxn_opcodes_h_l2590_c7_50d8
t16_MUX_uxn_opcodes_h_l2590_c7_50d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond,
t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue,
t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse,
t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e
BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left,
BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right,
BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa
sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins,
sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x,
sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y,
sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4
result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f
result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97
CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x,
CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_e3fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_7651 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_feaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2588_c3_70f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_bbde : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2597_c3_4d07 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2600_c21_be00_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_d917 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_f26e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2583_l2591_DUPLICATE_c5ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2590_l2602_DUPLICATE_8278_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4605_uxn_opcodes_h_l2570_l2613_DUPLICATE_2d78_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2588_c3_70f6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2588_c3_70f6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_e3fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_e3fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_feaa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_feaa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_bbde := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_bbde;
     VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2597_c3_4d07 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2597_c3_4d07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_d917 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_d917;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_7651 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_7651;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_4e1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2593_c30_79fa] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_ins;
     sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_x;
     sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output := sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2600_c21_be00] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2600_c21_be00_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_c9f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2583_l2591_DUPLICATE_c5ed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2583_l2591_DUPLICATE_c5ed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2590_l2602_DUPLICATE_8278 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2590_l2602_DUPLICATE_8278_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_9dd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2605_c31_8b97] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output := CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2574_c6_5efc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9cb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_59b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_e8a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_28e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c6_5efc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9cb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_59b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_28e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_c9f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_4e1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e8a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_9dd3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2583_l2591_DUPLICATE_c5ed_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2583_l2591_DUPLICATE_c5ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2600_c21_be00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2595_l2587_DUPLICATE_e8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2602_l2595_l2590_l2587_DUPLICATE_4207_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2595_l2587_DUPLICATE_c0d8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_cdb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2582_l2579_l2607_l2574_l2602_l2590_l2587_DUPLICATE_7aec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2590_l2602_DUPLICATE_8278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2590_l2602_DUPLICATE_8278_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2582_l2579_l2574_l2602_l2590_l2587_DUPLICATE_f9ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2593_c30_79fa_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2584_c3_6d7f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output := CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_440a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2591_c3_347e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_left;
     BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output := BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2605_c21_f26e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_f26e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_8b97_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2607_c7_440a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_440a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2591_c3_347e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_f26e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2584_c3_6d7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_440a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_6f5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_6f5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2595_c7_44a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2595_c7_44a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- t16_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2590_c7_50d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2590_c7_50d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- t16_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_1366] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_1366_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_771c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_771c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_539e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_539e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2574_c2_ca01] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output := result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4605_uxn_opcodes_h_l2570_l2613_DUPLICATE_2d78 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4605_uxn_opcodes_h_l2570_l2613_DUPLICATE_2d78_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4605(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c2_ca01_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4605_uxn_opcodes_h_l2570_l2613_DUPLICATE_2d78_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4605_uxn_opcodes_h_l2570_l2613_DUPLICATE_2d78_return_output;
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
