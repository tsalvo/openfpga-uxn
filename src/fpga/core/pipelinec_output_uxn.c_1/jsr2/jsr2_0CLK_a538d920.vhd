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
-- Submodules: 109
entity jsr2_0CLK_a538d920 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_a538d920;
architecture arch of jsr2_0CLK_a538d920 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l876_c6_5e36]
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l876_c1_95fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l876_c2_b9e7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l877_c3_1445[uxn_opcodes_h_l877_c3_1445]
signal printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_b172]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l882_c7_fa0f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l885_c11_62b2]
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l885_c7_585e]
signal t16_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l885_c7_585e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l887_c3_02cd]
signal CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_bf3f]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l890_c7_2129]
signal t16_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l890_c7_2129]
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l893_c11_0c50]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l893_c7_d85d]
signal t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l893_c7_d85d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l894_c3_74f1]
signal BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l897_c32_bf5f]
signal BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l897_c32_a935]
signal BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l897_c32_016b]
signal MUX_uxn_opcodes_h_l897_c32_016b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l897_c32_016b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l897_c32_016b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l897_c32_016b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_5da1]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_08bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l903_c11_7e22]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_dba1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l909_c11_10d0]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l909_c7_d7fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l911_c34_1926]
signal CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_5204]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l913_c7_0a0c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l913_c7_0a0c]
signal result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_0a0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0a0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l913_c7_0a0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_75b6]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l918_c7_2b32]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_2b32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l918_c7_2b32]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_355a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.pc := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_stack_read := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36
BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output);

-- t16_MUX_uxn_opcodes_h_l876_c2_b9e7
t16_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7
result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7
result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7
result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

-- printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445
printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445 : entity work.printf_uxn_opcodes_h_l877_c3_1445_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172
BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output);

-- t16_MUX_uxn_opcodes_h_l882_c7_fa0f
t16_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f
result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f
result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f
result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2
BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output);

-- t16_MUX_uxn_opcodes_h_l885_c7_585e
t16_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l885_c7_585e_cond,
t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e
result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l885_c7_585e
result_pc_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e
result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e
result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l887_c3_02cd
CONST_SL_8_uxn_opcodes_h_l887_c3_02cd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x,
CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f
BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output);

-- t16_MUX_uxn_opcodes_h_l890_c7_2129
t16_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l890_c7_2129_cond,
t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129
result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_pc_MUX_uxn_opcodes_h_l890_c7_2129
result_pc_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129
result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129
result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129
result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50
BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output);

-- t16_MUX_uxn_opcodes_h_l893_c7_d85d
t16_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d
result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l893_c7_d85d
result_pc_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d
result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1
BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left,
BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right,
BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f
BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left,
BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right,
BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l897_c32_a935
BIN_OP_GT_uxn_opcodes_h_l897_c32_a935 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left,
BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right,
BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output);

-- MUX_uxn_opcodes_h_l897_c32_016b
MUX_uxn_opcodes_h_l897_c32_016b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l897_c32_016b_cond,
MUX_uxn_opcodes_h_l897_c32_016b_iftrue,
MUX_uxn_opcodes_h_l897_c32_016b_iffalse,
MUX_uxn_opcodes_h_l897_c32_016b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf
result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l899_c7_08bf
result_pc_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf
result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22
BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1
result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l903_c7_dba1
result_pc_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1
result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0
BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa
result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa
result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa
result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output);

