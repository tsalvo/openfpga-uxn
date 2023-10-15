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
-- Submodules: 80
entity sth2_0CLK_f1f3c8fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_f1f3c8fd;
architecture arch of sth2_0CLK_f1f3c8fd is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2637_c6_f10e]
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2637_c2_c6e6]
signal t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2642_c11_b499]
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2642_c7_3fc5]
signal t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_7b3f]
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2645_c7_e8c4]
signal t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2647_c3_6057]
signal CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2650_c11_bf9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2650_c7_4e4e]
signal t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_36c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c7_5ecb]
signal t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2654_c3_1116]
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2656_c32_5a37]
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2656_c32_f74a]
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2656_c32_1ab6]
signal MUX_uxn_opcodes_h_l2656_c32_1ab6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_69b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_013f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2662_c11_630a]
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2662_c7_f518]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_b818]
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2668_c7_e281]
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_e281]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e281]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e281]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e281]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2670_c34_5236]
signal CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_79c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2672_c7_5e7d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_5e7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_5e7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_77cf( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left,
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right,
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2637_c2_c6e6
t16_MUX_uxn_opcodes_h_l2637_c2_c6e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond,
t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue,
t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse,
t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left,
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right,
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- t16_MUX_uxn_opcodes_h_l2642_c7_3fc5
t16_MUX_uxn_opcodes_h_l2642_c7_3fc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond,
t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue,
t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse,
t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- t16_MUX_uxn_opcodes_h_l2645_c7_e8c4
t16_MUX_uxn_opcodes_h_l2645_c7_e8c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond,
t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue,
t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse,
t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2647_c3_6057
CONST_SL_8_uxn_opcodes_h_l2647_c3_6057 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x,
CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- t16_MUX_uxn_opcodes_h_l2650_c7_4e4e
t16_MUX_uxn_opcodes_h_l2650_c7_4e4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond,
t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue,
t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse,
t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c7_5ecb
t16_MUX_uxn_opcodes_h_l2653_c7_5ecb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond,
t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116
BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37
BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left,
BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right,
BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a
BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left,
BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right,
BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output);

-- MUX_uxn_opcodes_h_l2656_c32_1ab6
MUX_uxn_opcodes_h_l2656_c32_1ab6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2656_c32_1ab6_cond,
MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue,
MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse,
MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left,
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right,
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2670_c34_5236
CONST_SR_8_uxn_opcodes_h_l2670_c34_5236 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x,
CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output,
 CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output,
 MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output,
 CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a4f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_9ebb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_cace : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_3573 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_806f : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_7351 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_3c99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_c74e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_3570_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_3513_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77cf_uxn_opcodes_h_l2678_l2633_DUPLICATE_d666_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_806f := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_806f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_7351 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_7351;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_9ebb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_9ebb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_3573 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_3573;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_cace := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_cace;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a4f0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a4f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_c74e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_c74e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right := to_unsigned(4, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_3513 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_3513_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_36c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2650_c11_bf9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2662_c11_630a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_7b3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2656_c32_5a37] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_left;
     BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output := BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2666_c24_3c99] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_3c99_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2642_c11_b499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_left;
     BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output := BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_69b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_b818] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_left;
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output := BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2670_c34_5236] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output := CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2637_c6_f10e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_79c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_5a37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_f10e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_b499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_7b3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_bf9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_36c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_69b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_630a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_b818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_79c8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_3513_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_3513_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_3c99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_DUPLICATE_7190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2662_DUPLICATE_23ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2658_l2650_l2645_l2642_l2637_l2662_DUPLICATE_c4e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2653_l2650_l2645_l2672_l2642_l2668_l2637_l2662_DUPLICATE_6808_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2672_l2642_l2668_l2637_DUPLICATE_cfb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_1acd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2658_l2653_l2650_l2645_l2642_l2668_l2637_DUPLICATE_9296_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2672_c7_5e7d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2647_c3_6057] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output := CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_5e7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2670_c24_3570] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_3570_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_5236_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2654_c3_1116] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_left;
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output := BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_e281] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2656_c32_f74a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_left;
     BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output := BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_5e7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_f74a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_1116_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_3570_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_6057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_5e7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e281] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e281] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e281] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;

     -- t16_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2668_c7_e281] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output := result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- MUX[uxn_opcodes_h_l2656_c32_1ab6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2656_c32_1ab6_cond <= VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_cond;
     MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue <= VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iftrue;
     MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse <= VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output := MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue := VAR_MUX_uxn_opcodes_h_l2656_c32_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e281_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2662_c7_f518] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f518_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_013f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_013f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_5ecb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_5ecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2650_c7_4e4e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4e4e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_e8c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_e8c4_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2642_c7_3fc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_3fc5_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2637_c2_c6e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_77cf_uxn_opcodes_h_l2678_l2633_DUPLICATE_d666 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77cf_uxn_opcodes_h_l2678_l2633_DUPLICATE_d666_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_77cf(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_c6e6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77cf_uxn_opcodes_h_l2678_l2633_DUPLICATE_d666_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77cf_uxn_opcodes_h_l2678_l2633_DUPLICATE_d666_return_output;
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
