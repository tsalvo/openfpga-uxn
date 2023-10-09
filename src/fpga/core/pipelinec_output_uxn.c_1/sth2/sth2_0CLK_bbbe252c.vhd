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
-- Submodules: 87
entity sth2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_bbbe252c;
architecture arch of sth2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2767_c6_da78]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_ea3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2767_c2_a54a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2768_c3_a5d5[uxn_opcodes_h_l2768_c3_a5d5]
signal printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_0cfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2773_c7_87ee]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_6cc1]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2776_c7_54f6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2778_c3_a621]
signal CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_1156]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2781_c7_6f31]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_f0f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2784_c7_f040]
signal t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2784_c7_f040]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2785_c3_53e3]
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2788_c32_3a80]
signal BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2788_c32_c8be]
signal BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2788_c32_19f4]
signal MUX_uxn_opcodes_h_l2788_c32_19f4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2788_c32_19f4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_544b]
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_6048]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_f1e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_83a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2800_c11_380d]
signal BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2800_c7_5981]
signal result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2800_c7_5981]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2800_c7_5981]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2800_c7_5981]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2800_c7_5981]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2802_c34_ac8b]
signal CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_bf1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_1982]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_1982]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2804_c7_1982]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78
BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output);

-- t16_MUX_uxn_opcodes_h_l2767_c2_a54a
t16_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a
result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a
result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a
result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a
result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

-- printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5
printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5 : entity work.printf_uxn_opcodes_h_l2768_c3_a5d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output);

-- t16_MUX_uxn_opcodes_h_l2773_c7_87ee
t16_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee
result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee
result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output);

-- t16_MUX_uxn_opcodes_h_l2776_c7_54f6
t16_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6
result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2778_c3_a621
CONST_SL_8_uxn_opcodes_h_l2778_c3_a621 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x,
CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output);

-- t16_MUX_uxn_opcodes_h_l2781_c7_6f31
t16_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31
result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output);

-- t16_MUX_uxn_opcodes_h_l2784_c7_f040
t16_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040
result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040
result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3
BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left,
BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right,
BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80
BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left,
BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right,
BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be
BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left,
BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right,
BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output);

-- MUX_uxn_opcodes_h_l2788_c32_19f4
MUX_uxn_opcodes_h_l2788_c32_19f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2788_c32_19f4_cond,
MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue,
MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse,
MUX_uxn_opcodes_h_l2788_c32_19f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d
BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left,
BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right,
BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981
result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond,
result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981
result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981
result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b
CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x,
CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output,
 t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output,
 t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output,
 t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output,
 CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output,
 t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output,
 t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output,
 MUX_uxn_opcodes_h_l2788_c32_19f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output,
 CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2770_c3_411a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_3a9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2722 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_4674 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2792_c3_115f : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2797_c3_998e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2798_c24_c7d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_caf3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c24_1313_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2785_l2777_DUPLICATE_484c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd_uxn_opcodes_h_l2763_l2810_DUPLICATE_28b5_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_caf3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_caf3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2770_c3_411a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2770_c3_411a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_3a9c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_3a9c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2722 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2722;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2797_c3_998e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2797_c3_998e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_4674 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_4674;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2792_c3_115f := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2792_c3_115f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2802_c34_ac8b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output := CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2800_c11_380d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c6_da78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_0cfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_f1e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2785_l2777_DUPLICATE_484c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2785_l2777_DUPLICATE_484c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2798_c24_c7d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2798_c24_c7d9_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_bf1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_6cc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2788_c32_3a80] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_left;
     BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output := BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_1156] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_f0f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_544b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2788_c32_3a80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c6_da78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_0cfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_6cc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_1156_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_f0f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_544b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_f1e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2800_c11_380d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_bf1e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2785_l2777_DUPLICATE_484c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2785_l2777_DUPLICATE_484c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2798_c24_c7d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2790_l2781_DUPLICATE_1519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2794_l2790_l2784_l2781_DUPLICATE_dfa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2776_l2773_l2767_l2794_l2790_l2781_DUPLICATE_0922_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2794_l2784_l2781_DUPLICATE_bdc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2776_l2781_l2773_l2784_DUPLICATE_0d8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2776_l2804_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_4c74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2800_l2790_l2784_DUPLICATE_a3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2776_l2773_l2800_l2767_l2790_l2784_l2781_DUPLICATE_eef8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_1982] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2802_c24_1313] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c24_1313_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2802_c34_ac8b_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2804_c7_1982] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_1982] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2778_c3_a621] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output := CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_ea3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2788_c32_c8be] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_left;
     BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output := BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2800_c7_5981] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2785_c3_53e3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_left;
     BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output := BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2788_c32_c8be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_53e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c24_1313_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2778_c3_a621_return_output;
     VAR_printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_ea3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_1982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;
     -- MUX[uxn_opcodes_h_l2788_c32_19f4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2788_c32_19f4_cond <= VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_cond;
     MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue <= VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iftrue;
     MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse <= VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_return_output := MUX_uxn_opcodes_h_l2788_c32_19f4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2800_c7_5981] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2800_c7_5981] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2800_c7_5981] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output := result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2800_c7_5981] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;

     -- printf_uxn_opcodes_h_l2768_c3_a5d5[uxn_opcodes_h_l2768_c3_a5d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2768_c3_a5d5_uxn_opcodes_h_l2768_c3_a5d5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- t16_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue := VAR_MUX_uxn_opcodes_h_l2788_c32_19f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2800_c7_5981_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_83a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_83a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- t16_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_6048] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output := result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_6048_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2784_c7_f040] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2784_c7_f040_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_6f31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;

     -- t16_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_6f31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2776_c7_54f6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_54f6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2773_c7_87ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2773_c7_87ee_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2767_c2_a54a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd_uxn_opcodes_h_l2763_l2810_DUPLICATE_28b5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd_uxn_opcodes_h_l2763_l2810_DUPLICATE_28b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2767_c2_a54a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd_uxn_opcodes_h_l2763_l2810_DUPLICATE_28b5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f6cd_uxn_opcodes_h_l2763_l2810_DUPLICATE_28b5_return_output;
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