-- CONST_SR_8_uxn_opcodes_h_l911_c34_1926
CONST_SR_8_uxn_opcodes_h_l911_c34_1926 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x,
CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c
result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond,
result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue,
result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse,
result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c
result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6
BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32
result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output,
 t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output,
 t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output,
 t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output,
 CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output,
 t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output,
 t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output,
 MUX_uxn_opcodes_h_l897_c32_016b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output,
 CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output,
 result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l879_c3_508b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l883_c3_837d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_d3ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l891_c3_43ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l897_c32_016b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l897_c32_016b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l897_c32_016b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l897_c32_016b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l901_c3_b3c0 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_8b9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l907_c24_bfec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_7b61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c24_0f1c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l894_l886_DUPLICATE_4ced_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l924_l872_DUPLICATE_d956_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right := to_unsigned(9, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_d3ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_d3ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_7b61 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_7b61;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l879_c3_508b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l879_c3_508b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l901_c3_b3c0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l901_c3_b3c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_8b9a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_8b9a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l897_c32_016b_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l883_c3_837d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l883_c3_837d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l897_c32_016b_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l891_c3_43ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l891_c3_43ad;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output := result.is_stack_read;

     -- CONST_SR_8[uxn_opcodes_h_l911_c34_1926] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x <= VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output := CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l897_c32_bf5f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_left;
     BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output := BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l876_c6_5e36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_left;
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output := BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l907_c24_bfec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l907_c24_bfec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l894_l886_DUPLICATE_4ced LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l894_l886_DUPLICATE_4ced_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l885_c11_62b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c11_7e22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_75b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c11_0c50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_5da1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_bf3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c11_10d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_5204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_b172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left := VAR_BIN_OP_AND_uxn_opcodes_h_l897_c32_bf5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_5e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_b172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_62b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_bf3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_0c50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_10d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_75b6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l894_l886_DUPLICATE_4ced_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l894_l886_DUPLICATE_4ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l907_c24_bfec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l899_DUPLICATE_dcde_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l903_l899_l893_DUPLICATE_8a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l903_l899_l893_DUPLICATE_73ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l890_l918_l885_l882_l909_l876_l903_l899_l893_DUPLICATE_dd36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l885_l882_l876_l903_l899_DUPLICATE_a23a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l890_l918_l885_l913_l882_l909_l876_l903_l893_DUPLICATE_a79f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l885_l890_l882_l893_DUPLICATE_2adc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l885_l913_l882_l909_l876_l899_l893_DUPLICATE_c611_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l899_l893_l909_DUPLICATE_23e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l885_l882_l909_l876_l899_l893_DUPLICATE_0dee_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_0a0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l894_c3_74f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_left;
     BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output := BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l918_c7_2b32] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l887_c3_02cd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output := CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l918_c7_2b32] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_2b32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l913_c7_0a0c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_cond;
     result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output := result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l897_c32_a935] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_left;
     BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output := BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l876_c1_95fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l911_c24_0f1c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c24_0f1c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c34_1926_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l897_c32_016b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l897_c32_a935_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l894_c3_74f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c24_0f1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l887_c3_02cd_return_output;
     VAR_printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l876_c1_95fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l918_c7_2b32_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l913_c7_0a0c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;

     -- t16_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- printf_uxn_opcodes_h_l877_c3_1445[uxn_opcodes_h_l877_c3_1445] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l877_c3_1445_uxn_opcodes_h_l877_c3_1445_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l913_c7_0a0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0a0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- MUX[uxn_opcodes_h_l897_c32_016b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l897_c32_016b_cond <= VAR_MUX_uxn_opcodes_h_l897_c32_016b_cond;
     MUX_uxn_opcodes_h_l897_c32_016b_iftrue <= VAR_MUX_uxn_opcodes_h_l897_c32_016b_iftrue;
     MUX_uxn_opcodes_h_l897_c32_016b_iffalse <= VAR_MUX_uxn_opcodes_h_l897_c32_016b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l897_c32_016b_return_output := MUX_uxn_opcodes_h_l897_c32_016b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue := VAR_MUX_uxn_opcodes_h_l897_c32_016b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l913_c7_0a0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_t16_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output := t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l909_c7_d7fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l909_c7_d7fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     -- t16_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output := t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_dba1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l903_c7_dba1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- t16_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l899_c7_08bf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l899_c7_08bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- t16_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l893_c7_d85d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l893_c7_d85d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l890_c7_2129] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l890_c7_2129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l885_c7_585e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_585e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l882_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l882_c7_fa0f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_b9e7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l924_l872_DUPLICATE_d956 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l924_l872_DUPLICATE_d956_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_355a(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l876_c2_b9e7_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l924_l872_DUPLICATE_d956_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_355a_uxn_opcodes_h_l924_l872_DUPLICATE_d956_return_output;
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
